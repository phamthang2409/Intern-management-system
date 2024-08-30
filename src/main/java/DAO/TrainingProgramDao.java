/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.TrainingProgram;
import Model.User;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class TrainingProgramDao extends DBContext{
    //Lấy danh sách user
    Connection conn = DBContext();
    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "Select * from [User]";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getNString("passWord"),
                        rs.getString("role"));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<TrainingProgram> search(String searchName, Date from, Date to, int ID ){
        List<TrainingProgram> list = new ArrayList<>();
        String sql = "Select * from TrainingProgram where 1 = 1 ";
        if (searchName != null && !searchName.equals("")){
            sql += "and name like '%" + searchName + "%' or description like '%"+ searchName + "%'";
        }
        if (from != null){
            sql += "and startDate >='"+from+"'";
        }
        if (to != null){
            sql += "and endDate >='"+to+"'";
        }
        if (ID != 0){
            sql += "AND ID = "+ ID;
        }
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                TrainingProgram train = new TrainingProgram();
                train.setID(rs.getInt("ID"));
                train.setName(rs.getString("name"));
                train.setDescription(rs.getString("description"));
                train.setStartDate(rs.getDate("startDate"));
                train.setEndDate(rs.getDate("endDate"));
                train.setTraineeID(rs.getInt("traineeID"));
                train.setTrainerID(rs.getInt("trainerID"));
                train.setImages(rs.getString("images"));
                list.add(train);
            }
        }catch(SQLException e){
            System.out.println("Fail");
            System.out.println(e);
        }
        return list;
    }
}
