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
    Connection conn = DBContext();
    public int countAllUsers(){
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
        }
        return cnt;
    }
    
    public User check(String userName, String passWord){
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
                        rs.getInt("internID"));
                return newUser;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Doc tat ca ban ghi tu table UserDao
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "Select * from User";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getNString("passWord"),
                        rs.getString("role"),
                            rs.getInt("internID"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insert(User user) {
        String sql = "Insert into User (userName, passWord, role, internID) values(?, ?, ?, ?)";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, user.getUserName());
            st.setString(2, user.getPassWord());
            st.setString(3, user.getRole());
            st.setInt(4, user.getInternID());
            st.executeUpdate();
            System.out.println("add thành công");
        } catch (SQLException e) {
            System.err.println("add thất bại");
            System.out.println(e);
        }
    }
    
//    public void update(User user){
//        String sql = "Update User set userName = ?, passWord = ?, role = ? where ID = ?";
//        System.out.println(user.getUserName());
//        try{
//            PreparedStatement st = conn.prepareStatement(sql);
//            st.setString(1, user.getUserName());
//            st.setString(2, user.getPassWord());
//            st.setString(3, user.getRole());
//            st.setInt(4,user.getID());
//            st.executeUpdate();
//            System.out.println("Update Success");
//        } catch (SQLException e) {
//            System.out.println(e);  
//            System.out.println("Update Fail");
//        }
//    }
    
    public void delete(int id){
        String sql = "DELETE from User where ID = ?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete Fail");
        }
    }
    
    public User findbyID(int id) {
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
        }
        return null;
    }
    
}
