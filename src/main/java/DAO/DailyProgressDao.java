/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.DailyProgress;
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
public class DailyProgressDao extends DBContext {

    public List<DailyProgress> getAll() {
        Connection conn = DBContext();
        List<DailyProgress> list = new ArrayList<>();
        String sql = "Select * from DailyProgress";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DailyProgress dailyProgress = new DailyProgress(rs.getInt("ID"),
                        rs.getString("InternID"),
                        rs.getDate("DateReport"),
                        rs.getString("Description"),
                        rs.getInt("Status"),
                        rs.getInt("MentorID"));
                list.add(dailyProgress);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }
    
    public DailyProgress findbyID(String id)  {
        Connection conn = DBContext();
        String sql = "Select * from DailyProgress where InternID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                DailyProgress dailyProgress = new DailyProgress(rs.getInt("ID"),
                        rs.getString("InternID"),
                        rs.getDate("DateReport"),
                        rs.getString("Description"),
                        rs.getInt("Status"),
                        rs.getInt("MentorID"));
                return dailyProgress;
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
    
    public void updateStatus(String userName, int status) {
        Connection conn = DBContext();
        String sql = "Update DailyProgress set Status = ? where InternID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, status);
            st.setString(2, userName);
            st.executeUpdate();
            System.out.println("Update Success");
        } catch (SQLException e) {
            System.err.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public int countAllDailyProgress() {
        Connection conn = DBContext();
        int cnt = 0;
        String sql = "Select * from DailyProgress";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cnt++;
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return cnt;
    }

    public boolean insert(DailyProgress dailyProgress) {
        Connection conn = DBContext();
        String sql = "Insert into DailyProgress (InternID, DateReport, Description, Status, MentorID) values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, dailyProgress.getInternID());
            st.setDate(2, dailyProgress.getDateReport());
            st.setString(3, dailyProgress.getDescription());
            st.setInt(4, dailyProgress.getStatus());
            st.setInt(5, dailyProgress.getMentorID());
            st.executeUpdate();
            System.out.println("add thành công");
            return true;
        } catch (SQLException e) {
            System.err.println("add thất bại");
            System.out.println(e);
        } finally {
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
        String sql = "DELETE from DailyProgress where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete User Fail");
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public DailyProgress check(String userName) {
        Connection conn = DBContext();
        String sql = "Select * from DailyProgress where InternID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                DailyProgress dailyProgress = new DailyProgress(rs.getInt("ID"),
                        rs.getString("InternID"),
                        rs.getDate("DateReport"),
                        rs.getString("Description"),
                        rs.getInt("Status"),
                        rs.getInt("MentorID"));
                return dailyProgress;
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }

    public void reset() {
        Connection conn = DBContext();
        String sql = "DELETE FROM sqlite_sequence WHERE name = 'DailyProgress'";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
}
