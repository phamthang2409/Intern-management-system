/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProfileDao;
import DAO.UserDao;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        String profileID_raw = request.getParameter("id");
        String profilePosition = request.getParameter("profilePosition");
        request.setAttribute("profileID_raw", profileID_raw);
        request.setAttribute("profilePosition", profilePosition);
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String profileID_raw = request.getParameter("profileID");
        String user = request.getParameter("userName");
        String pass = request.getParameter("passWord");
        String profilePosition = request.getParameter("profilePosition");
        int profileID;
        UserDao userDao = new UserDao();
        ProfileDao ProfileDao = new ProfileDao();
        try {
            profileID = Integer.parseInt(profileID_raw);
            User checkUser = userDao.check(user, pass);
            if (checkUser == null) {
                User newUser = new User(user, pass, profilePosition, profileID);
                if (userDao.insert(newUser)) {
                    if ("Intern".equals(profilePosition)) {
                        ProfileDao.updateStatus(profileID, 1);
                        response.sendRedirect("internProfiles");
                    }else if ("Staff".equals(profilePosition) || "Mentor".equals(profilePosition)){
                        ProfileDao.updateStatus(profileID, 1);
                        response.sendRedirect("staffProfile");
                    }

                } else {
                    request.setAttribute("msg", "Account authorization failed");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }

            } else {
                request.setAttribute("msg", "Account has already existed!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            System.err.println(e);
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
