/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ProfileDao;
import DAO.TrainingFormDao;
import Model.Profile;
import Model.TrainingForm;
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
public class StaffRegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet StaffRegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffRegisterServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("staff_profile_register.jsp").forward(request, response);
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
        String profileFirstName = request.getParameter("firstName");
        String profileLastName = request.getParameter("lastName");
        String profileDOB_raw = request.getParameter("dob");
        String profileEmail = request.getParameter("email");
        String profilePhone = request.getParameter("phone");
        String profileEducation = request.getParameter("education");
        String profileSalary = request.getParameter("salary");
        ProfileDao internProfileDao = new ProfileDao();
        System.out.println("Ddax vao staff ");
        Date profileDOB;
        try {
            profileDOB = (profileDOB_raw == null) ? null : Date.valueOf(profileDOB_raw);
            Profile staffProfile = new Profile(profileFirstName, profileLastName, profileDOB, profileEmail, "Đào tạo thực tập sinh",
                    profilePhone, profileEducation, "Staff", profileSalary, 0);

            if (internProfileDao.check(staffProfile) == null) {
                internProfileDao.insert(staffProfile);
                response.sendRedirect("staffProfile");
            } else {
                request.setAttribute("msg", "This Profile is registered");
                TrainingFormDao trainingFormDao = new TrainingFormDao();
                List<TrainingForm> list = trainingFormDao.getAll();
                request.setAttribute("listTrainingForm", list);
                request.getRequestDispatcher("staff_profile_register.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            System.out.println(e);
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