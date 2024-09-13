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
       <style>
    #username #user{
        text-decoration: none;
        color: white;
    }
    #username {
        color: red; /* Màu chữ */
        padding: 10px 20px; /* Khoảng cách bên trong nút */
        text-align: center; /* Canh giữa chữ */
        text-decoration: none; /* Bỏ gạch chân */
        display: inline-block;
        font-size: 16px; /* Kích thước chữ */
        cursor: pointer; /* Thay đổi con trỏ khi di chuột vào nút */
        position: absolute; /* Định vị tuyệt đối */
        top: 10px; /* Cách cạnh trên 10px */
        left: 10px; /* Cách cạnh phải 10px */
    }
</style>
        <header>
            <h1>Bảng điều khiển Nhân viên phụ trách</h1>
            <nav>
                <ul>
                    <li><a href="staffDashBoard"><button>Trang Chủ</button></a></li>
                    <li><a href="interviewScheduling"><button>Lên Lịch Phỏng vấn</button></a></li>
                    <li><a href="performanceTracking"><button>Theo dõi Hiệu suất</button></a></li>
                </ul>
            </nav>
            <li id="username">
                <c:set var="t" value="${sessionScope.staffProfile}"/>
                <a id="user" href="#" role="button" >
                    Xin chào ${t.getProfileFirstName()} ${t.getProfileLastName()},
                </a>                              
            </li>
            
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
            .chat-bubble{
                right: 20px;
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
    <!-- Bong bóng chat -->
    <div class="chat-bubble" id="chatBubble">
        <i class="fas fa-comment">💬</i>
    </div>

    <!-- Cửa sổ chat -->
    <div class="chat-window" id="chatWindow">
        <header>
            <h3>Nhắn tin với chúng tôi</h3>
        </header>
        <div class="chat-content" id="chatContent">
            <p>Xin chào! Bạn cần hỗ trợ gì?</p>
        </div>
        <!-- Khung nhập liệu chat -->
        <textarea id="chatInput" placeholder="Nhập tin nhắn..."></textarea>
        <button class="send-btn" id="sendButton">Gửi</button>
    </div>

    </body>
    <script>
        // Khi nhấp vào bong bóng chat, mở/đóng cửa sổ chat
document.getElementById('chatBubble').addEventListener('click', function() {
    var chatWindow = document.getElementById('chatWindow');
    if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
        chatWindow.style.display = 'flex'; // Hiển thị cửa sổ chat
    } else {
        chatWindow.style.display = 'none'; // Ẩn cửa sổ chat
    }
});

// Xử lý gửi tin nhắn từ khung chat
document.getElementById('sendButton').addEventListener('click', function() {
    var chatInput = document.getElementById('chatInput').value;
    var chatContent = document.getElementById('chatContent');

    if (chatInput.trim() !== "") {
        // Lưu tin nhắn vào localStorage để chia sẻ với các trang khác
        var messages = JSON.parse(localStorage.getItem('chatMessages')) || [];
        messages.push("Nhân viên: " + chatInput);
        localStorage.setItem('chatMessages', JSON.stringify(messages));

        // Tạo thẻ <p> mới để hiển thị tin nhắn trên trang hiện tại
        var newMessage = document.createElement('p');
        newMessage.textContent = "Nhân viên: " + chatInput;
        chatContent.appendChild(newMessage);

        // Xóa nội dung trong khung nhập
        document.getElementById('chatInput').value = '';

        // Cuộn xuống để xem tin nhắn mới nhất
        chatContent.scrollTop = chatContent.scrollHeight;
    }
});

// Đồng bộ thông tin từ trang staff_dashboard
document.addEventListener('DOMContentLoaded', function () {
    // Hiển thị các tin nhắn đã lưu trữ
    var chatContent = document.getElementById('chatContent');
    var storedMessages = JSON.parse(localStorage.getItem('chatMessages')) || [];
    storedMessages.forEach(function(message) {
        var messageElement = document.createElement('p');
        messageElement.textContent = message;
        chatContent.appendChild(messageElement);
    });
});

    </script>
</html>
