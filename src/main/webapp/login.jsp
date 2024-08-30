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
        <link rel="stylesheet" href="css/style.css"/>
    </head>
    <body>
        <div class="auth-container">
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
        </div>
    </body>
</html>
