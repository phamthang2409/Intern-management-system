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
        <title>Intern Page</title>
        <link rel="stylesheet" href="css/intern_dashboard.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Bảng điều khiển Thực tập sinh</h1>
        </header>

    <main>
        <section class="info-box">
            <h2>Thông tin Hồ sơ Đã Đăng Ký</h2>
            <c:if test="${requestScope.listIntern != null}">
                <c:set var="cnt" value="${requestScope.cnt}"/>
                    <c:forEach var="i" items="${requestScope.listIntern}">
                        <h3>Hồ sơ thứ ${cnt = cnt + 1}:</h3>
                        <div id="profileInfo">
                            <p><strong>Họ và Tên:</strong> <span id="profileName">${i.getProfileFirstName()} ${i.getProfileLastName()}</span></p>
                            <p><strong>Ngày tháng năm sinh:</strong> <span id="profileDob">${i.getProfileDOB()}</span></p>
                            <p><strong>Email:</strong> <span id="profileEmail">${i.getProfileEmail()}</span></p>
                            <p><strong>Số điện thoại:</strong> <span id="profilePhone">${i.getProfilePhone()}</span></p>
                            <p><strong>Trình độ học vấn:</strong> <span id="profileEducation">${i.getProfileEducation()}</span></p>
                            <p><strong>Vị trí ứng tuyển:</strong> <span id="profilePosition">${i.getProfilePosition()}</span></p>
                            <p><strong>Mức lương mong muốn:</strong> <span id="profileSalary">${i.getProfileSalary()}</span></p>
                        </div>
                    </c:forEach>
            </c:if>

            <!-- Nút hoàn thành xem lại -->
            <button id="completeReviewButton">Hoàn Thành Xem Lại</button>
        </section>
        <button onclick="location.href='internProfileRegister';">Đăng ký Thực tập sinh</button>

    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Lấy thông tin hồ sơ từ Local Storage
//            let internProfiles = JSON.parse(localStorage.getItem('internProfiles')) || [];
//            let lastProfile = internProfiles[internProfiles.length - 1];
//
//            if (lastProfile) {
//                document.getElementById('profileName').textContent = lastProfile.lastName + ' ' + lastProfile.firstName;
//                document.getElementById('profileDob').textContent = lastProfile.dob;
//                document.getElementById('profileEmail').textContent = lastProfile.email;
//                document.getElementById('profilePhone').textContent = lastProfile.phone;
//                document.getElementById('profileEducation').textContent = lastProfile.education;
//                document.getElementById('profilePosition').textContent = lastProfile.position;
//                document.getElementById('profileSalary').textContent = lastProfile.salary;
//            } else {
//                document.getElementById('profileInfo').textContent = "Không có hồ sơ nào được tìm thấy.";
//            }

            // Nút hoàn thành xem lại
            document.getElementById('completeReviewButton').addEventListener('click', function() {
                window.location.href = 'index.html';
            });
        });
        syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
        autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
    </script>
    </body>
</html>
