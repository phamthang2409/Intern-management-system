<%-- 
    Document   : comunication_tools
    Created on : Sep 11, 2024, 10:51:41 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Công cụ giao tiếp</title>
        <link rel="stylesheet" href="css/communication_tools.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Công cụ Giao tiếp</h1>
            <%@include file="menu_mentor.jsp" %>
        </header>
        <main>
            <h2>Giao tiếp với Thực tập sinh</h2>
            <div id="messagesContainer">
                <!-- Tin nhắn sẽ được hiển thị tại đây -->
            </div>
            <!-- Chọn thực tập sinh để đánh giá -->
            <label for="internName">Chọn Thực tập sinh:</label>
            <input type="text" id="internName" placeholder="Nhập tên thực tập sinh...">

            <!-- Chọn đánh giá theo phần trăm -->
            <label for="evaluationScore">Chọn đánh giá:</label>
            <select id="evaluationScore">
                <option value="10">10%</option>
                <option value="20">20%</option>
                <option value="30">30%</option>
                <option value="40">40%</option>
                <option value="50">50%</option>
                <option value="60">60%</option>
                <option value="70">70%</option>
                <option value="80">80%</option>
                <option value="90">90%</option>
                <option value="100">100%</option>
            </select>

            <button onclick="evaluateIntern()">Đánh giá</button>
        </main>
        <script>
            function evaluateIntern() {
                let internName = document.getElementById('internName').value;
                let score = document.getElementById('evaluationScore').value;

                if (!internName) {
                    alert("Vui lòng nhập tên thực tập sinh.");
                    return;
                }

                let evaluation = {
                    name: internName,
                    score: score
                };

                let evaluations = JSON.parse(localStorage.getItem('evaluations')) || [];
                evaluations.push(evaluation);
                localStorage.setItem('evaluations', JSON.stringify(evaluations));

                alert("Đánh giá đã được lưu.");
            }
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
    </body>
</html>
