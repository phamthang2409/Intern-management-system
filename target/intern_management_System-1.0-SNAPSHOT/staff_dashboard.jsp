<%-- 
    Document   : staff_dashboard
    Created on : Sep 3, 2024, 3:52:04 PM
    Author     : PC
--%>

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
                    <!-- Thông tin Chương trình Đào tạo sẽ được hiển thị tại đây -->
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
                        <td>${i.getCandidateName()}</td>
                        <td>${i.getStartDate()}</td>
                        <td>${i.getSessionStartTime()}</td>
                        <td>${i.getLocation()}</td>
                        <td><a href="video-call-demo//user2.html"><button id="logoutButton"> Gọi</button></a></td>
                    </c:forEach>
                </tbody>
            </table>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Hiển thị dữ liệu Chương trình Đào tạo
                const trainingTableBody = document.querySelector('#trainingTableDisplay tbody');
                const trainingData = JSON.parse(localStorage.getItem('trainingPrograms') || '[]');

                trainingData.forEach(training => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                <td>${training.internName}</td>
                <td>${training.programName}</td>
                <td>${training.startDate}</td>
                <td>${training.endDate}</td>
                <td>${training.sessionStartTime}</td>
                <td>${training.sessionEndTime}</td>
                <td>${training.trainerName}</td>
              `;
                    trainingTableBody.appendChild(row);
                });

                // Hiển thị dữ liệu Lịch Phỏng vấn
                const interviewTableBody = document.querySelector('#interviewTableDisplay tbody');
                const interviewData = JSON.parse(localStorage.getItem('interviewSchedule') || '[]');

                interviewData.forEach(interview => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                <td>${interview.candidate}</td>
                <td>${interview.dateTime}</td>
                <td>${interview.location}</td>
              `;
                    interviewTableBody.appendChild(row);
                });
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
    </body>
</html>
