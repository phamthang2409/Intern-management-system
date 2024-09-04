<%-- 
    Document   : training_program
    Created on : Sep 3, 2024, 4:08:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thiết lập Chương trình Đào tạo</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <%@include file="menu_staff.jsp"%>
        <main>
            <h2>Chương trình Đào tạo</h2>
            <form id="trainingForm" action="trainingProgram" method="post">
                <label for="programName">Tên Chương trình:</label>
                <input type="text" id="programName" name="programName" required><br><br>

                <label for="startDate">Ngày Bắt đầu Khóa học:</label>
                <input type="date" id="startDate" name="startDate" required><br><br>

                <label for="endDate">Ngày Kết thúc Khóa học:</label>
                <input type="date" id="endDate" name="endDate" required><br><br>

                <label for="sessionStartTime">Thời gian Bắt đầu Buổi học:</label>
                <input type="time" id="sessionStartTime" name="sessionStartTime" required><br><br>

                <label for="sessionEndTime">Thời gian Kết thúc Buổi học:</label>
                <input type="time" id="sessionEndTime" name="sessionEndTime" required><br><br>

                <label for="trainerName">Tên Người Phụ trách:</label>
                <input type="text" id="trainerName" name="trainerName" required><br><br>

                <button type="submit">Thêm Chương trình Đào tạo</button>
            </form>

            <table id="trainingTable">
                <thead>
                    <tr>
                        <th>Tên Chương trình</th>
                        <th>Ngày Bắt đầu</th>
                        <th>Ngày Kết thúc</th>
                        <th>Thời gian Bắt đầu Buổi học</th>
                        <th>Thời gian Kết thúc Buổi học</th>
                        <th>Người Phụ trách</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Chương trình đào tạo sẽ được thêm tại đây -->
                </tbody>
            </table>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                let trainingPrograms = JSON.parse(localStorage.getItem('trainingPrograms')) || [];

                function displayTrainingPrograms() {
                    const trainingTableBody = document.querySelector('#trainingTable tbody');
                    trainingTableBody.innerHTML = '';

                    trainingPrograms.forEach((program, index) => {
                        let row = document.createElement('tr');

                        row.innerHTML = `
                            <td>${program.programName}</td>
                            <td>${program.startDate}</td>
                            <td>${program.endDate}</td>
                            <td>${program.sessionStartTime}</td>
                            <td>${program.sessionEndTime}</td>
                            <td>${program.trainerName}</td>
                            <td><button onclick="deleteTrainingProgram(${index})">Xóa</button></td>
                        `;

                        trainingTableBody.appendChild(row);
                    });
                }

                function deleteTrainingProgram(index) {
                    trainingPrograms.splice(index, 1);
                    localStorage.setItem('trainingPrograms', JSON.stringify(trainingPrograms));
                    displayTrainingPrograms();
                }

                document.querySelector('#trainingForm').addEventListener('submit', function (e) {
                    e.preventDefault();

                    let program = {
                        programName: document.querySelector('#programName').value,
                        startDate: document.querySelector('#startDate').value,
                        endDate: document.querySelector('#endDate').value,
                        sessionStartTime: document.querySelector('#sessionStartTime').value,
                        sessionEndTime: document.querySelector('#sessionEndTime').value,
                        trainerName: document.querySelector('#trainerName').value,
                    };

                    trainingPrograms.push(program);
                    localStorage.setItem('trainingPrograms', JSON.stringify(trainingPrograms));
                    displayTrainingPrograms();

                    document.querySelector('#trainingForm').reset();
                });

                displayTrainingPrograms();
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
    </body>
</html>
