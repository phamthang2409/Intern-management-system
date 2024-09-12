/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.InterviewSchedulingDao;
import DAO.ProfileDao;
import DAO.UserDao;
import Model.InterviewScheduling;
import Model.Profile;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.sql.Time;
import java.util.List;


/**
 *
 * @author PC
 */
public class InterviewSchedulingServlet extends HttpServlet {

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
            out.println("<title>Servlet InterviewSchedulingServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InterviewSchedulingServlet at " + request.getContextPath() + "</h1>");
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
        InterviewSchedulingDao interviewSchedulingDao = new InterviewSchedulingDao();
        List<InterviewScheduling> list = interviewSchedulingDao.getAll();
        request.setAttribute("listInterviewScheduling", list);
        request.getRequestDispatcher("interview_scheduling.jsp").forward(request, response);
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
        String candidateID = request.getParameter("candidateID");
        String startDate_raw = request.getParameter("startDate");
        String sessionStartTime_raw = request.getParameter("sessionStartTime");
        String location = request.getParameter("location");
        Date startDate;
        Time sessionStartTime;
        try {
            startDate = Date.valueOf(startDate_raw);
            sessionStartTime = Time.valueOf(sessionStartTime_raw + ":00");
            InterviewSchedulingDao interviewSchedulingDao = new InterviewSchedulingDao();
            ProfileDao profileDao = new ProfileDao();
            UserDao userDao = new UserDao();

            //Lay user can duoc len lich phong van
            User newUser = userDao.checkUserName(candidateID);
            if (newUser != null) {
                Profile profileUser = profileDao.findByID(newUser.getProfileID());
                String candidateName = profileUser.getProfileFirstName() + " " + profileUser.getProfileLastName();
                InterviewScheduling interviewScheduling = new InterviewScheduling(candidateID, candidateName,
                        startDate, sessionStartTime, location);
                interviewSchedulingDao.insert(interviewScheduling);
                response.sendRedirect("interviewScheduling");
//                if (interviewSchedulingDao.check(candidateID) == null) {
//                    request.setAttribute("msg", "Student ID has been registered");
//                    request.getRequestDispatcher("interview_scheduling.jsp").forward(request, response);
//                }
            } else {
                List<InterviewScheduling> list = interviewSchedulingDao.getAll();
                request.setAttribute("listInterviewScheduling", list);
                request.setAttribute("msg", "Student ID does not exist");
                request.getRequestDispatcher("interview_scheduling.jsp").forward(request, response);
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
