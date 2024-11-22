/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DailyProgressDao;
import DAO.SkillAssessmentDao;
import DAO.UserDao;
import Model.DailyProgress;
import Model.SkillAssessment;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
public class SkillAssessmentServlet extends HttpServlet {

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
            out.println("<title>Servlet SkillAssessmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SkillAssessmentServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("skill_assessment.jsp").forward(request, response);
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
        String teamworkScore = request.getParameter("teamworkScore");
        String finishWorkScore = request.getParameter("finishWorkScore");
        String communicationScore = request.getParameter("communicationScore");
        SkillAssessmentDao skillAssessmentDao = new SkillAssessmentDao();
        UserDao userDao = new UserDao();
        DailyProgressDao dailyProgressDao = new DailyProgressDao();
        User user = userDao.checkUserName(internID);
        DailyProgress dailyProgressIntern = dailyProgressDao.findbyID(internID);
        HttpSession session = request.getSession();
        int Status = dailyProgressIntern.getStatus();
        if (user != null) {
            if (Status == 0) {
                SkillAssessment skillAssessment = new SkillAssessment(internID, teamworkScore, finishWorkScore,
                        communicationScore, user.getProfileID());
                skillAssessmentDao.insert(skillAssessment);
                dailyProgressDao.updateStatus(internID, 1);
                session.setAttribute("Success", "Bạn đã đăng ký thành công");
                response.sendRedirect("skillAssessment");
            }else{
                request.setAttribute("msgStatus", "This daily progress has been assessment");
                request.getRequestDispatcher("skill_assessment.jsp").forward(request, response);
            }

        } else {
            request.setAttribute("msg", "Student ID does not exist");
            request.getRequestDispatcher("skill_assessment.jsp").forward(request, response);
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
