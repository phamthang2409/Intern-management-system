<%-- 
    Document   : intern_dashboard
    Created on : Aug 17, 2024, 1:15:12 PM
    Author     : PC
--%>
<!--Trang chủ Intern-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bảng điều khiển Thực tập sinh</title>
        <link rel="stylesheet" href="css/intern_dashboard.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="script.js"></script>
    </head>
    <body>
        <header>
            <h1>Bảng điều khiển Thực tập sinh</h1>
            <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>
        </header>

        <main>
            <!-- Hồ sơ thông tin -->
            <section class="profile-section">
                <h2>HỒ SƠ:</h2>
                <c:set var="i" value="${requestScope.internProfile}"/>
                    <div class="profile-info">
                        <div class="profile-details-left">
                            <p><strong>Họ và Tên:</strong> <span id="profileName">${i.getProfileFirstName()} ${i.getProfileLastName()}</span></p>
                            <p><strong>Ngày sinh:</strong> <span id="profileDob">${i.getProfileDOB()}</span></p>
                            <p><strong>Email:</strong> <span id="profileEmail">${i.getProfileEmail()}</span></p>
                            <p><strong>Số điện thoại:</strong> <span id="profilePhone">${i.getProfilePhone()}</span></p>
                        </div>
                        <div class="profile-details-right">
                            <p><strong>Trình độ học vấn:</strong> <span id="profileEducation">${i.getProfileEducation()}</span></p>
                            <p><strong>Vị trí ứng tuyển:</strong> <span id="profilePosition"></span>${i.getProfilePosition()}</p>
                        </div>
                    </div>
            </section>

            <!-- Nhắc nhở và lịch -->
            <section class="notifications">
                <div class="reminders">
                    <h3>Nhắc nhở mới, chưa xem</h3>
                    <p>${requestScope.cntInterview}</p>
                    <a href="video-call-demo/user1.html">Xem chi tiết</a>
                </div>
                <div class="schedule">
                    <h3>Lịch</h3>
                    <input type="hidden" name="candidate" value="${requestScope.account}"/>
                    <p>0</p>
                    <a href="video-call-demo/user1.html">Xem chi tiết</a>
                </div>
            </section>

            <!-- Biểu đồ -->
            <section class="chart">
                <canvas id="scoreChart"></canvas>
            </section>
        </main>


        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy thông tin hồ sơ từ Local Storage
                let internProfiles = JSON.parse(localStorage.getItem('internProfiles')) || [];
                let lastProfile = internProfiles[internProfiles.length - 1];

                if (lastProfile) {
                    document.getElementById('profileName').textContent = lastProfile.lastName + ' ' + lastProfile.firstName;
                    document.getElementById('profileDob').textContent = lastProfile.dob;
                    document.getElementById('profileEmail').textContent = lastProfile.email;
                    document.getElementById('profilePhone').textContent = lastProfile.phone;
                    document.getElementById('profileEducation').textContent = lastProfile.education;
                    document.getElementById('profilePosition').textContent = lastProfile.position;
                    document.getElementById('profileSalary').textContent = lastProfile.salary;
                } else {
                    document.getElementById('profileInfo').textContent = "Không có hồ sơ nào được tìm thấy.";
                }

                // Nút hoàn thành xem lại
                document.getElementById('completeReviewButton').addEventListener('click', function () {
                    window.location.href = 'index.html';
                });
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // Initialize the bar chart
            var ctx = document.getElementById('scoreChart').getContext('2d');
            var scoreChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Kỳ 1', 'Kỳ 2', 'Kỳ 3', 'Kỳ 4'],
                    datasets: [
                        {
                            label: 'Điểm của bạn',
                            data: [8, 7, 6, 7],
                            backgroundColor: 'rgba(255, 99, 132, 0.2)',
                            borderColor: 'rgba(255, 99, 132, 1)',
                            borderWidth: 1
                        }
                    ]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </body>
</html>
