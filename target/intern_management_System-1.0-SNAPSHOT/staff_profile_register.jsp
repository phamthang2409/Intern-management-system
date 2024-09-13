<%-- 
    Document   : staff_profile_register
    Created on : Sep 11, 2024, 5:29:36 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng Ký Hồ Sơ Nhân Viên</title>
    <a href="staff_profile_register.jsp"></a>
        <link rel="stylesheet" href="css/intern_profile_registrantion.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
       <body>
        <div class="container">
            <h2>Thêm Hồ Sơ Thực Tập Sinh</h2>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
            <form id="internForm" action="staffRegister" method="post">
                <!-- Họ và Tên -->
                <div class="form-group">
                    <label for="firstName">Họ:</label>
                    <input type="text" id="firstName" name="firstName" placeholder="Họ" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Tên:</label>
                    <input type="text" id="lastName" name="lastName" placeholder="Tên" required>
                </div>

                <!-- Ngày sinh -->
                <div class="form-group">
                    <label for="dob">Ngày tháng năm sinh:</label>
                    <input type="date" id="dob" name="dob" required>
                </div>

                <!-- Số điện thoại -->
                <div class="form-group">
                    <label for="phone">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" placeholder="Số điện thoại" required>
                </div>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Email" required>
                </div>

                <!-- Trình độ học vấn -->
                <div class="form-group">
                    <label for="education">Trình độ học vấn:</label>
                    <select type="program" id="education" name="education" placeholder="Trình độ học vấn" required>
                        <option value="Bằng đại học">Bằng đại học</option>
                        <option value="Đã tốt nghiệp">Đã tốt nghiệp</option>
                        <option value="Chưa tốt nghiệp">Chưa tốt nghiệp</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="position">Vị trí ứng tuyển:</label>
                    <select type="program" id="position" name="position" placeholder="Vị trí công việc" required>
                        <option value="Staff">Staff</option>
                        <option value="Mentor">Mentor</option>
                    </select>
                </div>
                 
                <div class="form-group">
                    <label for="salary">Mức lương làm việc:</label>
                    <input id="salary" name="salary" placeholder="Mức lương làm việc" required>
                </div>

                <!-- Nút Submit -->
                <div class="form-group">
                    <button type="submit" class="submit-button">Thêm</button>
                </div>
            </form>
        </div>
    </body>

</html>
