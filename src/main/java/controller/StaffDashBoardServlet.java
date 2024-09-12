/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.InterviewSchedulingDao;
import DAO.ProfileDao;
import DAO.TrainingFormDao;
import Model.InterviewScheduling;
import Model.Profile;
import Model.TrainingForm;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PC
 */
public class StaffDashBoardServlet extends HttpServlet {

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
            out.println("<title>Servlet StaffDashBoardServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffDashBoardServlet at " + request.getContextPath() + "</h1>");
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
        TrainingFormDao trainingFormDao = new TrainingFormDao();
        ProfileDao profileDao = new ProfileDao();
        InterviewSchedulingDao interviewSchedulingDao = new InterviewSchedulingDao();
        List<Profile> listProfileIntern = new ArrayList<>();
        List<TrainingForm> list = trainingFormDao.getAll();
        List<Profile> listAllProfiles = profileDao.getAll();
        for (int i = 0; i < listAllProfiles.size(); i++) {
            if ("Intern".equals(listAllProfiles.get(i).getProfilePosition())) {
                Profile profileIntern = profileDao.findInternProgram("Intern");
                listProfileIntern.add(profileIntern);
            }
        }
        request.setAttribute("listProfileIntern", listProfileIntern);
        request.setAttribute("listTraining", list);

        List<InterviewScheduling> listInterview = interviewSchedulingDao.getAll();
        request.setAttribute("listInterviewScheduling", listInterview);
        request.getRequestDispatcher("staff_dashboard.jsp").forward(request, response);
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
        processRequest(request, response);
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