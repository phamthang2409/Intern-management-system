/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import Model.User;

/**
 *
 * @author PC
 */
public class UserDao extends DBContext{
    public int countAllUsers() {
        Connection conn = DBContext();
        int cnt = 0;
        String sql = "Select * from User";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                cnt++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return cnt;
    }
    
    public User check(String userName, String passWord) {
        Connection conn = DBContext();
        String sql = "Select * from User where userName = ? and passWord = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, userName);
            st.setString(2, passWord);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                User newUser = new User(rs.getInt("ID") ,rs.getString("userName"), 
                        rs.getString("passWord"), 
                        rs.getString("role"),
                        rs.getInt("profileID"));
                return newUser;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
    
    public User checkAccountUser(int profileID) {
        Connection conn = DBContext();
        String sql = "Select * from User where profileID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, profileID);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                User newUser = new User(rs.getInt("ID") ,rs.getString("userName"), 
                        rs.getString("passWord"), 
                        rs.getString("role"),
                        rs.getInt("profileID"));
                return newUser;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }

    public List<User> getAllStaff()  {
        Connection conn = DBContext();
        List<User> list = new ArrayList<>();
        String sql = "Select * from User where role = 'Staff'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getString("passWord"),
                        rs.getString("role"),
                            rs.getInt("profileID"));
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
    
    //Doc tat ca ban ghi tu table UserDao
    public List<User> getAll()  {
        Connection conn = DBContext();
        List<User> list = new ArrayList<>();
        String sql = "Select * from User";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("ID"),
                        rs.getString("username"),
                        rs.getNString("passWord"),
                        rs.getString("role"),
                            rs.getInt("profileID"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return list;
    }

    public boolean insert(User user)  {
        Connection conn = DBContext();
        String sql = "Insert into User (userName, passWord, role, profileID) values(?, ?, ?, ?)";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, user.getUserName());
            st.setString(2, user.getPassWord());
            st.setString(3, user.getRole());
            st.setInt(4, user.getProfileID());
            st.executeUpdate();
            System.out.println("add thành công");
            return true;
        } catch (SQLException e) {
            System.err.println("add thất bại");
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return false;
    }

    
    public void delete(int id) {
        Connection conn = DBContext();
        String sql = "DELETE from User where profileID = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete User Fail");
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        
    }
    
    public void reset() {
        Connection conn = DBContext();
        String sql = "DELETE FROM sqlite_sequence WHERE name = 'User'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
    
    public User findbyID(int id)  {
        Connection conn = DBContext();
        String sql = "Select * from User where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User(rs.getInt("ID"),
                        rs.getString("userName"),
                        rs.getNString("passWord"),
                        rs.getString("role"),
                rs.getInt("internID"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
    
}
