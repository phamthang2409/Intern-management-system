<%-- 
    Document   : performance_tracking
    Created on : Sep 3, 2024, 4:12:15 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theo dõi Hiệu suất Thực tập sinh</title>
        <link rel="stylesheet" href="css/performance_tracking.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Theo dõi Hiệu suất Thực tập sinh</h1>
            <%@include file="menu_staff.jsp"%>
        </header>
        
        <main>
            <h2>Quản lý Hiệu suất</h2>
            <form id="performanceForm">
                <label for="internName">Tên Thực tập sinh:</label>
                <input type="text" id="internName" name="internName" required><br><br>

                <label for="absentSessions">Số buổi vắng:</label>
                <input type="number" id="absentSessions" name="absentSessions" min="0" required><br><br>

                <label for="skillName">Tên Kỹ năng được Đào tạo:</label>
                <input type="text" id="skillName" name="skillName" required><br><br>

                <label for="skillScore">Điểm Kỹ năng:</label>
                <input type="number" id="skillScore" name="skillScore" min="0" max="100" required><br><br>

                <button type="submit">Thêm Hiệu suất</button>
            </form>

            <table id="performanceTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Số buổi vắng</th>
                        <th>Kỹ năng</th>
                        <th>Điểm</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hiệu suất của thực tập sinh sẽ được thêm tại đây -->
                </tbody>
            </table>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy dữ liệu từ Local Storage
                let performanceData = JSON.parse(localStorage.getItem('performanceData')) || [];

                // Hàm hiển thị hiệu suất thực tập sinh
                function displayPerformance() {
                    const performanceTableBody = document.querySelector('#performanceTable tbody');
                    performanceTableBody.innerHTML = ''; // Xóa dữ liệu cũ

                    performanceData.forEach((performance, index) => {
                        let row = document.createElement('tr');

                        let internNameCell = document.createElement('td');
                        internNameCell.textContent = performance.internName;
                        row.appendChild(internNameCell);

                        let absentSessionsCell = document.createElement('td');
                        absentSessionsCell.textContent = performance.absentSessions;
                        row.appendChild(absentSessionsCell);

                        let skillNameCell = document.createElement('td');
                        skillNameCell.textContent = performance.skillName;
                        row.appendChild(skillNameCell);

                        let skillScoreCell = document.createElement('td');
                        skillScoreCell.textContent = performance.skillScore;
                        row.appendChild(skillScoreCell);

                        let actionCell = document.createElement('td');
                        let deleteButton = document.createElement('button');
                        deleteButton.textContent = 'Xóa';
                        deleteButton.addEventListener('click', function () {
                            deletePerformance(index);
                        });
                        actionCell.appendChild(deleteButton);
                        row.appendChild(actionCell);

                        performanceTableBody.appendChild(row);
                    });
                }

                // Hàm xóa hiệu suất thực tập sinh
                function deletePerformance(index) {
                    performanceData.splice(index, 1);
                    localStorage.setItem('performanceData', JSON.stringify(performanceData));
                    displayPerformance();
                }

                // Hàm thêm hiệu suất thực tập sinh mới
                document.querySelector('#performanceForm').addEventListener('submit', function (e) {
                    e.preventDefault();

                    let internName = document.querySelector('#internName').value;
                    let absentSessions = document.querySelector('#absentSessions').value;
                    let skillName = document.querySelector('#skillName').value;
                    let skillScore = document.querySelector('#skillScore').value;

                    performanceData.push({
                        internName,
                        absentSessions,
                        skillName,
                        skillScore
                    });

                    localStorage.setItem('performanceData', JSON.stringify(performanceData));

                    document.querySelector('#performanceForm').reset(); // Xóa form
                    displayPerformance();
                });

                // Hiển thị hiệu suất khi trang được tải
                displayPerformance();
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
    </body>
</html>
