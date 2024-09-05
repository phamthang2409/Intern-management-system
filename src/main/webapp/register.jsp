<%-- 
    Document   : register
    Created on : Aug 15, 2024, 11:35:37 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--        <link rel="stylesheet" href="css/style.css"/>-->
        <link rel="stylesheet" href="css/index.css"/>
    </head>
    <body>
        <div class="register-container">
            <h2>Đăng ký</h2>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
            <form id="registerForm" action="register" method="post">
                <input type="hidden" id = "internID" name ="internID" value="${requestScope.internID_raw}"/>
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
                    <option value="staff">Nhân viên phụ trách</option>
                </select>
                <button type="submit">Đăng ký</button>
                <p id="registerMessage"></p>
            </form>
        </div>
    </body>
</html>
