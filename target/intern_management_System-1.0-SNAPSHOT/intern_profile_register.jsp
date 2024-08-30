<%-- 
    Document   : intern_profile_register
    Created on : Aug 17, 2024, 1:44:39 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Ký Hồ Sơ Thực Tập Sinh Page</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <div class="container">
            <h2>Đăng Ký Hồ Sơ Thực Tập Sinh</h2>
            <form id="internForm"  action="internProfileRegister" method="post">
                <!-- Họ và Tên -->
                <div class="form-group">
                    <label for="firstName">Họ:</label>
                    <input type="text" id="firstName" name="firstName" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Tên:</label>
                    <input type="text" id="lastName" name="lastName" required>
                </div>

                <!-- Ngày tháng năm sinh -->
                <div class="form-group">
<!--                    <label for="dob">Ngày tháng năm sinh: </label>-->
                    Ngày tháng năm sinh:<input type="date" name="dob">
                </div>

                <!-- Số điện thoại -->
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <!-- Trình độ học vấn -->
                <div class="form-group">
                    <label for="education">Trình độ học vấn:</label>
                    <input id="education" name="education" required>
                </div>

                <!-- Vị trí ứng tuyển -->
                <div class="form-group">
                    <label for="position">Vị trí ứng tuyển:</label>
                    <input id="position" name="position" required>
                </div>

                <!-- Mức lương -->
                <div class="form-group">
                    <label for="salary">Mức lương mong muốn:</label>
                    <input id="salary" name="salary" required>
                </div>
<!--                <div class="auth-container">
                    <div class="register-container">
                        <h2>Cấp tài khoản</h2>
                        <form id="registerForm">
                            <label for="newUsername">Tên đăng nhập:</label>
                            <input type="text" id="newUsername" name="newUsername" required>

                            <label for="newPassword">Mật khẩu:</label>
                            <input type="password" id="newPassword" name="newPassword" required>

                            <label for="confirmPassword">Nhập lại mật khẩu:</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" required>

                            <label for="role">Vai trò:</label>
                            <select id="role" name="role">
                                <option value="intern">Thực tập sinh</option>
                                <option value="mentor">Mentor</option>
                                <option value="admin">Quản trị viên</option>
                                <option value="staff">Nhân viên phụ trách</option>
                            </select>

                            <button type="submit">Đăng ký</button>
                            <p id="registerMessage"></p>
                        </form>
                    </div>
                </div>-->
                <button type="submit">Đăng ký</button>
            </form>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
        </div>

        <script>

//            document.addEventListener('DOMContentLoaded', function () {
//                let recruitments = JSON.parse(localStorage.getItem('recruitments')) || [];
//                let educationSelect = document.getElementById('education');
//                let positionSelect = document.getElementById('position');
//                let salarySelect = document.getElementById('salary');
//
//                // Làm sạch các danh sách hiện có
//                educationSelect.innerHTML = '';
//                positionSelect.innerHTML = '';
//                salarySelect.innerHTML = '';
//
//                // Gộp tất cả các tùy chọn từ các chiến dịch khác nhau
//                let allEducations = new Set();
//                let allPositions = new Set();
//                let allSalaries = new Set();
//
//                recruitments.forEach(recruitment => {
//                    recruitment.education.split(',').forEach(edu => allEducations.add(edu.trim()));
//                    recruitment.position.split(',').forEach(pos => allPositions.add(pos.trim()));
//                    recruitment.salary.split(',').forEach(sal => allSalaries.add(sal.trim()));
//                });
//
//                // Thêm các tùy chọn vào các dropdown
//                allEducations.forEach(edu => {
//                    let option = document.createElement('option');
//                    option.value = edu;
//                    option.textContent = edu;
//                    educationSelect.appendChild(option);
//                });
//
//                allPositions.forEach(pos => {
//                    let option = document.createElement('option');
//                    option.value = pos;
//                    option.textContent = pos;
//                    positionSelect.appendChild(option);
//                });
//
//                allSalaries.forEach(sal => {
//                    let option = document.createElement('option');
//                    option.value = sal;
//                    option.textContent = sal;
//                    salarySelect.appendChild(option);
//                });
//            });
//
//            document.getElementById('internForm').addEventListener('submit', function() {
//                saveRegisteredName();
//            });


            function validateForm() {
                const lastName = document.getElementById('lastName').value.trim();
                const firstName = document.getElementById('firstName').value.trim();
                const phone = document.getElementById('phone').value.trim();
                const email = document.getElementById('email').value.trim();
                const position = document.getElementById('position').value;

                if (!lastName || !firstName || !phone || !email) {
                    alert('Vui lòng điền đầy đủ tất cả các trường thông tin.');
                    return false;
                }

                const phonePattern = /^[0-9]{10,}$/;
                if (!phonePattern.test(phone)) {
                    alert('Vui lòng nhập số điện thoại hợp lệ (ít nhất 10 chữ số).');
                    return false;
                }

                const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailPattern.test(email)) {
                    alert('Vui lòng nhập địa chỉ email hợp lệ.');
                    return false;
                }

                let internProfiles = JSON.parse(localStorage.getItem('internProfiles')) || [];

                // Kiểm tra trùng lặp email
                let isDuplicateEmail = internProfiles.some(profile => profile.email === email);

                if (isDuplicateEmail) {
                    alert('Email đã được đăng ký trước đó.');
                    return false;
                }

                const profile = {
                    lastName,
                    firstName,
                    dob: document.getElementById('dob').value.trim(),
                    phone,
                    email,
                    education: document.getElementById('education').value,
                    position,
                    salary: document.getElementById('salary').value
                };

                internProfiles.push(profile);
                localStorage.setItem('internProfiles', JSON.stringify(internProfiles));

                // Chuyển hướng tới intern_dashboard.html sau khi lưu thông tin
                window.location.href = 'intern_dashboard.jsp';
                return false;
            }
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh


        </script>
    </body>
</html>
