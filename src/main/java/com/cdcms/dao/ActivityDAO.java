/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.dao;

import com.cdcms.model.activity;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 *
 * @author Azrul Hafizam
 */
public class ActivityDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/cdcms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    static String url = "jdbc:mysql://localhost:3306/cdcms";
    static String username = "root";
    static String password = "admin";

    private static final String add_activity = "INSERT INTO activity(activity_title, activity_description, activity_place, activity_date, activity_time, activity_status, activity_proposalname, activity_proposalpath, highcouncil_id) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String select_activity_by_id = "select activity_id, activity_title, activity_description, activity_place, activity_date, activity_time, activity_status, activity_proposalname, activity_proposalpath from activity where activity_id =?";
    private static final String select_all_activity = "select * from activity";
    private static final String delete_activity = "delete from activity where activity_id=?";
    private static final String update_activity = "update activity set activity_title=?, activity_description=?, activity_place=?, activity_date=?, activity_time=?, activity_status=? where activity_id=?";
    private static final String update_actStatus = "update activity set activity_status=? where activity_id=?";
    private static final String select_activity_by_hcid = "select activity_id, activity_title, activity_description, activity_place, activity_date, activity_time, activity_status, activity_proposalname, activity_proposalpath, highcouncil_id from activity where highcouncil_id=?";

    public ActivityDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static Connection getConnection2() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return con;
    }

    public void addActivity(activity act) throws SQLException {
        System.out.println(add_activity);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(add_activity)) {
            ps.setString(1, act.getActivity_title());
            ps.setString(2, act.getActivity_description());
            ps.setString(3, act.getActivity_place());
            ps.setString(4, act.getActivity_date());
            ps.setString(5, act.getActivity_time());
            ps.setString(6, act.getActivity_status());
            ps.setString(7, act.getActivity_proposalname());
            ps.setString(8, act.getActivity_proposalpath());
            ps.setInt(9, act.getHighcouncil_id());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<activity> selectAllActivity() {
        List<activity> act = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(select_all_activity);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("activity_id");
                String title = rs.getString("activity_title");
                String des = rs.getString("activity_description");
                String place = rs.getString("activity_place");
                String date = rs.getString("activity_date");
                String time = rs.getString("activity_time");
                String status = rs.getString("activity_status");
                String proposalname = rs.getString("activity_proposalname");
                String proposalpath = rs.getString("activity_proposalpath");

                act.add(new activity(id, title, des, place, date, time, status, proposalname, proposalpath));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return act;
    }

    public boolean deleteActivity(int activity_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(delete_activity);) {
            statement.setInt(1, activity_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateActivity(activity act) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(update_activity);) {
            statement.setString(1, act.getActivity_title());
            statement.setString(2, act.getActivity_description());
            statement.setString(3, act.getActivity_place());
            statement.setString(4, act.getActivity_date());
            statement.setString(5, act.getActivity_time());
            statement.setString(6, act.getActivity_status());
            statement.setInt(7, act.getActivity_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public boolean updateActStatus(activity act) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(update_actStatus);) {
            statement.setString(1, act.getActivity_status());
            statement.setInt(2, act.getActivity_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public activity selectActivity(int activity_id) {
        activity act = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(select_activity_by_id);) {
            preparedStatement.setInt(1, activity_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String title = rs.getString("activity_title");
                String des = rs.getString("activity_description");
                String place = rs.getString("activity_place");
                String date = rs.getString("activity_date");
                String time = rs.getString("activity_time");
                String status = rs.getString("activity_status");
                String proposalname = rs.getString("activity_proposalname");
                String proposalpath = rs.getString("activity_proposalpath");
                act = new activity(activity_id, title, des, place, date, time, status, proposalname, proposalpath);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return act;
    }

    public List<activity> selectActivityHC(int highcouncil_id) {
        List<activity> act = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(select_activity_by_hcid);) {
            preparedStatement.setInt(1, highcouncil_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int actid = rs.getInt("activity_id");
                String title = rs.getString("activity_title");
                String des = rs.getString("activity_description");
                String place = rs.getString("activity_place");
                String date = rs.getString("activity_date");
                String time = rs.getString("activity_time");
                String status = rs.getString("activity_status");
                String proposalname = rs.getString("activity_proposalname");
                String proposalpath = rs.getString("activity_proposalpath");
                //byte[] photo = rs.getBytes("activity_photo");
                act.add(new activity(actid, title, des, place, date, time, status, proposalname, proposalpath, highcouncil_id));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return act;
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
