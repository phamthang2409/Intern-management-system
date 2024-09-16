<%-- 
    Document   : interview_schedule
    Created on : Sep 13, 2024, 11:14:48 PM
    Author     : laptop
--%>

<%@page import="DAO.ProfileDao"%>
<%@page import="Model.Profile"%>
<%@page import="Model.InterviewScheduling"%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch Phỏng Vấn</title>
        <link rel="stylesheet" href="css/staff_dashboard.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <h2>Lịch Phỏng vấn</h2>
        <table id="interviewTableDisplay" border="1" cellspacing="0" cellpadding="5">
            <thead>
                <tr>
                    <th>Người Phụ Trách</th>
                    <th>Ngày phỏng vấn</th>
                    <th>Giờ bắt đầu</th>
                    <th>Địa điểm</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${sessionScope.listInterview != null}">
                    <%! String staffName;
                        int staffID;
                    %>
                    <c:forEach items="${sessionScope.listInterview}" var="i">
                        <%
                            InterviewScheduling interviewSchedulingIntern = (InterviewScheduling) pageContext.getAttribute("i");
                            UserDao userDao = new UserDao();
                            ProfileDao profileDao = new ProfileDao();
                            staffID = interviewSchedulingIntern.getStaffID();
                            User staff = userDao.findbyID(staffID);
                            if (staff == null) {
                                System.out.println("Null staff");
                            } else {
                                Profile profile = profileDao.findByID(staff.getProfileID());
                                staffName = profile.getProfileFirstName() + " " + profile.getProfileLastName();
                            }
                        %>
                        <tr>
                            <td> <%= staffName %> </td>
                            <td>${i.getStartDate()}</td>
                            <td>${i.getSessionStartTime()}</td>
                            <td>${i.getLocation()}</td>
                            <td> <a href="video-call-demo/user1.html">Tham Gia</a></td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:if test="${sessionScope.listInterview == null}">
                    <h2> Không có lịch phỏng vấn</h2>
                </c:if>
        </tbody>
    </table>
</body>
</html>
