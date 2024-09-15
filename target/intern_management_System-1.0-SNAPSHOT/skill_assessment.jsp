<%-- 
    Document   : skill_assessment
    Created on : Sep 11, 2024, 10:26:26 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            <c:if test="${requestScope.msg != null}">
                <h2 style="color: red">${requestScope.msg}</h2>
            </c:if>
            <c:if test="${requestScope.msgStatus != null}">
                <h2 style="color: red">${requestScope.msgStatus}</h2>
            </c:if>
            <c:if test="${sessionScope.Success != null }">
                <h2 style="color: green">${sessionScope.Success}</h2>
            </c:if>
            <form action="skillAssessment" method="post"> 
                <!-- Chọn thực tập sinh để đánh giá -->
                <label for="internName">Chọn Thực tập sinh:</label>
                <input type="text" id="internID" name ="internID" placeholder="Nhập mã số thực tập sinh...">

                <!--    nhập mstts-->

                <label for="internstt">Đánh Giá: </label>

                <!-- Chọn kỹ năng và đánh giá -->
                <div class="skill-row">
                    <input type="text" placeholder="teamwork" disabled>
                    <select id="teamworkScore" name = "teamworkScore">
                        <option value="10%">10%</option>
                        <option value="20%">20%</option>
                        <option value="30%">30%</option>
                        <option value="40%">40%</option>
                        <option value="50%">50%</option>
                        <option value="60%">60%</option>
                        <option value="70%">70%</option>
                        <option value="80%">80%</option>
                        <option value="90%">90%</option>
                        <option value="100%">100%</option>
                    </select>
                </div>

                <div class="skill-row">
                    <input type="text" placeholder="Hoàn thành việc" disabled>
                    <select id="finishWorkScore" name = "finishWorkScore">
                        <option value="10%">10%</option>
                        <option value="20%">20%</option>
                        <option value="30%">30%</option>
                        <option value="40%">40%</option>
                        <option value="50%">50%</option>
                        <option value="60%">60%</option>
                        <option value="70%">70%</option>
                        <option value="80%">80%</option>
                        <option value="90%">90%</option>
                        <option value="100%">100%</option>
                    </select>
                </div>

                <div class="skill-row">
                    <input type="text" placeholder="Khả năng giao tiếp" disabled>
                    <select id="communicationScore" name="communicationScore">
                        <option value="10%">10%</option>
                        <option value="20%">20%</option>
                        <option value="30%">30%</option>
                        <option value="40%">40%</option>
                        <option value="50%">50%</option>
                        <option value="60%">60%</option>
                        <option value="70%">70%</option>
                        <option value="80%">80%</option>
                        <option value="90%">90%</option>
                        <option value="100%">100%</option>
                    </select>
                </div>

                <!-- Đánh giá button moved to the bottom -->
                <div class="button-row">
                    <button type="submit" onclick="evaluateIntern()">Đánh giá</button>
                </div>
            </form>
        </main>

    </body>
</html>
