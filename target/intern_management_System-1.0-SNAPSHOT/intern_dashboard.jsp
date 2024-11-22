<%-- 
    Document   : intern_dashboard
    Created on : Aug 17, 2024, 1:15:12 PM
    Author     : PC
--%>
<%@page import="Model.Profile"%>
<%@page import="Model.User"%>
<%@page import="DAO.ProfileDao"%>
<%@page import="DAO.UserDao"%>
<%@page import="Model.InterviewScheduling"%>
<!--Trang chủ Intern-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bảng điều khiển Thực tập sinh</title>
        <link rel="stylesheet" href="css/intern_dashboard.css">
        <link rel="stylesheet" href="css/chat.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
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
        
        #reminderDetails #btn-close{
            width: 75px;
            height: 30px;
            background-color: #f44336;
            cursor: pointer;
            margin-top: 25px;
            color: #fff;
        }
        
    </style>
    <body>
        <header>
            <h1>Bảng điều khiển Thực tập sinh</h1>

            <li id="username">
                <c:set var="t" value="${sessionScope.internProfile}"/>
                <a id="user" href="#" role="button" >
                    Xin chào ${t.getProfileFirstName()} ${t.getProfileLastName()}
                </a>                              
            </li>
            <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>
        </header>

        <main>
            <!-- Hồ sơ thông tin -->
            <section class="profile-section">
                <h2>HỒ SƠ:</h2>
                <c:set var="i" value="${sessionScope.internProfile}"/>
                <div class="profile-info">
                    <div class="profile-details-left">
                        <p><strong>Họ và Tên:</strong> <span id="profileName">${i.getProfileFirstName()} ${i.getProfileLastName()}</span></p>
                        <p><strong>Ngày sinh:</strong> <span id="profileDob">${i.getProfileDOB()}</span></p>
                        <p><strong>Email:</strong> <span id="profileEmail">${i.getProfileEmail()}</span></p>
                        <p><strong>Số điện thoại:</strong> <span id="profilePhone">${i.getProfilePhone()}</span></p>
                    </div>
                    <div class="profile-details-right">
                        <p><strong>Trình độ học vấn:</strong> <span id="profileEducation">${i.getProfileEducation()}</span></p>
                        <p><strong>Vị trí ứng tuyển:</strong> <span id="profilePosition">${i.getProfilePosition()}</span></p>
                    </div>
                </div>
            </section>

            <!-- Nhắc nhở và lịch -->
            <section class="notifications">
                <div class="reminders">
                    <h3>Nhắc nhở mới, chưa xem</h3>
                    <c:if test="${requestScope.cntInterview != 0}">
                        <p>${requestScope.cntInterview}</p>
                    </c:if>
                    <c:if test="${requestScope.cntInterview == 0}">
                        <p>0</p>
                    </c:if>
                    <a href="javascript:void(0);" onclick="showReminderDetails()">Xem chi tiết</a>
                </div>
                <div class="schedule">
                    <h3>Lịch Phỏng Vấn</h3>

                    <c:if test="${requestScope.cntInterview != 0}">
                        <p>${requestScope.cntInterview}</p>
                    </c:if>
                    <c:if test="${requestScope.cntInterview == 0}">
                        <p>0</p>
                    </c:if>
                    <a href="interviewSchedule">Xem chi tiết</a>
                </div>
            </section>

            <!-- Bảng hiển thị thông tin nhắc nhở mới, ẩn ban đầu -->
            <div id="reminderDetails" >
                <h3>Chi tiết nhắc nhở</h3>
                <table border="1">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Nội dung nhắc nhở</th>
                            <th>Thời gian</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%!
                            int cnt = 1;
                            String staffName;
                            int staffID;
                        %>
                        <!-- Giả sử dữ liệu nhắc nhở được lấy từ requestScope -->
                        <c:forEach var="i" items="${sessionScope.listInterview}">
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
                                <td><%= cnt %></td>
                                <td> Bạn sẽ có cuộc phỏng vấn với <%= staffName %> </td>
                                <td>${i.getStartDate()} ${i.getSessionStartTime()}</td>
                            </tr>
                            <% cnt=cnt+1; %>
                        </c:forEach>
                    </tbody>
                </table>
                <button onclick="closeReminderDetails()" id="btn-close">Đóng</button>
            </div>

            <!-- Biểu đồ -->
            <section class="chart">
                <canvas id="scoreChart"></canvas>
            </section>
            <!-- Bong bóng chat -->
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
        </main>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
                    // Initialize the bar chart
                    var ctx = document.getElementById('scoreChart').getContext('2d');
                    var scoreChart = new Chart(ctx, {
                        type: 'bar',
                        data: {
                            labels: ['Team Work', 'Finish Word', 'Communication'],
                            datasets: [
                                {
                                    label: 'Điểm của bạn',
                                    data: [8, 7, 6, 7],
                                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    borderColor: 'rgba(255, 99, 132, 1)',
                                    borderWidth: 1
                                }
                            ]
                        },
                        options: {
                            scales: {
                                y: {
                                    beginAtZero: true
                                }
                            }
                        }
                    });
        </script>
        <script>
            // Khi nhấp vào bong bóng chat, mở/đóng cửa sổ chat
            document.getElementById('chatBubble').addEventListener('click', function () {
                var chatWindow = document.getElementById('chatWindow');
                if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
                    chatWindow.style.display = 'flex'; // Hiển thị cửa sổ chat
                } else {
                    chatWindow.style.display = 'none'; // Ẩn cửa sổ chat
                }
            });

// Xử lý gửi tin nhắn từ khung chat
            document.getElementById('sendButton').addEventListener('click', function () {
                var chatInput = document.getElementById('chatInput').value;
                var chatContent = document.getElementById('chatContent');

                if (chatInput.trim() !== "") {
                    // Lưu tin nhắn vào localStorage để chia sẻ với các trang khác
                    var messages = JSON.parse(localStorage.getItem('chatMessages')) || [];
                    messages.push("Bạn: " + chatInput);
                    localStorage.setItem('chatMessages', JSON.stringify(messages));

                    // Tạo thẻ <p> mới để hiển thị tin nhắn trên trang hiện tại
                    var newMessage = document.createElement('p');
                    newMessage.textContent = "Bạn: " + chatInput;
                    chatContent.appendChild(newMessage);

                    // Xóa nội dung trong khung nhập
                    document.getElementById('chatInput').value = '';

                    // Cuộn xuống để xem tin nhắn mới nhất
                    chatContent.scrollTop = chatContent.scrollHeight;
                }
            });

// Đồng bộ thông tin từ trang intern_dashboard
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy thông tin thực tập sinh từ trang (hoặc từ dữ liệu nào đó trong thực tế)
                let internName = document.getElementById('profileName').textContent;

                // Hiển thị lời chào dựa trên thông tin
                var chatContent = document.getElementById('chatContent');
                var greetingMessage = document.createElement('p');
                greetingMessage.textContent = "Xin chào " + internName + "! Chúng tôi có thể giúp gì cho bạn?";
                chatContent.appendChild(greetingMessage);

                // Hiển thị các tin nhắn đã lưu trữ
                var storedMessages = JSON.parse(localStorage.getItem('chatMessages')) || [];
                storedMessages.forEach(function (message) {
                    var messageElement = document.createElement('p');
                    messageElement.textContent = message;
                    chatContent.appendChild(messageElement);
                });
            });

            // Đồng bộ thông tin từ trang staff_dashboard
            document.addEventListener('DOMContentLoaded', function () {
                // Hiển thị các tin nhắn đã lưu trữ
                var chatContent = document.getElementById('chatContent');
                var storedMessages = JSON.parse(localStorage.getItem('chatMessages')) || [];
                storedMessages.forEach(function (message) {
                    var messageElement = document.createElement('p');
                    messageElement.textContent = message;
                    chatContent.appendChild(messageElement);
                });
            });

        </script>
        <script>
            function showReminderDetails() {
                document.getElementById('reminderDetails').style.display = 'block';
            }

            function closeReminderDetails() {
                document.getElementById('reminderDetails').style.display = 'none';
            }
        </script>
        <script>

            wss.on('connection', (ws) => {
                console.log('Client connected');
                ws.on('message', (message) => {
                    console.log('Received:', message);
                    ws.send(`You said: ${message}`);
                });
            });
            console.log('WebSocket server is running on ws://localhost:12345');

                const chatWidget = document.getElementById("chat-widget");
                const chatMessages = document.getElementById("chat-messages");
                const chatForm = document.getElementById("chat-form");
                const chatInput = document.getElementById("chat-input");

                // Khởi tạo WebSocket một lần
                const socket = new WebSocket('ws://localhost:12345');

                socket.onopen = () => {
                    console.log('Connected to the server');
                };

                socket.onmessage = (event) => {
                    console.log('Message from server:', event.data);
                    // Hiển thị tin nhắn trên giao diện
                    const message = document.createElement('p');
                    message.textContent = event.data;
                    chatMessages.appendChild(message);
                };

                socket.onclose = () => {
                    console.log('Disconnected from the server');
                };

                // Toggle chat visibility
                window.toggleChat = () => {
                    chatWidget.classList.toggle("open");
                };

                // Gửi tin nhắn
                function sendMessage() {
                    const message = chatInput.value.trim();
                    if (socket.readyState === WebSocket.OPEN) {
                        socket.send(message);
                        chatInput.value = ""; // Xóa ô input sau khi gửi
                    } else {
                        console.log("WebSocket is not ready to send messages.");
                    }
                }


//                socket.onmessage = (event) => {
//                    const message = event.data;
//                    const messageElement = document.createElement("div");
//                    messageElement.textContent = message;
//
//                    // Phân biệt user và admin
//                    if (message.startsWith("User")) {
//                        messageElement.classList.add("message", "User");
//                    } else {
//                        messageElement.classList.add("message", "Admin");
//                    }
//
//                    chatMessages.appendChild(messageElement);
//                    chatMessages.scrollTop = chatMessages.scrollHeight; // Tự động cuộn xuống
//                };
//
//                // Gửi tin nhắn
//                chatForm.addEventListener("submit", (e) => {
//                    e.preventDefault();
//                    const message = chatInput.value.trim();
//                    if (message) {
//                        socket.send(message);
//                        chatInput.value = "";
//                    }
//                });

        </script>
    </body>
</html>
