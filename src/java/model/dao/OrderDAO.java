package model.dao;

import model.Order;
import jdbc.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO implements DAO<Order> {

    private static final OrderDAO instance = new OrderDAO();

    public static OrderDAO getInstance() {
        return instance;
    }

 @Override
public List<Order> getAll() {
    List<Order> list = new ArrayList<>();

    try (Connection conn = JDBC.getConnection(); 
         PreparedStatement smt = conn.prepareStatement("SELECT o.id, u.username, o.user_id, o.total_price, o.payment, o.status, o.create_at FROM [order] o LEFT JOIN [user] u ON u.id = o.user_id")) {

        ResultSet rs = smt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String username = rs.getString("username");
            int user_id = rs.getInt("user_id");
            int total_price = rs.getInt("total_price");
            String payment = rs.getString("payment");
            String status = rs.getString("status");
            String start_date = rs.getString("create_at");

            list.add(new Order(id, username, user_id, total_price, payment, status, start_date));
        }
    } catch (SQLException ex) {
        // Xử lý ngoại lệ ở đây
        ex.printStackTrace();
    }

    return list;
}


    @Override
    public void insert(Order obj) {
        try (Connection conn = JDBC.getConnection(); PreparedStatement smt = conn.prepareStatement("INSERT INTO `order` (user_id, total_price, payment, status) VALUES(?, ?, ?, ?)")) {

            smt.setInt(1, obj.getUser_id());
            smt.setDouble(2, obj.getTotal_price());
            smt.setString(3, obj.getPayment());
            smt.setString(4, obj.getStatus());

            smt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public List<Order> get(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> getID(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> getSEARCH(String txt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> get4new() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getCountfood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> getFoodoffset(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order> getFid(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   @Override
public List<Order> getLast() {
    List<Order> list = new ArrayList<>();

    try (Connection conn = JDBC.getConnection(); 
         PreparedStatement smt = conn.prepareStatement("SELECT TOP 1 * FROM [order] ORDER BY id DESC")) {

        ResultSet rs = smt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            // Assuming your Order constructor takes an int ID parameter
            Order order = new Order(id);
            list.add(order);
        }
    } catch (SQLException ex) {
        // Handle the exception, for instance, print the error message or stack trace
        ex.printStackTrace();
    }

    return list;
}


   public List<Order> getById(String idu) {
    List<Order> list = new ArrayList<>();

    try (Connection conn = JDBC.getConnection();
         PreparedStatement smt = conn.prepareStatement("SELECT * FROM [order] LEFT JOIN [user] ON [user].id = [order].user_id WHERE [order].user_id = ? ORDER BY [order].id DESC")) {
        smt.setString(1, idu);

        ResultSet rs = smt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            // Assuming your Order constructor takes parameters in this order: id, username, user_id, total_price, payment, status, start_date
            String username = rs.getString("username");
            int user_id = rs.getInt("user_id");
            int total_price = rs.getInt("total_price");
            String payment = rs.getString("payment");
            String status = rs.getString("status");
            String start_date = rs.getString("create_at");

            list.add(new Order(id, username, user_id, total_price, payment, status, start_date));
        }
    } catch (SQLException ex) {
        // Handle the exception, for instance, print the error message or stack trace
        ex.printStackTrace();
    }

    return list;
}


    public void updateStatus(Order obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE `order` SET status = ? WHERE id = ?");

            smt.setString(1, obj.getStatus());
            smt.setInt(2, obj.getId());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
