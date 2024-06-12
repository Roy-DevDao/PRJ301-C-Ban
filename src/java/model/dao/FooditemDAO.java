package model.dao;

import model.Fooditem;
import jdbc.JDBC;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FooditemDAO implements DAO<Fooditem> {

    private static final FooditemDAO instance = new FooditemDAO();

    public static FooditemDAO getInstance() {
        return instance;
    }

    @Override
    public List<Fooditem> getAll() {
        List<Fooditem> list = new ArrayList<>();
        Connection conn = JDBC.getConnection();


        try {

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(id, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public void insert(Fooditem obj) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Fooditem> get(String email) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Fooditem> getID(String id) {
        List<Fooditem> list = new ArrayList<>();
         Connection conn = JDBC.getConnection();

        try {

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem WHERE category_id = ?");
            smt.setString(1, id);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int cid = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(cid, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public List<Fooditem> getSEARCH(String txt) {
        List<Fooditem> list = new ArrayList<>();
        Connection conn = JDBC.getConnection();
        try {
            
            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem WHERE name LIKE ?");
            smt.setString(1, "%" + txt + "%");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int cid = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(cid, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public List<Fooditem> get4new() {
        List<Fooditem> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT TOP 4 * FROM fooditem ORDER BY id DESC");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(id, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public int getCountfood() {
        int count = 0;

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT COUNT(*) FROM fooditem");

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                count = rs.getInt(1);
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return count;
    }

   @Override
public List<Fooditem> getFoodoffset(String id) {
    List<Fooditem> list = new ArrayList<>();

    int offset = Integer.parseInt(id);

    try (Connection conn = JDBC.getConnection(); 
         PreparedStatement smt = conn.prepareStatement("SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS row_num FROM fooditem) AS sub WHERE row_num > ? AND row_num <= ? + 6")) {

        smt.setInt(1, (offset - 1) * 6);
        smt.setInt(2, (offset - 1) * 6);
        ResultSet rs = smt.executeQuery();

        while (rs.next()) {
            int cid = rs.getInt("id");
            String name = rs.getString("name");
            int category_id = rs.getInt("category_id");
            int price = rs.getInt("price");
            String image = rs.getString("image");

            list.add(new Fooditem(cid, name, category_id, price, image));
        }
        JDBC.closeConnection(conn);
    } catch (SQLException ex) {
        ex.printStackTrace();
    }

    return list;
}

public List<Fooditem> getFoodoffsetIdCid(String cid, String id) {
    List<Fooditem> list = new ArrayList<>();

    int offset = Integer.parseInt(id);

    try (Connection conn = JDBC.getConnection(); 
         PreparedStatement smt = conn.prepareStatement("SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS row_num FROM fooditem WHERE category_id = ?) AS sub WHERE row_num > ? AND row_num <= ? + 6")) {
        
        smt.setString(1, cid);
        smt.setInt(2, (offset - 1) * 6);
        smt.setInt(3, (offset - 1) * 6);
        ResultSet rs = smt.executeQuery();

        while (rs.next()) {
            int idf = rs.getInt("id");
            String name = rs.getString("name");
            int category_id = rs.getInt("category_id");
            int price = rs.getInt("price");
            String image = rs.getString("image");

            list.add(new Fooditem(idf, name, category_id, price, image));
        }
        JDBC.closeConnection(conn);
    } catch (SQLException ex) {
        // Xử lý ngoại lệ ở đây
        ex.printStackTrace();
    }

    return list;
}


    @Override
    public List<Fooditem> getFid(String id) {
        List<Fooditem> list = new ArrayList<>();

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("SELECT * FROM fooditem WHERE id = ?");
            smt.setString(1, id);

            ResultSet rs = smt.executeQuery();

            while (rs.next()) {
                int fid = rs.getInt("id");
                String name = rs.getString("name");
                int category_id = rs.getInt("category_id");
                int price = rs.getInt("price");
                String image = rs.getString("image");

                list.add(new Fooditem(fid, name, category_id, price, image));
            }

            JDBC.closeConnection(conn);

        } catch (SQLException ex) {
        }

        return list;
    }

    @Override
    public List<Fooditem> getLast() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertFooditem(Fooditem obj) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("INSERT INTO fooditem(name, category_id, price, image) VALUES (?, ?, ?, ?)");
            smt.setString(1, obj.getName());
            smt.setInt(2, obj.getCategory_id());
            smt.setInt(3, obj.getPrice());
            smt.setString(4, obj.getImage());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

    }

    public void remove(String id) {
        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("DELETE FROM fooditem WHERE id = ?");
            smt.setString(1, id);

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }

    }

    public void update(Fooditem obj) {

        try {
            Connection conn = JDBC.getConnection();

            PreparedStatement smt = conn.prepareStatement("UPDATE fooditem SET name = ?, category_id = ?, price = ?, image = ? WHERE id = ?");

            smt.setString(1, obj.getName());
            smt.setInt(2, obj.getCategory_id());
            smt.setInt(3, obj.getPrice());
            smt.setString(4, obj.getImage());
            smt.setInt(5, obj.getId());

            smt.executeUpdate();
            JDBC.closeConnection(conn);
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
        }
    }

}
