/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.PerformanceTracking;
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
public class PerformanceTrackingDao extends DBContext{
    public List<PerformanceTracking> getAll()  {
        Connection conn = DBContext();
        List<PerformanceTracking> list = new ArrayList<>();
        String sql = "Select * from PerformanceTracking";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PerformanceTracking performanceTracking = new PerformanceTracking(rs.getInt("ID"),
                        rs.getString("InternID"),
                        rs.getInt("AbsentSession"),
                        rs.getString("SkillName"),
                            rs.getInt("SkillScore"));
                list.add(performanceTracking);
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
    
    public boolean insert(PerformanceTracking performanceTracking)  {
        Connection conn = DBContext();
        String sql = "Insert into PerformanceTracking (InternID, AbsentSession, SkillName, SkillScore) values(?, ?, ?, ?)";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, performanceTracking.getInternID());
            st.setInt(2, performanceTracking.getAbsentSession());
            st.setString(3, performanceTracking.getSkillName());
            st.setInt(4, performanceTracking.getSkillScore());
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
        String sql = "DELETE from PerformanceTracking where ID = ?";
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
        String sql = "DELETE FROM sqlite_sequence WHERE name = 'PerformanceTracking'";
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
    
    public PerformanceTracking findbyID(String id)  {
        Connection conn = DBContext();
        String sql = "Select * from PerformanceTracking where InternID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                PerformanceTracking performanceTracking = new PerformanceTracking(rs.getInt("ID"),
                        rs.getString("InternID"),
                        rs.getInt("AbsentSession"),
                        rs.getString("SkillName"),
                            rs.getInt("SkillScore"));
                return performanceTracking;
            }
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
    
    public int countAll() {
        Connection conn = DBContext();
        int cnt = 0;
        String sql = "Select * from PerformanceTracking";
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
}
