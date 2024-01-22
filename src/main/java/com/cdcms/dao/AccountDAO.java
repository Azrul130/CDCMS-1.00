/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.dao;

import com.cdcms.model.highcouncil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Azrul Hafizam
 */
public class AccountDAO {

    private static final String jdbcURL = "jdbc:mysql://localhost:3306/cdcms";
    private static final String user = "root";
    private static final String pass = "admin";

    //sql for highcouncil
    private static final String Add_New_HC = "INSERT INTO highcouncil(highcouncil_name, highcouncil_email, highcouncil_password, highcouncil_phonenum, highcouncil_bodynum) values (?,?,?,?,?)";
    private static final String View_All_HC = "SELECT * FROM highcouncil";
    private static final String View_HC_By_Id = "SELECT * FROM highcouncil WHERE highcouncil_id = ?";
    private static final String Edit_HC = "UPDATE highcouncil SET highcouncil_name=?, highcouncil_email=?, highcouncil_password=?, highcouncil_phonenum=?, highcouncil_bodynum=? WHERE highcouncil_id=?";
    private static final String Delete_HC = "DELETE FROM highcouncil WHERE highcouncil_id=?";

    //sql for advisor
    private static final String Add_New_Advisor = "INSERT INTO advisor(advisor_name, advisor_email, advisor_password, advisor_phonenum, advisor_bodynum) values (?,?,?,?,?)";
    private static final String View_All_Advisor = "SELECT * FROM advisor";
    private static final String View_Advisor_By_Id = "SELECT * FROM advisor WHERE advisor_id = ?";
    private static final String Edit_Advisor = "UPDATE advisor SET advisor_name=?, advisor_email=?, advisor_password=?, advisor_phonenum=?, advisor_bodynum=? WHERE advisor_id=?";
    private static final String Delete_Advisor = "DELETE FROM advisor WHERE advisor_id=?";

    public AccountDAO() {
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, user, pass);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

//add high council
    public void addHC(highcouncil HC) throws SQLException {
        System.out.println(Add_New_HC);
        try {
            Connection con = AccountDAO.getConnection();
            PreparedStatement ps = con.prepareStatement(Add_New_HC);
            ps.setString(1, HC.getHighcouncil_name());
            ps.setString(2, HC.getHighcouncil_email());
            ps.setString(3, HC.getHighcouncil_password());
            ps.setString(4, HC.getHighcouncil_phonenum());
            ps.setString(5, HC.getHighcouncil_bodynum());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public highcouncil selectHC(int highcouncil_id) throws SQLException {
        highcouncil hclist = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(View_HC_By_Id);) {
            preparedStatement.setInt(1, highcouncil_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String hcname = rs.getString("name");
                String hcemail = rs.getString("email");
                String hcpassword = rs.getString("password");
                String hcphonenum = rs.getString("phonenum");
                String hcbodynum = rs.getString("bodynum");
                highcouncil HC = new highcouncil(highcouncil_id, hcname, hcemail, hcpassword, hcphonenum, hcbodynum);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hclist;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState  : " + ((SQLException) e).getSQLState());
                System.err.println("Error Coe : " + ((SQLException) e).getErrorCode());
                System.err.println("Message   : " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause : " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
