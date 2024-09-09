/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.TrainingFormDao;
import Model.TrainingForm;
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
public class TrainingFormServlet extends HttpServlet {

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
            out.println("<title>Servlet TrainingFormServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrainingFormServlet at " + request.getContextPath() + "</h1>");
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
        List<TrainingForm> list = trainingFormDao.getAll();
        int cnt = trainingFormDao.getCountTrainingForms();
        if (cnt == 0) {
            trainingFormDao.reset();
        }
        request.setAttribute("listTraining", list);
        request.getRequestDispatcher("training_program.jsp").forward(request, response);
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
        String programName = request.getParameter("programName");
        String startDate_raw = request.getParameter("startDate");
        String endDate_raw = request.getParameter("endDate");
        String sessionStartTime_raw = request.getParameter("sessionStartTime");
        String sessionEndTime_raw = request.getParameter("sessionEndTime");
        String trainerName = request.getParameter("trainerName");
        Date startDate, endDate;
        Time sessionStartTime, sessionEndTime;
        TrainingFormDao trainingFormDao = new TrainingFormDao();
        try {
            startDate = Date.valueOf(startDate_raw);
            endDate = Date.valueOf(endDate_raw);
            sessionStartTime = Time.valueOf(sessionStartTime_raw + ":00");
            sessionEndTime = Time.valueOf(sessionEndTime_raw + ":00");
            TrainingForm trainingForm = new TrainingForm(programName, startDate, endDate, sessionStartTime, sessionEndTime, trainerName);
            if (trainingFormDao.check(programName, trainerName) == null) {
                trainingFormDao.insert(trainingForm);
                response.sendRedirect("trainingForm");
            }else{
                request.setAttribute("msg", "This program name is registered");
                request.getRequestDispatcher("training_program.jsp").forward(request, response);
            }

        } catch (Error e) {
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
