<%-- 
    Document   : forgotPassword
    Created on : Nov 21, 2024, 10:20:52 PM
    Author     : Tran Ngoc Phuoc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="./css/forgotPassword.css">
</head>
<body>

    <div class="forgot-password-container">
        <c:if test="${requestScope.success != null}">
            <div class="notification success">
                <h2 style="color: green">${requestScope.success}</h2>
            </div>
        </c:if>
        <c:if test="${requestScope.error != null}">
            <div class="notification error">
                <h2 style="color: red">${requestScope.error}</h2>
            </div>
        </c:if>
        <h2>Forgot Password</h2>
        <p>Enter your email address below and we'll send you instructions to reset your password.</p>
        <form action="forgotPassword" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="buttons" style="display: flex">
                <button type="submit" class="btn" style="margin-right: 15px">Send Password</button>
                <button type="button" class="btn" style="background-color: #e04646"><a href="login.jsp" style="text-decoration: none; color: white">Back</a></button>
            </div>
        </form>
    </div>
</body>
<script>
    setTimeout(() => {
        const notification = document.querySelector('.notification');
        if (notification) {
            notification.style.display = 'none';
        }
    }, 5000); // Ẩn sau 5 giây
</script>

</html>

