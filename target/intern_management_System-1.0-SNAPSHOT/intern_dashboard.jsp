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
    <body>
        <header>
            <h1>Bảng điều khiển Thực tập sinh</h1>
             <li id="username">
                            <a id="user" href="#" role="button" >
                                Xin chào,
                            </a>                              
                        </li>
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
                            <p><strong>Vị trí ứng tuyển:</strong> <span id="profilePosition">${i.getProfilePosition()}</span></p>
                        </div>
                    </div>
            </section>

            <!-- Nhắc nhở và lịch -->
            <section class="notifications">
                <div class="reminders">
                    <h3>Nhắc nhở mới, chưa xem</h3>
                    <p>${requestScope.cntInterview}</p>
                    <a href="#">Xem chi tiết</a>
                </div>
                <div class="schedule">
                    <h3>Lịch Phỏng Vấn</h3>
                    <input type="hidden" name="candidate" value="${requestScope.account}"/>
                    <a href="interviewSchedule">Xem chi tiết</a>
                </div>
            </section>

            <!-- Biểu đồ -->
            <section class="chart">
                <canvas id="scoreChart"></canvas>
            </section>
            <!-- Bong bóng chat -->
    <div class="chat-bubble" id="chatBubble">
        <i class="chat-icon">💬</i>
    </div>

    <!-- Cửa sổ chat -->
    <div class="chat-window" id="chatWindow">
        <header>
            <h3>Nhắn tin với chúng tôi</h3>
        </header>
        <div class="chat-content">
            <p>Xin chào! Bạn cần hỗ trợ gì?</p>
            <!-- Khung nhập liệu chat -->
            <textarea placeholder="Nhập tin nhắn..."></textarea>
        </div>
        <button class="send-btn">Gửi</button>
    </div>
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
        <script>
            // Khi nhấp vào bong bóng chat, mở/đóng cửa sổ chat
document.getElementById('chatBubble').addEventListener('click', function() {
    var chatWindow = document.getElementById('chatWindow');
    if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
        chatWindow.style.display = 'flex'; // Hiển thị cửa sổ chat
    } else {
        chatWindow.style.display = 'none'; // Ẩn cửa sổ chat
    }
});

// Xử lý gửi tin nhắn từ khung chat
document.getElementById('sendButton').addEventListener('click', function() {
    var chatInput = document.getElementById('chatInput').value;
    var chatContent = document.getElementById('chatContent');

    if (chatInput.trim() !== "") {
        // Lưu tin nhắn vào localStorage để chia sẻ với các trang khác
        var messages = JSON.parse(localStorage.getItem('chatMessages')) || [];
        messages.push("Bạn: " + chatInput);
        localStorage.setItem('chatMessages', JSON.stringify(messages));

        // Tạo thẻ <p> mới để hiển thị tin nhắn trên trang hiện tại
        var newMessage = document.createElement('p');
        newMessage.textContent = "Bạn: " + chatInput;
        chatContent.appendChild(newMessage);

        // Xóa nội dung trong khung nhập
        document.getElementById('chatInput').value = '';

        // Cuộn xuống để xem tin nhắn mới nhất
        chatContent.scrollTop = chatContent.scrollHeight;
    }
});

// Đồng bộ thông tin từ trang intern_dashboard
document.addEventListener('DOMContentLoaded', function () {
    // Lấy thông tin thực tập sinh từ trang (hoặc từ dữ liệu nào đó trong thực tế)
    let internName = document.getElementById('profileName').textContent;

    // Hiển thị lời chào dựa trên thông tin
    var chatContent = document.getElementById('chatContent');
    var greetingMessage = document.createElement('p');
    greetingMessage.textContent = "Xin chào " + internName + "! Chúng tôi có thể giúp gì cho bạn?";
    chatContent.appendChild(greetingMessage);

    // Hiển thị các tin nhắn đã lưu trữ
    var storedMessages = JSON.parse(localStorage.getItem('chatMessages')) || [];
    storedMessages.forEach(function(message) {
        var messageElement = document.createElement('p');
        messageElement.textContent = message;
        chatContent.appendChild(messageElement);
    });
});

        </script>
    </body>
</html>
