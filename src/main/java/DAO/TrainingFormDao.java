/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.TrainingForm;
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
public class TrainingFormDao extends DBContext {

    public List<TrainingForm> getAll() {
        Connection conn = DBContext();    
        String sql = "Select * from TrainingForm";
        try {
            List<TrainingForm> list = new ArrayList<>();
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                TrainingForm trainingForm = new TrainingForm(rs.getInt("ID"), rs.getString("programName"), rs.getDate("startDate"), rs.getDate("endDate"),
                        rs.getTime("sessionStartTime"), rs.getTime("sessionEndTime"), rs.getString("trainerName"));
                list.add(trainingForm);
            }
            return list;
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }

    public int getCountTrainingForms() {
        Connection conn = DBContext();    
        String sql = "Select * from TrainingForm";
        int cnt = 0;
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                cnt++;
            }
            return cnt;
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return 0;
    }
    
    public TrainingForm check(String programName, String trainerName) {
        Connection conn = DBContext();
        String sql = "Select * from TrainingForm where programName = ? and trainerName = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, programName);
            st.setString(2, trainerName);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                TrainingForm trainingForm = new TrainingForm(rs.getInt("ID"), rs.getString("programName"), rs.getDate("startDate"), rs.getDate("endDate"),
                        rs.getTime("sessionStartTime"), rs.getTime("sessionEndTime"), rs.getString("trainerName"));
                return trainingForm;
            }
        } catch (SQLException e) {
            System.err.println(e);
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return null;
    }

    public void insert(TrainingForm trainingForm) {
        Connection conn = DBContext();
        String sql = "Insert into TrainingForm (programName, startDate, endDate, sessionStartTime, sessionEndTime, "
                + "trainerName) values(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, trainingForm.getProgramName());
            st.setDate(2, trainingForm.getStartDate());
            st.setDate(3, trainingForm.getEndDate());
            st.setTime(4, trainingForm.getSessionStartTime());
            st.setTime(5, trainingForm.getSessionEndTime());
            st.setString(6, trainingForm.getTrainerName());
            st.executeUpdate();
            System.err.println("add thành công");
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
    }

    public void delete(int id) {
        Connection conn = DBContext();
        String sql = "DELETE from TrainingForm where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            System.out.println("Delete Success");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Delete Fail");
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    public void reset() {
        Connection conn = DBContext();
        String sql = "DELETE FROM sqlite_sequence WHERE name ='TrainingForm'";
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
