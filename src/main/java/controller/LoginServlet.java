/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProfileDao;
import DAO.UserDao;
import Model.Profile;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("userName");
        String pass = request.getParameter("passWord");
//        String rem = request.getParameter("rem");
        
        //Tạo 3 cookie user, pass, rem
        Cookie userCookie = new Cookie("cUser", user);
        Cookie passCookie = new Cookie("cPass", pass);
//        Cookie remCookie = new Cookie("cRem", rem);
//        if (rem!=null){
//            userCookie.setMaxAge(60*60*24*7);
//            passCookie.setMaxAge(60*60*24*7);
//            remCookie.setMaxAge(60*60*24*7);
//        }else{
//            userCookie.setMaxAge(0);
//            passCookie.setMaxAge(0);
//            remCookie.setMaxAge(0);
//        }
        
        UserDao userDao = new UserDao();
        User newUser = userDao.check(user, pass);
        HttpSession session = request.getSession();
        if (newUser == null){
            request.setAttribute("msg", "UserName or PassWord is invalid");
            System.out.println("Send Fail");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        }else{
            String role = newUser.getRole();
            System.out.println(role);
            if(role.equals("intern")){
                ProfileDao internProfileDao = new ProfileDao();
                Profile internProfile = internProfileDao.findByID(newUser.getProfileID());
                session.setAttribute("account", newUser);
                request.setAttribute("internProfile", internProfile);
                request.getRequestDispatcher("intern_dashboard.jsp").forward(request, response);
            }else if(role.equals("staff")){
                ProfileDao staffProfileDao = new ProfileDao();
                Profile staffProfile = staffProfileDao.findByID(newUser.getProfileID());
                session.setAttribute("account", newUser);
                request.setAttribute("staffProfile", staffProfile);
                request.getRequestDispatcher("staff_dashboard.jsp").forward(request, response);
            }
            
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
