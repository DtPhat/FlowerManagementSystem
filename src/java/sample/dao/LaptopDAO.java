/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author PHAT
 */
import sample.dto.Laptop;
import sample.utils.DBUtils;

public class LaptopDAO {

    public static ArrayList<Laptop> getLaptops(String keyword, String searchby) {
        ArrayList<Laptop> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select LID, LName, price, imgPath, description, status, Laptops.cateID as 'CateID',CateName\n"
                        + "from Laptops join Categories on Laptops.CateID = Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Laptops.LName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("LID");
                        String name = rs.getString("LName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Laptop laptop = new Laptop(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(laptop);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Laptop> getLaptops() {
        ArrayList<Laptop> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "select LID, LName, price, imgPath, description, status, Laptops.cateID as 'CateID',CateName\n"
                    + "from Laptops join Categories on Laptops.CateID = Categories.CateID\n";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt("LID");
                    String name = rs.getString("LName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    Laptop laptop = new Laptop(id, name, price, imgpath, description, status, cateid, catename);
                    list.add(laptop);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Laptop getLaptop(int lid) {
        ArrayList<Laptop> list = new ArrayList<>();
        Connection cn = null;
        Laptop laptop = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select LID, LName, price, imgPath, description, status, Laptops.cateID as 'CateID',CateName\n"
                        + "from Laptops join Categories on Laptops.CateID = Categories.CateID\n"
                        + "where LID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, lid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int id = rs.getInt("LID");
                    String name = rs.getString("LName");
                    int price = rs.getInt("price");
                    String imgpath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    laptop = new Laptop(id, name, price, imgpath, description, status, cateid, catename);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return laptop;
    }

    public static void updateLaptop(int lid, String name, float price, String imgPath, String description, int status, int cateID) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Laptops\n"
                        + "set LName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ? \n"
                        + "where LID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setFloat(2, price);
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateID);
                pst.setInt(7, lid);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void insertLaptop(String name, float price, String img, String description, int status, int cateID) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Laptops\n"
                        + "values(?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setFloat(2, price);
                pst.setString(3, img);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateID);
                pst.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    public static boolean deleteAccount(int lid) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "delete from Laptops where LID = ?\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, lid);
                int rowCount = pst.executeUpdate();
                if (rowCount > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }
    
}
