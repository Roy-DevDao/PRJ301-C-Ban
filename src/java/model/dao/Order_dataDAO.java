package model.dao;

import model.Order_data;
import jdbc.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Order_dataDAO implements DAO<Order_data> {

    private static final Order_dataDAO instance = new Order_dataDAO();

    public static Order_dataDAO getInstance() {
        return instance;
    }

 @Override
public List<Order_data> getAll() {
    List<Order_data> list = new ArrayList<>();

    try (Connection conn = JDBC.getConnection();
         PreparedStatement smt = conn.prepareStatement("SELECT * FROM order_data LEFT JOIN [user] ON [user].id = order_data.user_id")) {

        ResultSet rs = smt.executeQuery();

        while (rs.next()) {

            int order_id = rs.getInt("order_id");
            int fooditem_id = rs.getInt("fooditem_id");
            int amount = rs.getInt("amount");

            list.add(new Order_data(order_id, fooditem_id, amount));
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return list;
}


    @Override
    public void insert(Order_data obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO order_data(order_id, footitem_id, amout) VALUES (?, ?, ?)");
            smt.setInt(1, obj.getOrder_id());
            smt.setInt(2, obj.getFooditem_id());
            smt.setInt(3, obj.getAmout());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

    @Override
    public List<Order_data> get(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

   @Override
public List<Order_data> getID(String id) {
    List<Order_data> list = new ArrayList<>();

    try (Connection conn = JDBC.getConnection();
         PreparedStatement smt = conn.prepareStatement("SELECT * FROM order_data LEFT JOIN fooditem ON fooditem.id = order_data.footitem_id WHERE order_data.order_id = ?")) {

        smt.setString(1, id);
        ResultSet rs = smt.executeQuery();

        while (rs.next()) {

            String foodname = rs.getString("name");
            int order_id = rs.getInt("order_id");
            int footitem_id = rs.getInt("footitem_id");
            int amount = rs.getInt("amout");

            list.add(new Order_data(foodname, order_id, footitem_id, amount));
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return list;
}


    @Override
    public List<Order_data> getSEARCH(String txt) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> get4new() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int getCountfood() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getFoodoffset(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getFid(String id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Order_data> getLast() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
