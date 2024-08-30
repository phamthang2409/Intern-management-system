/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection;

import DAO.RecruitmentCampaignDao;
import Model.RecruitmentCampaign;
import java.sql.*;


public class DBContext {
//    public static void main(String[] args) {
//        RecruitmentCampaign recruitmentCampaign = new RecruitmentCampaign("sass", "123", 1111, "12/12");
//        insert(recruitmentCampaign);
//        
//    }
    
//    public static void insert(RecruitmentCampaign recruitmentCampaign) {
//        String sql = "Insert into Recruitment_Campaigns(campaignName, position, salary, education) values(?, ?, ?, ?)";
//        try {
//            PreparedStatement st = conn.prepareStatement(sql);
//            System.out.println("eeeeee");
//            st.setString(1, recruitmentCampaign.getCampaignName());
//            st.setString(2, recruitmentCampaign.getPosition());
//            st.setInt(3, recruitmentCampaign.getSalary());
//            st.setString(4, recruitmentCampaign.getEducation());
//            st.executeUpdate();
//            System.out.println("add thành công");
//        } catch (SQLException e) {
//            System.out.println("add thất bại");
//            System.out.println(e);
//        }
//    }
    
    public Connection DBContext(){
        Connection conn;
        try {
            Class.forName("org.sqlite.JDBC");
            
        } catch (ClassNotFoundException se) {
            System.out.println("" + se.getMessage());
        }
        try {
            String url = "jdbc:sqlite:D:\\projectWeb\\intern_management_System\\intern_management.db3";
            conn = DriverManager.getConnection(url);
            if (conn != null){
                System.out.println("Conntection SQLITE Success");
            }
            return conn;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//    public DBContext() {
//        try {
//            String url = "jdbc:sqlserver://localhost:1433;databaseName = intern-management-System;"
//                    + "encrypt=optional; trustServerCertificate=true;";
//            String user = "sa";
//            String passWord = "123";
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            conn = DriverManager.getConnection(url, user, passWord);
//            System.out.println("Ket noi thanh cong");
//        } catch ( ClassNotFoundException|SQLException ex) {
//            System.out.println("Ket noi that bai");
//            System.out.println(ex.getMessage());
//            System.exit(0);
//        }
//    }
}
