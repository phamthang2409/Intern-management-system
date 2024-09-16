<%-- 
    Document   : menu_staff
    Created on : Sep 3, 2024, 4:05:03 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
            <nav>
                <ul>
                    <li><a href="staffDashBoard"><button>Trang Chủ</button></a></li>
                    <li><a href="interviewScheduling"><button>Lên Lịch Phỏng vấn</button></a></li>
                    <li><a href="performanceTracking"><button>Theo dõi Hiệu suất</button></a></li>
                </ul>
            </nav>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
    </body>
</html>
