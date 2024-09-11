<%-- 
    Document   : interview_scheduling
    Created on : Sep 3, 2024, 3:57:28 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lên Lịch Phỏng vấn</title>
        <link rel="stylesheet" href="css/interview_scheduling.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Lên Lịch Phỏng vấn</h1>
            <%@include file="menu_staff.jsp"%>
        </header>

        <main>

            <form id="interviewForm">
                <h2>Lên Lịch Phỏng Vấn</h2>
                <label for="candidateName">Tên Thực tập sinh:</label>
                <input type="text" id="candidateName" name="candidateName" required><br><br>

                <label for="interviewDateTime">Ngày và Giờ:</label>
                <input type="datetime-local" id="interviewDateTime" name="interviewDateTime" required><br><br>

                <label for="location">Địa điểm Phỏng vấn:</label>
                <input type="text" id="location" name="location" required><br><br>

                <button type="submit">Thêm Lịch Phỏng vấn</button>
            </form>

            <table id="interviewTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Ngày và Giờ</th>
                        <th>Địa điểm</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Lịch phỏng vấn sẽ được thêm tại đây -->
                </tbody>
            </table>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                let interviewSchedule = JSON.parse(localStorage.getItem('interviewSchedule')) || [];

                function displayInterviews() {
                    const interviewTableBody = document.querySelector('#interviewTable tbody');
                    interviewTableBody.innerHTML = '';

                    interviewSchedule.forEach((interview, index) => {
                        let row = document.createElement('tr');

                        row.innerHTML = `
                            <td>${interview.candidate}</td>
                            <td>${interview.dateTime}</td>
                            <td>${interview.location}</td>
                            <td><button onclick="deleteInterview(${index})">Xóa</button></td>
                        `;

                        interviewTableBody.appendChild(row);
                    });
                }

                function deleteInterview(index) {
                    interviewSchedule.splice(index, 1);
                    localStorage.setItem('interviewSchedule', JSON.stringify(interviewSchedule));
                    displayInterviews();
                }

                document.querySelector('#interviewForm').addEventListener('submit', function (e) {
                    e.preventDefault();

                    let interview = {
                        candidate: document.querySelector('#candidateName').value,
                        dateTime: document.querySelector('#interviewDateTime').value,
                        location: document.querySelector('#location').value,
                        role: document.querySelector('#role').value
                    };

                    interviewSchedule.push(interview);
                    localStorage.setItem('interviewSchedule', JSON.stringify(interviewSchedule));
                    displayInterviews();

                    document.querySelector('#interviewForm').reset();
                });

                displayInterviews();
            });
        </script>

    </body>
</html>
