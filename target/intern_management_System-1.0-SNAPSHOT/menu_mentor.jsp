<%-- 
    Document   : menu_mentor
    Created on : Sep 11, 2024, 10:17:31 AM
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
                <li><a href="mentorDashBoard"><button>Trang chủ</button></a></li>
                <li><a href="dailyProgress"><button>Quản lý Tiến độ Hằng ngày</button></a></li>
                <li><a href="trainingForm"><button>Thiết lập Chương trình đào tạo</button></a></li>
                <li><a href="skillAssessment"><button>Đánh giá Kỹ năng</button></a></li>
                <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
            </ul>
        </nav>

    </body>
</html>
