/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBContext;
import Model.RecruitmentCampaign;
import Model.User;
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
public class RecruitmentCampaignDao extends DBContext{
    Connection conn = DBContext();
    public void insert(RecruitmentCampaign recruitmentCampaign) {
        String sql = "Insert into Recruitment_Campaigns(campaignName, position, salary, education) values(?, ?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, recruitmentCampaign.getCampaignName());
            st.setString(2, recruitmentCampaign.getPosition());
            st.setInt(3, recruitmentCampaign.getSalary());
            st.setString(4, recruitmentCampaign.getEducation());
            st.executeUpdate();
            System.out.println("add thành công");
        } catch (SQLException e) {
            System.out.println("add thất bại");
            System.out.println(e);
        }finally{
            try {
                conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }
    
    
    
    public List<RecruitmentCampaign> getAll() {
        List<RecruitmentCampaign> list = new ArrayList<>();
        String sql = "Select * from Recruitment_Campaigns";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                RecruitmentCampaign recruitmentCampaign = new RecruitmentCampaign(rs.getInt("ID"),rs.getString("campaignName"), 
                        rs.getString("position"), rs.getInt("salary"), rs.getString("education"));
                list.add(recruitmentCampaign);
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
        return list;
    }
    
    public void delete(int id){
        String sql = "DELETE from Recruitment_Campaigns where ID = ?";
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
        String sql = "DELETE FROM sqlite_sequence WHERE name ='Recruitment_Campaigns'";
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
