/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.SkillAssessment;
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
public class SkillAssessmentDao extends DBContext {

    public List<SkillAssessment> getAll() {
        Connection conn = DBContext();
        List<SkillAssessment> list = new ArrayList<>();
        String sql = "Select * from SkillsAssessment";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SkillAssessment skillAssessment = new SkillAssessment(rs.getInt("ID"),
                        rs.getString("InternName"),
                        rs.getString("TeamWorkScore"),
                        rs.getString("FinishWorkScore"),
                        rs.getString("CommunicationScore"),
                        rs.getInt("InternID"));
                list.add(skillAssessment);
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

    public boolean insert(SkillAssessment skillAssessment) {
        Connection conn = DBContext();
        String sql = "Insert into SkillAssessment (InternName, TeamWorkScore, FinishWorkScore, CommunicationScore, InternID) values(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, skillAssessment.getInternName());
            st.setString(2, skillAssessment.getTeamWorkScore());
            st.setString(3, skillAssessment.getFinishWorkScore());
            st.setString(4, skillAssessment.getCommunicationScore());
            st.setInt(5, skillAssessment.getInternID());
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
        String sql = "DELETE from SkillsAssessment where ID = ?";
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

    public void reset() {
        Connection conn = DBContext();
        String sql = "DELETE FROM sqlite_sequence WHERE name = 'SkillsAssessment'";
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

    public SkillAssessment findbyID(int id) {
        Connection conn = DBContext();
        String sql = "Select * from SkillAssessment where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                SkillAssessment skillAssessment = new SkillAssessment(rs.getInt("ID"),
                        rs.getString("InternName"),
                        rs.getString("TeamWorkScore"),
                        rs.getString("FinishWorkScore"),
                        rs.getString("CommunicationScore"),
                        rs.getInt("InternID"));
                return skillAssessment;
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
}
