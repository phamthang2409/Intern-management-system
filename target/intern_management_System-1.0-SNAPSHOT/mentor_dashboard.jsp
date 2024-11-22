<%-- 
    Document   : mentor
    Created on : Aug 23, 2024, 10:54:05 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bảng điều khiển Mentor</title>
        <link rel="stylesheet" href="css/mentor_dashboard.css">
        <link rel="stylesheet" href="css/chat.css">
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
            /*Chat*/
            .chat-bubble {
                position: fixed;
                bottom: 20px;
                right: 20px;
                background-color: #28a745;
                color: white;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 30px;
                cursor: pointer;
                animation: bounce 2s infinite;
            }
            .chat-bubble i {
                font-size: 30px; /* Điều chỉnh kích thước icon */
                margin-left: 5px;
            }
        </style>
        <header>
            <h1>Bảng điều khiển Mentor</h1>
            <nav>
                <ul>
                    <li><a href="mentorDashBoard"><button>Trang chủ</button></a></li>
                    <li><a href="dailyProgress"><button>Quản lý Tiến độ Hằng ngày</button></a></li>
                    <li><a href="trainingForm"><button>Thiết lập Chương trình đào tạo</button></a></li>
                    <li><a href="skillAssessment"><button>Đánh giá Kỹ năng</button></a></li>
                    <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
                </ul>
            </nav>
            <li id="username">
                <c:set var="t" value="${sessionScope.mentorProfile}"/>
                <a id="user" href="#" role="button" >
                    Xin chào ${t.getProfileFirstName()} ${t.getProfileLastName()},
                </a>                  
            </li>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>

        <main>
            <section class="info-box">
                <h2>Danh sách Thực tập sinh</h2>
                <table id="mentorTable" class="table-row">
                    <thead>
                        <tr>
                            <th>Tên Thực tập sinh</th>
                            <th>Ngày</th>
                            <th>Mô tả Tiến độ</th>
                            <th>Đánh giá Kỹ năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${requestScope.listDailyProgress != null}">
                            <c:forEach items="${requestScope.listDailyProgress}" var="i">
                                <tr>
                                    <td>Tên Thực tập sinh</td>
                                    <td>${i.getDateReport()}</td>
                                    <td>${i.getDescription()}</td>
                                    <c:if test="${i.getStatus() == 0}">
                                        <td>Chưa đánh giá Kỹ năng</td>
                                    </c:if>
                                    <c:if test="${i.getStatus() == 1}">
                                        <td>Đã đánh giá Kỹ năng</td>
                                    </c:if>
                                </tr>
                            </c:forEach>

                        </c:if>
                        <c:if test="${requestScope.listDailyProgress == null}">
                            <h2>Không tìm thấy dữ liệu.</h2>
                        </c:if>
                    </tbody>
                </table>
                <!-- Bong bóng chat -->
            <div class="chat-bubble" id="chatBubble"> 
                <div class="chat-header" onclick="toggleChat()">
                    <i class="fas fa-comment"">💬</i>
                </div>
            </div>

            <!-- Cửa sổ chat -->
            <!-- Chat -->
            <div id="chat-widget">
                <div class="chat-body">
                    <div id="chat-messages"></div>
                </div>
                <div class="chat-footer">
                    <form id="chat-form">
                        <input type="text" id="chat-input" placeholder="Type your message..." required>
                        <button type="submit">Send</button>
                    </form>
                </div>
            </div>
            </section>
        </main>
    </body>
    <script type="text/javascript">
        function doClick() {
            if (confirm("Are you want to exit? ")) {
                window.location = "resetSession";
            }
        }
    </script>
    <script>
    let socket;
    document.addEventListener("DOMContentLoaded", () => {
        const chatBody = document.getElementById("chatBody");
        const chatForm = document.getElementById("chatForm");
        const messageInput = document.getElementById("messageInput");
        // Toggle chat visibility
        window.toggleChat() => {
            chatWidget.classList.toggle("open");
        };
        // Kết nối tới server TCP qua WebSocket
        socket = new WebSocket(" localhost:12345");

        socket.onopen = () => {
            console.log("Connected to chat server");
            socket.send("Admin"); // Đăng ký tên người dùng
        };

        socket.onmessage = (event) => {
            const message = event.data;
            const messageElement = document.createElement("div");

            // Phân biệt user và admin
            if (message.startsWith("User:")) {
                messageElement.classList.add("message", "User");
            } else {
                messageElement.classList.add("message", "Admin");
            }

            messageElement.textContent = message;
            chatBody.appendChild(messageElement);
            chatBody.scrollTop = chatBody.scrollHeight; // Tự động cuộn xuống
        };

        // Xử lý gửi tin nhắn
        chatForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const message = messageInput.value.trim();
            if (message) {
                socket.send(message);
                messageInput.value = "";
            }
        });
    });

        </script>
</html>
