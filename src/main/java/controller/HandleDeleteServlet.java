/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.DailyProgressDao;
import DAO.InterviewSchedulingDao;
import DAO.ProfileDao;
import DAO.RecruitmentCampaignDao;
import DAO.TrainingFormDao;
import DAO.UserDao;
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
public class HandleDeleteServlet extends HttpServlet {

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
            out.println("<title>Servlet HandleDeleteServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleDeleteServlet at " + request.getContextPath() + "</h1>");
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
        String id_raw = request.getParameter("id");
        String name = request.getParameter("name");
        RecruitmentCampaignDao recruitmentCampaignDao = new RecruitmentCampaignDao();
        TrainingFormDao trainingFormDao = new TrainingFormDao();
        
        int id;
        try{
            
            if (name.equals("recruitment")){
                id = Integer.parseInt(id_raw);
                recruitmentCampaignDao.delete(id);
                response.sendRedirect("recruitment");
            }else if (name.equals("internProfiles")){
                id = Integer.parseInt(id_raw);
                String profilePosition = request.getParameter("profilePosition");
                UserDao userDao = new UserDao();
                if (userDao.checkAccountUser(id) != null){
                    userDao.delete(id);
                }   
                ProfileDao internProfileDao = new ProfileDao();
                internProfileDao.delete(id);
                if ("Intern".equals(profilePosition)){
                    response.sendRedirect("internProfiles");
                }else if("Staff".equals(profilePosition)){
                    response.sendRedirect("staffProfile");
                }
            }else if (name.equals("trainingForm")){
                id = Integer.parseInt(id_raw);
                trainingFormDao.delete(id);
                response.sendRedirect("trainingForm");
            }else if(name.equals("interviewScheduling")){
                InterviewSchedulingDao interviewSchedulingDao = new InterviewSchedulingDao();
                interviewSchedulingDao.delete(id_raw);
                response.sendRedirect("interviewScheduling");
            }else if (name.equals("dailyProgress")){
                id = Integer.parseInt(id_raw);
                DailyProgressDao dailyProgressDao = new DailyProgressDao();
                dailyProgressDao.delete(id);
                response.sendRedirect("dailyProgress");
            }
        }catch(NumberFormatException e){
            System.err.println(e);
        }
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
