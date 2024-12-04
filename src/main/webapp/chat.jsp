<%-- 
    Document   : chat
    Created on : Nov 22, 2024, 9:15:03 PM
    Author     : Tran Ngoc Phuoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<%--<%@ include file="dbConfig.jsp" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat Bubble</title>
    <link rel="stylesheet" href="./css/chat.css">
    <script src="scripts.js" defer></script>
</head>
<body>
    <!-- Chat -->
    <div id="chat-widget">
        <div class="chat-header" onclick="toggleChat()">
            💬 Chat with Admin
        </div>
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
</body>
<script>
    let socket = null;
    document.addEventListener("DOMContentLoaded", () => {
        const chatWidget = document.getElementById("chat-widget");
        const chatMessages = document.getElementById("chat-messages");
        const chatForm = document.getElementById("chat-form");
        const chatInput = document.getElementById("chat-input");

        // Toggle chat visibility
        window.toggleChat = () => {
            chatWidget.classList.toggle("open");
        };

        // Kết nối WebSocket
        socket = new WebSocket("ws://localhost:12345");

        socket.onopen = () => {
            console.log("Connected to chat server");
            socket.send("User"); // Đăng ký tên người dùng
        };

        socket.onmessage = (event) => {
            const message = event.data;
            const messageElement = document.createElement("div");
            messageElement.textContent = message;

            // Phân biệt user và admin
            if (message.startsWith("User:")) {
                messageElement.classList.add("message", "user");
            } else {
                messageElement.classList.add("message", "admin");
            }

            chatMessages.appendChild(messageElement);
            chatMessages.scrollTop = chatMessages.scrollHeight; // Tự động cuộn xuống
        };

        // Gửi tin nhắn
        chatForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const message = chatInput.value.trim();
            if (message) {
                socket.send(message);
                chatInput.value = "";
            }
        });
    });

</script>
</html>



