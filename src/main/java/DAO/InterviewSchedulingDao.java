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
        String sql = "Select * from InterviewForm";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                InterviewScheduling interviewScheduling = new InterviewScheduling(rs.getString("candidateID"), 
                        rs.getDate("startDate"), rs.getTime("sessionStartTime"), rs.getString("location"));
                list.add(interviewScheduling);
            }
            return list;
        } catch (SQLException e) {
            System.err.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
    
    public void insert(InterviewScheduling interviewScheduling) {
        String sql = "Insert into InterviewForm (candidateID, startDate, sessionStartTime, location) values(?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, interviewScheduling.getCandidateID());
            st.setDate(2, interviewScheduling.getStartDate());
            st.setTime(3, interviewScheduling.getSessionStartTime());
            st.setString(4, interviewScheduling.getLocation());
            st.executeUpdate();
            System.err.println("add thành công");
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
    }
    
    public void delete(int id){
        String sql = "DELETE from InterviewForm where candidateID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete Fail");
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
    
    public void reset(){
        String sql = "DELETE FROM sqlite_sequence WHERE name ='InterviewForm'";
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
}
