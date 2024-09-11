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
                    <div class="title">NGỌC PHƯỚC THOÁT Ế VỚI NHƯ NHƯ TRONG MỘT NGÀY MƯA<span class="new">new</span></div>
                    <a href="#" class="detail">Xem chi tiết</a>
                </div>
                <!-- Add more announcements as needed -->
            </div>

            <div class="login-box">
                <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                <c:if test="${requestScope.account == null}">
                    <h3 style="color: red">${requestScope.msg}</h3>
                </c:if>
                <form action="login" method="post">
                    <input type="text" name="userName" placeholder="Nhập mã sinh viên" required>
                    <input type="password" name="passWord" placeholder="Nhập mật khẩu" required>
                    <div class="login-role">
                        <label for="role">Quyền đăng nhập:</label>
                        <select name="role" id="role">
                            <option value="admin">Quản trị viên</option>
                            <option value="staff">Người hướng dẫn</option>
                            <option value="intern">Thực tập sinh</option>
                        </select>
                    </div>

                    <button type="submit">Đăng Nhập</button>
                </form>
            </div>
        </div>
    </body>
</html>
