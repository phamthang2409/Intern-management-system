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
        <title>Đăng ký</title>
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
        <div class="login-box">
            <h3> CẤP TÀI KHOẢN </h3>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
            <form action="register" method="post">
                <input type="hidden" id = "profileID" name ="profileID" value="${requestScope.profileID_raw}"/>
                <input type="hidden" id = "profilePosition" name ="profilePosition" value="${requestScope.profilePosition}"/>
                <input type="text" name="userName" placeholder="Nhập mã số" required>
                <input type="password" name="passWord" placeholder="Nhập mật khẩu" required>
                <input type="password" name="re_passWord" placeholder="Nhập lại mật khẩu" required>
<!--                <div class="login-role">
                    <label for="role">Quyền:</label>
                    <select name="role" id="role">
                        <option value="admin">Quản trị viên</option>
                        <option value="staff">Người hướng dẫn</option>
                        <option value="intern">Thực tập sinh</option>
                    </select>
                </div>-->

                <button type="submit">Đăng Ký</button>
            </form>
        </div>
    </body>
</html>
