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
                        <!-- Dữ liệu từ daily_progress.html và skill_assessment.html sẽ được hiển thị tại đây -->
                    </tbody>
                </table>
            </section>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy dữ liệu từ Local Storage
                let dailyProgress = JSON.parse(localStorage.getItem('dailyProgress')) || [];
                let evaluations = JSON.parse(localStorage.getItem('evaluations')) || [];

                let tableBody = document.querySelector('#mentorTable tbody');

                dailyProgress.forEach(progress => {
                    let row = document.createElement('tr');

                    let nameCell = document.createElement('td');
                    nameCell.textContent = progress.name;
                    row.appendChild(nameCell);

                    let dateCell = document.createElement('td');
                    dateCell.textContent = progress.date;
                    row.appendChild(dateCell);

                    let descriptionCell = document.createElement('td');
                    descriptionCell.textContent = progress.description;
                    row.appendChild(descriptionCell);

                    let evaluationCell = document.createElement('td');
                    let evaluation = evaluations.find(e => e.name === progress.name);
                    evaluationCell.textContent = evaluation ? `${evaluation.score}%` : 'Chưa đánh giá';
                    row.appendChild(evaluationCell);

                    tableBody.appendChild(row);
                });
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>

    </body>
</html>
