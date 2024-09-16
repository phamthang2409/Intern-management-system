<%-- 
    Document   : performance_tracking
    Created on : Sep 3, 2024, 4:12:15 PM
    Author     : PC
--%>

<%@page import="Model.Profile"%>
<%@page import="DAO.ProfileDao"%>
<%@page import="Model.PerformanceTracking"%>
<%@page import="Model.User"%>
<%@page import="DAO.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theo dõi Hiệu suất Thực tập sinh</title>
        <link rel="stylesheet" href="css/performance_tracking.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Theo dõi Hiệu suất Thực tập sinh</h1>
            <nav>
                <ul>
                    <li><a href="staffDashBoard"><button>Trang Chủ</button></a></li>
                </ul>
            </nav>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>

        <main>
            <h2>Quản lý Hiệu suất</h2>
            <c:if test="${requestScope.msg != null}">
                <h2 style="color: red">${requestScope.msg}</h2>
            </c:if>
                <c:if test="${requestScope.msg2 != null}">
                <h2 style="color: red">${requestScope.msg2}</h2>
            </c:if>
            <form id="performanceForm" action="performanceTracking" method="post">
                <label for="internName">Mã số thực tập sinh:</label>
                <input type="text" id="internID" name="internID" required><br><br>

                <label for="absentSessions">Số buổi vắng:</label>
                <input type="number" id="absentSession" name="absentSession" min="0" required><br><br>

                <label for="skillName">Tên Kỹ năng được Đào tạo:</label>
                <input type="text" id="skillName" name="skillName" required><br><br>

                <label for="skillScore">Điểm Kỹ năng:</label>
                <input type="number" id="skillScore" name="skillScore" min="0" max="10" required><br><br>
                <button type="submit">Thêm Hiệu suất</button>
            </form>

            <table id="performanceTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Số buổi vắng</th>
                        <th>Kỹ năng</th>
                        <th>Điểm</th>
                        <th>Hành động</th>
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
                            <td><%= nameIntern %></td>
                            <td>${i.getAbsentSession()}</td>
                            <td>${i.getSkillName()}</td>
                            <td>${i.getSkillScore()}</td>
                            <td><button id="delete" onclick="doDelete(${i.getID()})">Xóa</button></td>                  
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you want to delete")) {
                window.location = "delete?id=" + id + "&name=performanceTracking";
            }
        }
        function doClick() {
            if (confirm("Are you want to exit? ")) {
                window.location = "resetSession";
            }
        }
    </script>
</html>
