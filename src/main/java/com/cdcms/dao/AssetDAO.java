/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cdcms.dao;

import com.cdcms.model.asset;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

/**
 *
 * @author Azrul Hafizam
 */
public class AssetDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/cdcms";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    static String url = "jdbc:mysql://localhost:3306/cdcms";
    static String username = "root";
    static String password = "admin";

    private static final String add_asset = "insert into asset(asset_name, asset_quantity, asset_status, asset_photo) values (?, ?, ?, ?)";
    private static final String select_asset_by_id = "select asset_name, asset_quantity, asset_status, asset_photo from asset where asset_id =?";
    private static final String select_all_asset = "select * from asset";
    private static final String delete_asset = "delete from asset where asset_id=?";
    private static final String update_asset = "update asset set asset_name=?, asset_quantity=?, asset_status=? where asset_id=?";

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

    public void addAsset(asset ast) throws SQLException {
        System.out.println(add_asset);
        try (Connection connection = getConnection(); PreparedStatement ps = connection.prepareStatement(add_asset)) {
            ps.setString(1, ast.getAsset_name());
            ps.setInt(2, ast.getAsset_quantity());
            ps.setString(3, ast.getAsset_status());
            ps.setBytes(4, ast.getAsset_photo());
            System.out.println(ps);
            ps.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    public List<asset> viewallAsset() {
        List<asset> ast = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(select_all_asset);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("asset_id");
                String name = rs.getString("asset_name");
                int quantity = rs.getInt("asset_quantity");
                String status = rs.getString("asset_status");
                byte[] photo = rs.getBytes("asset_photo");
                ast.add(new asset(id, name, quantity, status, photo));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ast;
    }

    public asset viewallAsset_byID(int asset_id) {
        asset ast = null;
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(select_asset_by_id);) {
            preparedStatement.setInt(1, asset_id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("asset_name");
                int quantity = rs.getInt("asset_quantity");
                String status = rs.getString("asset_status");
                byte[] photo = rs.getBytes("asset_photo");
                ast = new asset(asset_id, name, quantity, status, photo);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return ast;
    }

    public boolean updateAsset(asset ast) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(update_asset);) {
            statement.setString(1, ast.getAsset_name());
            statement.setInt(2, ast.getAsset_quantity());
            statement.setString(3, ast.getAsset_status());
            statement.setInt(4, ast.getAsset_id());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public void deleteAsset(int asset_id) throws SQLException {
        try (Connection con = getConnection(); PreparedStatement ps = con.prepareStatement(delete_asset)) {
            ps.setInt(1, asset_id);
            ps.executeUpdate();
        }
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
