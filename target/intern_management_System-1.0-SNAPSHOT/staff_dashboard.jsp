<%-- 
    Document   : staff_dashboard
    Created on : Sep 3, 2024, 3:52:04 PM
    Author     : PC
--%>

<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="DAO.TrainingFormDao"%>
<%@page import="Model.TrainingForm"%>
<%@page import="Model.Profile"%>
<%@page import="DAO.ProfileDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bảng điều khiển Nhân viên phụ trách</title>
        <link rel="stylesheet" href="css/staff_dashboard.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Bảng điều khiển Nhân viên phụ trách</h1>
            <nav>
                <ul>
                    <li><a href="staffDashBoard"><button>Trang Chủ</button></a></li>
                    <li><a href="interviewScheduling"><button>Lên Lịch Phỏng vấn</button></a></li>
                    <li><a href="performanceTracking"><button>Theo dõi Hiệu suất</button></a></li>
                </ul>
            </nav>
            <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>
        </header>

        <style>
            button#callButton{
                background-color: red; /* Màu nền */
                color: white; /* Màu chữ */
                border: none; /* Bỏ viền */
                padding: 10px 20px; /* Khoảng cách bên trong nút */
                text-align: center; /* Canh giữa chữ */
                text-decoration: none; /* Bỏ gạch chân */
                display: inline-block;
                font-size: 16px; /* Kích thước chữ */
                cursor: pointer; /* Thay đổi con trỏ khi di chuột vào nút */
                border-radius: 5px; /* Bo góc nút */
            }
        </style>

        <main>
            <h2>Thông tin Chương trình Đào tạo</h2>
            <table id="trainingTableDisplay" border="1px" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Tên Chương trình Đào tạo</th>
                        <th>Ngày Bắt đầu</th>
                        <th>Ngày Kết thúc</th>
                        <th>Thời gian Bắt đầu Buổi học</th>
                        <th>Thời gian Kết thúc Buổi học</th>
                        <th>Người Phụ trách</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${requestScope.listProfileIntern != null}">
                        <%!
                            String nameTrainer;
                            Date startDate, endDate;
                            Time startTime, endTime;
                        %>
                        <c:forEach items="${requestScope.listProfileIntern}" var="i">
                            <tr>
                                <%
                                    TrainingFormDao trainingFormDao = new TrainingFormDao();
                                    Profile profile = (Profile) pageContext.getAttribute("i");
                                    TrainingForm trainingForm = trainingFormDao.findbyProgramTraining(profile.getTrainingProgram());
                                    nameTrainer = trainingForm.getTrainerName();
                                    startDate = trainingForm.getStartDate();
                                    endDate = trainingForm.getEndDate();
                                    startTime = trainingForm.getSessionStartTime();
                                    endTime = trainingForm.getSessionEndTime();
                                %>
                                <td>${i.getProfileFirstName()} ${i.getProfileLastName()}</td>
                                <td>${i.getTrainingProgram()}</td>
                                <td><%= startDate %></td>
                                <td><%= endDate %></td>
                                <td><%= startTime %></td>
                                <td><%= endTime %></td>
                                <td><%= nameTrainer %></td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>

            <h2>Lịch Phỏng vấn</h2>
            <table id="interviewTableDisplay" border="1" cellspacing="0" cellpadding="5">
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
                            <td><a href="video-call-demo//user2.html"><button id="callButton"> Gọi</button></a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
</html>
