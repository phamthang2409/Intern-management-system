/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.InterviewScheduling;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author PC
 */
public class InterviewSchedulingDao extends DBContext{
    public int countAllInterview() {
        Connection conn = DBContext();
        int cnt = 0;
        String sql = "Select * from InterviewForm";
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
    
    public List<InterviewScheduling> getAll(){
        Connection conn = DBContext();
        List<InterviewScheduling> list = new ArrayList<>();
        String sql = "Select * from InterviewForm";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                InterviewScheduling interviewScheduling = new InterviewScheduling(rs.getInt("ID"),rs.getString("candidateID"), rs.getString("candidateName"),
                        rs.getDate("startDate"), rs.getTime("sessionStartTime"), rs.getString("location"), rs.getInt("staffID"));
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
    
    public List<InterviewScheduling> findByCandidateID(String candidateID){
        Connection conn = DBContext();
        List<InterviewScheduling> list = new ArrayList<>();
        String sql = "Select * from InterviewForm where candidateID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, candidateID);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                InterviewScheduling interviewScheduling = new InterviewScheduling(rs.getInt("ID"),rs.getString("candidateID"), rs.getString("candidateName"),
                        rs.getDate("startDate"), rs.getTime("sessionStartTime"), rs.getString("location"), rs.getInt("staffID"));
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
        Connection conn = DBContext();
        String sql = "Insert into InterviewForm (candidateID, candidateName, startDate, sessionStartTime, location, staffID) values(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, interviewScheduling.getCandidateID());
            st.setString(2, interviewScheduling.getCandidateName());
            st.setDate(3, interviewScheduling.getStartDate());
            st.setTime(4, interviewScheduling.getSessionStartTime());
            st.setString(5, interviewScheduling.getLocation());
            st.setInt(6, interviewScheduling.getStaffID());
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
    
    public InterviewScheduling check(String candidateID, Date startDate, Time starTime) {

        Connection conn = DBContext();
        String sql = "Select * from InterviewForm where candidateID = ? and startDate = ? and sessionStartTime = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, candidateID);
            st.setDate(2, startDate);
            st.setTime(3, starTime);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                InterviewScheduling interviewScheduling = new InterviewScheduling(rs.getString("candidateID"), rs.getString("candidateName"),
                        rs.getDate("startDate"), rs.getTime("sessionStartTime"), rs.getString("location"), rs.getInt("staffID"));
                return interviewScheduling;
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
    
    public void delete(int id){
        Connection conn = DBContext();
        String sql = "DELETE from InterviewForm where ID = ?";
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
        Connection conn = DBContext();
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
