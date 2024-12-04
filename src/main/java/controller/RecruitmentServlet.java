/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.RecruitmentCampaignDao;
import Model.RecruitmentCampaign;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author PC
 */
public class RecruitmentServlet extends HttpServlet {

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
            out.println("<title>Servlet RecruitmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RecruitmentServlet at " + request.getContextPath() + "</h1>");
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
        RecruitmentCampaignDao recruitmentCampaignDao = new RecruitmentCampaignDao();
        List<RecruitmentCampaign> listCampaign = recruitmentCampaignDao.getAll();
        request.setAttribute("listCampaign", listCampaign);
        request.getRequestDispatcher("recruitment.jsp").forward(request, response);
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
        String campaignName = request.getParameter("campaignName");
        String position = request.getParameter("position");
        String salary_raw = request.getParameter("salary");
        String education = request.getParameter("education");
        int salary;
        RecruitmentCampaignDao recruitmentCampaignDao = new RecruitmentCampaignDao();
        try{
            salary = Integer.parseInt(salary_raw);
            RecruitmentCampaign recruitmentCampaign = new RecruitmentCampaign(campaignName, position, salary, education);
            recruitmentCampaignDao.insert(recruitmentCampaign);
            response.sendRedirect("recruitment");
        }catch (NumberFormatException e){
            System.err.println(e);
            request.setAttribute("msg", "Loi khong the them chien dich");
            request.getRequestDispatcher("recruitment.jsp").forward(request, response);
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
