<%-- 
    Document   : interview_scheduling
    Created on : Sep 3, 2024, 3:57:28 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lên Lịch Phỏng vấn</title>
        <link rel="stylesheet" href="css/interview_scheduling.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Lên Lịch Phỏng vấn</h1>
            <nav>
                <ul>
                    <li><a href="staffDashBoard"><button>Trang Chủ</button></a></li>
                </ul>
            </nav>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>

        <main>
            <form id="interviewForm" action="interviewScheduling" method="post">
                <h2>Lên Lịch Phỏng Vấn</h2>
                <c:if test="${requestScope.msg != null}">
                    <h3 style="color: red">${requestScope.msg}</h3>
                </c:if>
                <c:if test="${requestScope.msg2 != null}">
                    <h3 style="color: red">${requestScope.msg}</h3>
                </c:if>
                <label for="candidateName">Mã số thực tập sinh:</label>
                <input type="text" id="candidateID" name="candidateID" required><br><br>

                <label for="startDate">Ngày phỏng vấn:</label>
                <input type="date" id="startDate" name="startDate" required><br><br>

                <label for="sessionStartTime">Thời gian bắt đầu phỏng vấn</label>
                <input type="time" id="sessionStartTime" name="sessionStartTime" pattern="[0-9]{2}:[0-9]{2}" required><br><br>

                <label for="location">Hình thức Phỏng vấn:</label>
                <select type="text" id="location" name="location" required>
                    <option value="Online">Online</option>
                    <option value="Offline">Offline</option>
                </select>
                <br><br>

                <button type="submit">Thêm Lịch Phỏng vấn</button>
            </form>

            <table id="interviewTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Ngày phỏng vấn</th>
                        <th>Giờ bắt đầu</th>
                        <th>Địa điểm</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listInterviewScheduling}" var="i">
                        <tr>
                            <td>${i.getCandidateName()}</td>
                            <td>${i.getStartDate()}</td>
                            <td>${i.getSessionStartTime()}</td>
                            <td>${i.getLocation()}</td>
                            <td><button onclick="doDelete(${i.getID()})">Xóa</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you want to delete")) {
                window.location = "delete?id=" + id + "&name=interviewScheduling";
            }
        }
        function doClick() {
            if (confirm("Are you want to exit? ")) {
                window.location = "resetSession";
            }
        }
    </script>
</html>
