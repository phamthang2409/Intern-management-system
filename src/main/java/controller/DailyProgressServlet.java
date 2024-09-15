/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DailyProgressDao;
import DAO.UserDao;
import Model.DailyProgress;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author PC
 */
public class DailyProgressServlet extends HttpServlet {

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
            out.println("<title>Servlet DailyProgressServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DailyProgressServlet at " + request.getContextPath() + "</h1>");
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
        DailyProgressDao dailyProgressDao = new DailyProgressDao();
        List<DailyProgress> list = dailyProgressDao.getAll();
        request.setAttribute("listProgress", list);
        request.getRequestDispatcher("daily_progress.jsp").forward(request, response);
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
        String internID = request.getParameter("internID");
        String date_raw = request.getParameter("date");
        String description = request.getParameter("description");
        String mentorID_raw = request.getParameter("mentorID");
        Date date;
        int mentorID;
        DailyProgressDao dailyProgressDao = new DailyProgressDao();
        UserDao userDao = new UserDao();
        try {
            date = Date.valueOf(date_raw);
            mentorID = Integer.parseInt(mentorID_raw);
            if (userDao.checkUserName(internID) != null){
                DailyProgress dailyProgress = new DailyProgress(internID, date, description, mentorID);
                dailyProgressDao.insert(dailyProgress);
                response.sendRedirect("dailyProgress");
            }else{
                request.setAttribute("msg", "Student ID does not exist");
                request.getRequestDispatcher("daily_progress.jsp").forward(request, response);
            }
            
        } catch (ServletException | IOException e) {
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
