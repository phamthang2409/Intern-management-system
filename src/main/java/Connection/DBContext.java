/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection;

import DAO.RecruitmentCampaignDao;
import Model.RecruitmentCampaign;
import java.sql.*;


public class DBContext {
    
    public Connection DBContext(){
        Connection conn;
        try {
            Class.forName("org.sqlite.JDBC");
            
        } catch (ClassNotFoundException se) {
            System.out.println("" + se.getMessage());
        }
        try {
//            String url = "jdbc:sqlite:intern.sqlite";
            String url = "jdbc:sqlite:D:\\New folder\\Intern-management-system\\intern_management.db3";
            conn = DriverManager.getConnection(url);
            if (conn != null){
                System.out.println("Conntection SQLITE Success");
            }
            return conn;
        } catch (SQLException e) {
            throw new RuntimeException("uncaught", e);
        }
    }
}
