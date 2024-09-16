<%-- 
Document   : reporting_analysis
Created on : Aug 28, 2024, 10:42:44 AM
Author     : PC
--%>

<%@page import="Model.Profile"%>
<%@page import="Model.User"%>
<%@page import="Model.PerformanceTracking"%>
<%@page import="DAO.ProfileDao"%>
<%@page import="DAO.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo và Phân tích</title>
        <link rel="stylesheet" href="css/reporting_analysis.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Báo cáo và phân tích</h1>
            <nav>
                <ul>
                    <li><a href="adminDashBoard"><button>Trang Chủ</button></a></li>
                    <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
                </ul>

            </nav>

        </header>
        <main>
            <h2>Báo cáo Hiệu suất Thực tập sinh</h2>
            <table id="reportingTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Số buổi vắng</th>
                        <th>Kỹ năng</th>
                        <th>Điểm</th>
                    </tr>
                </thead>
                <tbody>
                    <%!
                        String nameIntern;
                        UserDao userDao = new UserDao();
                        ProfileDao profileDao = new ProfileDao();
                        int InternID;
                    %>

                    <c:forEach items="${requestScope.listPerformanceTracking}" var="i">
                        <%
                            PerformanceTracking performanceTracking = (PerformanceTracking) pageContext.getAttribute("i");
                            User user = userDao.checkUserName(performanceTracking.getInternID());
                            if (user != null) {
                                InternID = user.getProfileID();
                                Profile profileIntern = profileDao.findByID(InternID);
                                nameIntern = profileIntern.getProfileFirstName() + " " + profileIntern.getProfileLastName();
                            }
                        %>
                        <tr>
                            <td><%= nameIntern%></td>
                            <td>${i.getAbsentSession()}</td>
                            <td>${i.getSkillName()}</td>
                            <td>${i.getSkillScore()}</td>              
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
        <script>
            function doClick() {
                if (confirm("Are you want to exit? ")) {
                    window.location = "resetSession";
                }
            }
        </script>
    </body>
</html>
