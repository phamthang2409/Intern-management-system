/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Connection;

import java.sql.*;

public class DBContext {
    protected Connection conn;
    public DBContext(){
        try {
            String url = "jdbc:sqlserver://localhost:1433;databaseName = intern-management-System;"
                    + "encrypt=optional; trustServerCertificate=true;";
            String user = "sa";
            String passWord = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(url, user, passWord);
            System.out.println("Ket noi thanh cong");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Ket noi that bai");
            System.out.println(ex.getMessage());
            System.exit(0);
        }
    }
}
