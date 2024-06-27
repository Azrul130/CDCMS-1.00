/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cdcms.controller;

import com.cdcms.dao.ActivityDAO;
import com.cdcms.dao.AccountDAO;
import com.cdcms.dao.AssetDAO;
import com.cdcms.model.activity;
import com.cdcms.model.asset;
import com.cdcms.model.highcouncil;
import com.cdcms.model.member;
import java.util.List;
import java.io.File;
import java.io.IOException;
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
    private AssetDAO dao3;
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
        dao3 = new AssetDAO();
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
                //Account Module -----------------------------------------------
                //Highcouncil***********************************************

                case "/addHC":
                    AddHC(request, response);
                    break;
                case "/viewhcprofile":
                    viewProfile(request, response);
                    break;
                case "/edithc":
                    updatehcForm(request, response);
                    break;
                case "/updatehc":
                    updatehc(request, response);
                    break;
                case "/deletehc":
                    deletehc(request, response);
                    break;

                //Member****************************************************
                case "/addMember":
                    addMember(request, response);
                    break;
                case "/viewmemberprofile":
                    viewMemberProfile(request, response);
                    break;
                case "/deletemember":
                    deleteMember(request, response);
                    break;
                case "/editmember":
                    updateMemberForm(request, response);
                    break;
                case "/updatemember":
                    updateMember(request, response);
                    break;

                //Activity Module ----------------------------------------------
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

                //Asset Module -------------------------------------------------
                case "/addAsset":
                    addAsset(request, response);
                    break;
                case "/newAsset":
                    showNewFormAst(request, response);
                    break;
                case "/editAst":
                    showEditFormAst(request, response);
                    break;
                case "/updateAsset":
                    updateAsset(request, response);
                    break;
                case "/listAsset":
                    listAsset(request, response);
                    break;
                case "/listAssetMember":
                    listAssetMember(request, response);
                    break;
                case "/deleteAsset":
                    deleteAsset(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    //Account Module
    //HIGHCOUNCIL
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

    protected void viewProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String inputString = request.getParameter("highcouncil_id");
        inputString = inputString.trim(); // Remove leading and trailing whitespaces
        int hcid = Integer.parseInt(inputString);
        highcouncil viewhc = dao.selectHC_byId(hcid);
        request.setAttribute("highcouncil", viewhc);
        RequestDispatcher dispatcher = request.getRequestDispatcher("profilehc.jsp");
        dispatcher.forward(request, response);
    }

    protected void updatehcForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int highcouncil_id = Integer.parseInt(request.getParameter("highcouncil_id"));
        highcouncil existinghc = dao.selectHC_byId(highcouncil_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("HcUpdateForm.jsp");
        request.setAttribute("highcouncil", existinghc);
        dispatcher.forward(request, response);
    }

    protected void updatehc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        highcouncil hc = new highcouncil();
        int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
        hc.setHighcouncil_id(hcid);
        hc.setHighcouncil_name(request.getParameter("name"));
        hc.setHighcouncil_email(request.getParameter("email"));
        hc.setHighcouncil_password(request.getParameter("password"));
        hc.setHighcouncil_phonenum(request.getParameter("phonenum"));
        hc.setHighcouncil_bodynum(request.getParameter("bodynum"));
        dao.Update_HC(hc);
        response.sendRedirect("viewhcprofile?highcouncil_id=" + hcid);
    }

    protected void deletehc(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("highcouncil_id"));
        dao.deletehc(id);
        int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
        response.sendRedirect("LoginPage.jsp");
    }

    //Member *******************************************************************
    protected void addMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String Mname = request.getParameter("name");
        String Memail = request.getParameter("email");
        String Mpassword = request.getParameter("password");
        String Mphonenum = request.getParameter("phonenum");
        String Mbodynum = request.getParameter("bodynum");
        member mbr = new member(Mname, Memail, Mpassword, Mphonenum, Mbodynum);
        dao.addMember(mbr);
        response.sendRedirect("LoginPage.jsp");
    }

    protected void viewMemberProfile(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String inputString = request.getParameter("member_id");
        inputString = inputString.trim(); // Remove leading and trailing whitespaces
        int mbrid = Integer.parseInt(inputString);
        member viewmember = dao.selectMember_byId(mbrid);
        request.setAttribute("member", viewmember);
        RequestDispatcher dispatcher = request.getRequestDispatcher("profileMember.jsp");
        dispatcher.forward(request, response);
    }


    protected void deleteMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("member_id"));
        dao.deleteMember(id);
        response.sendRedirect("LoginPage.jsp");
    }
    
        protected void updateMemberForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int member_id = Integer.parseInt(request.getParameter("member_id"));
        member member = dao.selectMember_byId(member_id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("MemberUpdateForm.jsp");
        request.setAttribute("member", member);
        dispatcher.forward(request, response);
    }

    protected void updateMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        member mbr = new member();
        int mbrid = Integer.parseInt(request.getParameter("member_id"));
        mbr.setMember_id(mbrid);
        mbr.setMember_name(request.getParameter("name"));
        mbr.setMember_email(request.getParameter("email"));
        mbr.setMember_password(request.getParameter("password"));
        mbr.setMember_phonenum(request.getParameter("phonenum"));
        mbr.setMember_bodynum(request.getParameter("bodynum"));
        dao.Update_Member(mbr);
  
        response.sendRedirect("viewmemberprofile?member_id=" + mbrid);
    }

    //Activity Module --------------------------------------------------------------------------------------------------
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
        int hcid = Integer.parseInt(request.getParameter("highcouncil_id"));
        int actid = Integer.parseInt(request.getParameter("activity_id"));
        act.setActivity_id(actid);
        act.setActivity_title(request.getParameter("title"));
        act.setActivity_description(request.getParameter("description"));
        act.setActivity_place(request.getParameter("place"));
        act.setActivity_date(request.getParameter("date"));
        act.setActivity_time(request.getParameter("time"));
        act.setActivity_status(request.getParameter("activity_status"));
        dao2.updateActivity(act);
        RequestDispatcher rd = request.getRequestDispatcher("listacthc?highcouncil_id=" + hcid);
        rd.forward(request, response);
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
        RequestDispatcher rd = request.getRequestDispatcher("listacthc?highcouncil=" + hcid);
        rd.forward(request, response);
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

    //Asset Module------------------------------------------------------------------------------------------------
    protected void showNewFormAst(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("AssetForm.jsp");
        dispatcher.forward(request, response);
    }

    protected void showEditFormAst(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int astid = Integer.parseInt(request.getParameter("asset_id"));
        asset existingAst = dao3.viewallAsset_byID(astid);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AssetUpdateForm.jsp");
        request.setAttribute("asset", existingAst);
        dispatcher.forward(request, response);
    }

    public void addAsset(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        asset ast = new asset();
        ast.setAsset_name(request.getParameter("name"));
        ast.setAsset_quantity(Integer.parseInt(request.getParameter("quantity")));
        ast.setAsset_status("Available");
        Part filePart = request.getPart("photo");
        InputStream fileContent = filePart.getInputStream();
        byte[] fileData = fileContent.readAllBytes();
        ast.setAsset_photo(fileData);
        dao3.addAsset(ast);
        RequestDispatcher rd = request.getRequestDispatcher("listAsset");
        rd.forward(request, response);
    }

    protected void listAsset(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        List<asset> listAsset = dao3.viewallAsset();
        session.setAttribute("listAsset", listAsset);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AssetList.jsp");
        dispatcher.forward(request, response);
    }

    protected void listAssetMember(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession();
        List<asset> listAsset = dao3.viewallAsset();
        session.setAttribute("listAsset", listAsset);
        RequestDispatcher dispatcher = request.getRequestDispatcher("AssetMember.jsp");
        dispatcher.forward(request, response);
    }

    protected void updateAsset(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        asset ast = new asset();
        int astid = Integer.parseInt(request.getParameter("asset_id"));
        ast.setAsset_id(astid);
        ast.setAsset_name(request.getParameter("name"));
        ast.setAsset_quantity(Integer.parseInt(request.getParameter("quantity")));
        ast.setAsset_status(request.getParameter("status"));
        dao3.updateAsset(ast);
        RequestDispatcher rd = request.getRequestDispatcher("listAsset");
        rd.forward(request, response);
    }

    protected void deleteAsset(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("asset_id"));
        dao3.deleteAsset(id);
        response.sendRedirect("listAsset");
    }
}
