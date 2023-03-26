/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Category;
import sample.utils.DBUtils;

/**
 *
 * @author PHAT
 */
public class CategoryDAO {

    public static ArrayList<Category> getCategories() {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID, CateName\n"
                        + "from Categories\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int cateid = rs.getInt("CateID");
                        String catename = rs.getString("CateName");
                        Category cate = new Category(cateid, catename);
                        list.add(cate);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public static Category getCategory(int cateID) {
        ArrayList<Category> list = new ArrayList<>();
        Connection cn = null;
        Category cate = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select CateID, CateName\n"
                        + "from Categories where CateID = ?\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, cateID);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int cateid = rs.getInt("CateID");
                    String catename = rs.getString("CateName");
                    cate = new Category(cateid, catename);
                    return cate;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    
    public static void updateCategory(int cateid, String catename) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Categories\n"
                        + "set CateName = ?\n"
                        + "where CateID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, catename);
                pst.setInt(2, cateid);
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

    public static void insertCategory(String catename) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Categories\n"
                        + "values(?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, catename);
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
}
