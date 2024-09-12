<%-- 
    Document   : login
    Created on : Aug 15, 2024, 11:18:57 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!--        <div class="auth-container">
                    <div class="login-container">
                        <h2>Đăng nhập</h2>
        <c:if test="${requestScope.account == null}">
            <h3 style="color: red">${requestScope.msg}</h3>
        </c:if>
        <form id="loginForm" action="login" method="post">
        <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="userName" required value="${cookie.cUser}">

        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="passWord" required value="${cookie.cPass}">
        <input type="checkbox" ${cookie.cRem != null ? '' : 'checked'} name="rem" value="On"/> Remember Me
        <button type="submit">Đăng nhập</button>
        <p id="errorMessage"></p>
    </form>
</div>
</div>-->

        <div class="header">
            <div class="logo">
                <h1>QUẢN LÝ THỰC TẬP SINH</h1>
            </div>
        </div>

        <div class="content">
            <div class="notification">
                <h2>THÔNG BÁO</h2>
                <div class="announcement">
                    <div class="date">Tháng 09</div>
                    <div class="title">Về việc đăng ký đồng phục đối với sinh viên khóa 2024
                    Thông báo đến sinh viên chương trình tiên tiến, chuẩn và hoàn toàn tiếng Anh khóa 2024 về việc đăng ký đồng phục trực tiếp tại Trường<span class="new">new</span></div>
                    <a href="https://sv.ut.edu.vn/sinh-vien/tin-tuc/ve-viec-dang-ky-dong-phuc-doi-voi-sinh-vien-khoa-2024.html?pIDDanhMuc=368" class="detail">Xem chi tiết</a>
                </div>
                  <div class="announcement">
                    <div class="date">Tháng 10</div>
                    <div class="title">THÔNG BÁO VỀ VIỆC ĐĂNG KÝ HỌC PHẦN HỌC KỲ 1 NĂM HỌC 2024-2025<span class="new">new</span></div>
                    <a href="https://sv.ut.edu.vn/sinh-vien/tin-tuc/thong-bao-ve-viec-dang-ky-hoc-phan-hoc-ky-1-nam-hoc-2024-2025.html?pIDDanhMuc=368" class="detail">Xem chi tiết</a>
                </div>
                  <div class="announcement">
                    <div class="date">Tháng 07</div>
                    <div class="title">Thông báo về việc Khảo sát ý kiến bạn đọc năm học 2023-2024
Nhằm tiếp thu ý kiến, đống góp, phản hồi của người sử dụng trong việc đáp ứng nhu cầu về nguồn lực thông tin trong hoạt động học tập, nghiên cứu và giảng dạy của Người học, GV, CB-CNV, NLĐ tại Trường Đại học Giao thông vận tải TP.Hồ Chí Minh, từ đó giúp Trung tâm Thông tin - Thư viện đưa ra những<span class="new">new</span></div>
                    <a href="https://sv.ut.edu.vn/sinh-vien/tin-tuc/ve-viec-dang-ky-dong-phuc-doi-voi-sinh-vien-khoa-2024.html?pIDDanhMuc=368" class="detail">Xem chi tiết</a>
                </div>
                  <div class="announcement">
                    <div class="date">Tháng 04</div>
                    <div class="title">Đăng ký bổ sung học phần giáo dục thể chất học kỳ 2 năm học 2023-2024 đối với sinh viên chính quy chương trình chuẩn (đại trà)<span class="new">new</span></div>
                    <a href="https://sv.ut.edu.vn/sinh-vien/tin-tuc/dang-ky-bo-sung-hoc-phan-giao-duc-the-chat-hoc-ky-2-nam-hoc-2023-2024-doi-voi-sinh-vien-chinh-quy-chuong-trinh-chuan-dai-tra.html?pIDDanhMuc=368" class="detail">Xem chi tiết</a>
                </div>
                <!-- Add more announcements as needed -->
            </div>

            <div class="login-box">
                <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                <c:if test="${requestScope.account == null}">
                    <h3 style="color: red">${requestScope.msg}</h3>
                </c:if>
                <form action="login">
                    <input type="text" name="userName" placeholder="Nhập mã sinh viên" required>
                    <input type="password" name="passWord" placeholder="Nhập mật khẩu" required>
                    <button type="submit">Đăng Nhập</button>
                </form>
            </div>
        </div>
    </body>
</html>
    