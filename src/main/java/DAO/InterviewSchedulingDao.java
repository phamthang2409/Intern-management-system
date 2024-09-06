/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.InterviewScheduling;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class InterviewSchedulingDao extends DBContext{
    Connection conn = DBContext();
    public List<InterviewScheduling> getAll(){
        List<InterviewScheduling> list = new ArrayList<>();
        String sql = "Select * from TrainingForm";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                InterviewScheduling interviewScheduling = new InterviewScheduling(rs.getString("candidateName"), 
                        rs.getDate("internViewDateTime"), rs.getString("location"));
                list.add(interviewScheduling);
            }
            return list;
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }
    
    public void insert(InterviewScheduling interviewScheduling) {
        String sql = "Insert into InternViewForm (candidateName, internViewDateTime, location) values(?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, interviewScheduling.getCandidateName());
            st.setDate(2, interviewScheduling.getInternViewDateTime());
            st.setString(3, interviewScheduling.getLocation());
            st.executeUpdate();
            System.err.println("add thành công");
        } catch (SQLException e) {
            System.err.println("add thất bại");
            System.out.println(e);
        }
    }
    
    public void delete(int id){
        String sql = "DELETE from InternViewForm where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete Fail");
        }
    }
    
    public void reset(){
        String sql = "DELETE FROM sqlite_sequence WHERE name ='InternProfile'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
