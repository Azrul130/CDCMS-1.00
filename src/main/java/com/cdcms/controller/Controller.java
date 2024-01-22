/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cdcms.controller;

import com.cdcms.dao.ActivityDAO;
import com.cdcms.dao.AccountDAO;
import com.cdcms.model.activity;
import com.cdcms.model.highcouncil;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Azrul Hafizam
 */
@WebServlet("/")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class Controller extends HttpServlet {

    private AccountDAO dao;
    private ActivityDAO dao2;
    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;
    public static int BUFFER_SIZE = 1024 * 100;
    public static final String UPLOAD_DIR = "resources";
    public static String fileName = null;

    @Override
    public void init() {
        dao = new AccountDAO();
        dao2 = new ActivityDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/addHC":
                    AddHC(request, response);
                    break;

                case "/newact":
                    showNewFormAct(request, response);
                    break;
                case "/addact":
                    addAct(request, response);
                    break;
                case "/deleteact":
                    deleteAct(request, response);
                    break;
                case "/editact":
                    showEditFormAct(request, response);
                    break;
                case "/editact2":
                    showEditFormAct2(request, response);
                    break;
                case "/updateact":
                    updateAct(request, response);
                    break;
                case "/updateact2":
                    updateActStatus(request, response);
                    break;
                case "/proposal":
                    DownloadProposal(request, response);
                    break;
                case "/listacthc":
                    listActHc(request, response);
                    break;
                default:
                    listAct(request, response);
                    break;

                //------------------------------------------------------
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void AddHC(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String hcname = request.getParameter("name");
        String hcemail = request.getParameter("email");
        String hcpassword = request.getParameter("password");
        String hcphonenum = request.getParameter("phonenum");
        String hcbodynum = request.getParameter("bodynum");
        highcouncil HC = new highcouncil(hcname, hcemail, hcpassword, hcphonenum, hcbodynum);
        dao.addHC(HC);
        response.sendRedirect("LoginPage.jsp");
    }

    protected void listAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        List<activity> listAct = dao2.selectAllActivity();
        request.setAttribute("listAct", listAct);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ActivityAdvisor.jsp");
        dispatcher.forward(request, response);
    }

    protected void listActHc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String inputString = request.getParameter("highcouncil_id");
        if (inputString != null) {
            inputString = inputString.trim(); // Remove leading and trailing whitespaces
            int hcid = Integer.parseInt(inputString);
            List<activity> listActHc = dao2.selectActivityHC(hcid);
            request.setAttribute("listActHc", listActHc);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Activity.jsp");
            dispatcher.forward(request, response);
        } else {
            int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
            List<activity> listActHc = dao2.selectActivityHC(hcid);
            request.setAttribute("listActHc", listActHc);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Activity.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void showNewFormAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ActivityForm.jsp");
        dispatcher.forward(request, response);
    }

    protected void showEditFormAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int actid = Integer.parseInt(request.getParameter("activity_id"));
        activity existingAct = dao2.selectActivity(actid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ActivityUpdate.jsp");
        request.setAttribute("activity", existingAct);
        dispatcher.forward(request, response);
    }

    protected void showEditFormAct2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int actid = Integer.parseInt(request.getParameter("activity_id"));
        activity existingAct = dao2.selectActivity(actid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("StatusUpdate.jsp");
        request.setAttribute("activity", existingAct);
        dispatcher.forward(request, response);
    }

    protected void addAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/plain;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession(false);
            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;//for netbeans use this code
            //String uploadPath = request.getServletContext().getRealPath("") + folderName;//for eclipse use this code
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            activity act = new activity();
            act.setActivity_title(request.getParameter("title"));
            act.setActivity_description(request.getParameter("description"));
            act.setActivity_place(request.getParameter("place"));
            act.setActivity_date(request.getParameter("date"));
            act.setActivity_time(request.getParameter("time"));
            act.setActivity_status("Pending");
            Part filePart = request.getPart("proposal");
            String fileName = filePart.getSubmittedFileName();
            String path = folderName + File.separator + fileName;
            InputStream is = filePart.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);
            act.setActivity_proposalname(fileName);
            act.setActivity_proposalpath(path);
            act.setHighcouncil_id(Integer.parseInt(request.getParameter("highcouncil_id")));
            dao2.addActivity(act);
            int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
            RequestDispatcher rd = request.getRequestDispatcher("listacthc?highcouncil=" + hcid);
            rd.forward(request, response);

        } catch (IOException | ServletException e) {
            out.println("Exception: " + e);
            System.out.println("Exception2: " + e);
        }
    }

    protected void updateAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        activity act = new activity();
        int actid = Integer.parseInt(request.getParameter("activity_id"));
        act.setActivity_id(actid);
        act.setActivity_title(request.getParameter("title"));
        act.setActivity_description(request.getParameter("description"));
        act.setActivity_place(request.getParameter("place"));
        act.setActivity_date(request.getParameter("date"));
        act.setActivity_time(request.getParameter("time"));
        act.setActivity_status(request.getParameter("activity_status"));
        dao2.updateActivity(act);
        int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
        response.sendRedirect("listacthc?highcouncil_id=" + hcid);
    }

    protected void updateActStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        activity act = new activity();
        int actid = Integer.parseInt(request.getParameter("activity_id"));
        act.setActivity_id(actid);
        act.setActivity_title(request.getParameter("title"));
        act.setActivity_description(request.getParameter("description"));
        act.setActivity_place(request.getParameter("place"));
        act.setActivity_date(request.getParameter("date"));
        act.setActivity_time(request.getParameter("time"));
        act.setActivity_status(request.getParameter("status"));
        dao2.updateActivity(act);
        response.sendRedirect("listact");
    }

    protected void deleteAct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("activity_id"));
        dao2.deleteActivity(id);
        int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
        response.sendRedirect("listacthc?highcouncil_id=" + hcid);
    }

    protected void DownloadProposal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        /**
         * *** Get The Absolute Path Of The File To Be Downloaded ****
         */
        fileName = request.getParameter("activity_proposalname");
        if (fileName == null || fileName.equals("")) {
            /**
             * *** Set Response Content Type ****
             */
            response.setContentType("text/html");

            /**
             * *** Print The Response ****
             */
            response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
        } else {
            String applicationPath = getServletContext().getRealPath("");
            String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
            String filePath = downloadPath + File.separator + fileName;
            System.out.println(fileName);
            System.out.println(filePath);
            System.out.println("fileName:" + fileName);
            System.out.println("filePath :" + filePath);
            File file = new File(filePath);
            OutputStream outStream = null;
            FileInputStream inputStream = null;

            if (file.exists()) {

                /**
                 * ** Setting The Content Attributes For The Response Object
                 * ***
                 */
                String mimeType = "application/octet-stream";
                response.setContentType(mimeType);

                /**
                 * ** Setting The Headers For The Response Object ***
                 */
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
                response.setHeader(headerKey, headerValue);

                try {

                    /**
                     * ** Get The Output Stream Of The Response ***
                     */
                    outStream = response.getOutputStream();
                    inputStream = new FileInputStream(file);
                    byte[] buffer = new byte[BUFFER_SIZE];
                    int bytesRead = -1;

                    /**
                     * ** Write Each Byte Of Data Read From The Input Stream
                     * Write Each Byte Of Data Read From The Input Stream Into
                     * The Output Stream ***
                     */
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                } catch (IOException ioExObj) {
                    System.out.println("Exception While Performing The I/O Operation?= " + ioExObj.getMessage());
                } finally {
                    if (inputStream != null) {
                        inputStream.close();
                    }

                    outStream.flush();
                    if (outStream != null) {
                        outStream.close();
                    }
                }
            } else {

                /**
                 * *** Set Response Content Type ****
                 */
                response.setContentType("text/html");

                /**
                 * *** Print The Response ****
                 */
                response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
            }

        }

    }

}
