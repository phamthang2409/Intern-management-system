<%-- 
    Document   : mentor
    Created on : Aug 23, 2024, 10:54:05 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mentor DashBoard</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        
    <header>
        <h1>Bảng điều khiển Mentor</h1>
        <nav>
            <ul>
                <li><a href="dailyProgress"><button>Quản lý Tiến độ Hằng ngày</button></a></li>
                <li><a href="skill_assessment.html"><button>Đánh giá Kỹ năng</button></a></li>
                <li><a href="communication_tools.html"><button>Công cụ Giao tiếp</button></a></li>
            </ul>
        </nav>
        <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>

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
