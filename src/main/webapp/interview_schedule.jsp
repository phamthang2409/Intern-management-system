<%-- 
    Document   : interview_schedule
    Created on : Sep 13, 2024, 11:14:48 PM
    Author     : laptop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lịch Phỏng Vấn</title>
        <link rel="stylesheet" href="css/staff_dashboard.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
         <h2>Lịch Phỏng vấn</h2>
            <table id="interviewTableDisplay" border="1" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>Người Phụ Trách</th>
                        <th>Ngày phỏng vấn</th>
                        <th>Giờ bắt đầu</th>
                        <th>Địa điểm</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listInterviewScheduling}" var="i">
                        <tr>
                            <td>${i.getCandidateName()}</td>
                            <td>${i.getStartDate()}</td>
                            <td>${i.getSessionStartTime()}</td>
                            <td>${i.getLocation()}</td>
                            <td> <a href="video-call-demo/user1.html">Tham Gia</a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
    </body>
</html>
