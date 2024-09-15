/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;
import Model.Profile;
import Connection.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class ProfileDao extends DBContext{
    public int countAllProfiles() {
        Connection conn = DBContext();
        int cnt = 0;
        String sql = "Select * from Profile";
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
    
    public List<Profile> getAll() {
        Connection conn = DBContext();
        List<Profile> list = new ArrayList<>();
        String sql = "Select * from Profile";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Profile profile = new Profile(rs.getInt("ID"), rs.getString("profileFirstName"), rs.getString("profileLastName"), rs.getDate("profileDOB"), 
                        rs.getString("profileEmail"), rs.getString("trainingProgram"), rs.getString("profilePhone"), 
                        rs.getString("profileEducation"), rs.getString("profilePosition"), 
                        rs.getString("profileSalary"), rs.getInt("status"));
                list.add(profile);
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
    
    public Profile findByID(int id) {
        Connection conn = DBContext();
        String sql = "Select * from Profile where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                Profile internProfile = new Profile(rs.getInt("ID"),rs.getString("profileFirstName"), 
                        rs.getString("profileLastName"), 
                        rs.getDate("profileDOB"), 
                        rs.getString("profileEmail"), rs.getString("trainingProgram"), rs.getString("profilePhone"), 
                        rs.getString("profileEducation"), 
                        rs.getString("profilePosition"), rs.getString("profileSalary"), rs.getInt("status"));
                return internProfile;
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
    
    public Profile findInternProgram(String profilePosition) {
        Connection conn = DBContext();
        String sql = "Select * from Profile where profilePosition = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, profilePosition);
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                Profile internProfile = new Profile(rs.getString("profileFirstName"), 
                        rs.getString("profileLastName"), 
                        rs.getDate("profileDOB"), 
                        rs.getString("profileEmail"), rs.getString("trainingProgram"), rs.getString("profilePhone"), 
                        rs.getString("profileEducation"), 
                        rs.getString("profilePosition"), rs.getString("profileSalary"), rs.getInt("status"));
                return internProfile;
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
    
    public void insert(Profile internProfile)  {
        Connection conn = DBContext();
        String sql = "Insert into Profile (profileFirstName, profileLastName, profileDOB, profileEmail, trainingProgram, profilePhone, "
                + "profileEducation, profilePosition, profileSalary, status) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, internProfile.getProfileFirstName());
            st.setString(2, internProfile.getProfileLastName());
            st.setDate(3, internProfile.getProfileDOB());
            st.setString(4, internProfile.getProfileEmail());
            st.setString(5, internProfile.getTrainingProgram());
            st.setString(6, internProfile.getProfilePhone());
            st.setString(7, internProfile.getProfileEducation());
            st.setString(8, internProfile.getProfilePosition());
            st.setString(9, internProfile.getProfileSalary());
            st.setInt(10, internProfile.getStatus());
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
    
    public Profile check(Profile newProfile) {
        Connection conn = DBContext();
        String sql = "select * from Profile where profileFirstName = ? and "
                + "profileLastName = ? and profileDOB = ? and profilePosition = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, newProfile.getProfileFirstName());
            st.setString(2, newProfile.getProfileLastName());
            st.setDate(3, newProfile.getProfileDOB());
            st.setString(4, newProfile.getProfilePosition());
            ResultSet rs = st.executeQuery();
            if (rs.next()){
                Profile profile = new Profile();
                profile.setProfileFirstName(rs.getString("profileFirstName"));
                profile.setProfileLastName(rs.getString("profileLastName"));
                profile.setProfileDOB(rs.getDate("profileDOB"));
                profile.setProfileEmail(rs.getString("profileEmail"));
                profile.setTrainingProgram(rs.getString("trainingProgram"));
                profile.setProfilePhone(rs.getString("profilePhone"));
                profile.setProfileEducation(rs.getString("profileEducation"));
                profile.setProfilePosition(rs.getString("profilePosition"));
                profile.setProfileSalary(rs.getString("profileSalary"));
                return profile;
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
    
    public void delete(int id) {
        Connection conn = DBContext();
        String sql = "DELETE from Profile where ID = ?";
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
    
    public void updateStatus(int id, int status) {
        Connection conn = DBContext();
        String sql = "Update Profile set status = ? where ID = ?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, status);
            st.setInt(2, id);
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
    
    public void reset() {
        Connection conn = DBContext();
        String sql = "DELETE FROM sqlite_sequence WHERE name ='Profile'";
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
