<%-- 
    Document   : skill_assessment
    Created on : Sep 11, 2024, 10:26:26 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Công cụ giao tiếp</title>
        <link rel="stylesheet" href="css/skill_assessment.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="script.js"></script>
    </head>
    <body>
        <header>
            <h1>Đánh giá kỹ năng</h1>
           <nav>
            <ul>
                <li><a href="mentorDashBoard"><button>Trang chủ</button></a></li>                
            </ul>
        </nav>
            <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>
        </header>
        <main>
            <h2>Đánh Giá Kỹ Năng: </h2>

            <!-- Chọn thực tập sinh để đánh giá -->
            <label for="internName">Chọn Thực tập sinh:</label>
            <input type="text" id="internName" placeholder="Nhập tên thực tập sinh...">

            <!--    nhập mstts-->

            <label for="internstt">nhập mã số thực tập:</label>
            <input type="text" id="internstt" placeholder="Nhập mstt...">

            <!-- Chọn kỹ năng và đánh giá -->
            <div class="skill-row">
                <input type="text" placeholder="teamwork" disabled>
                <select id="teamworkScore">
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
            </div>

            <div class="skill-row">
                <input type="text" placeholder="đạo đức" disabled>
                <select id="ethicScore">
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
            </div>

            <!-- Đánh giá button moved to the bottom -->
            <div class="button-row">
                <button onclick="evaluateIntern()">Đánh giá</button>
            </div>
        </main>


        <script>
            function evaluateIntern() {
                let internName = document.getElementById('internName').value;
                let teamworkScore = document.getElementById('teamworkScore').value;
                let ethicScore = document.getElementById('ethicScore').value;

                if (!internName) {
                    alert("Vui lòng nhập tên thực tập sinh.");
                    return;
                }

                let evaluation = {
                    name: internName,
                    skills: {
                        teamwork: teamworkScore,
                        ethics: ethicScore
                    }
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
