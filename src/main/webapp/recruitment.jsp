<%-- 
    Document   : recruitment
    Created on : Aug 16, 2024, 10:55:19 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Tuyển dụng</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Quản lý Tuyển dụng</h1>
            <nav>
                <ul>
                    <li><a href="adminDashBoard"><button>Quay lại Bảng điều khiển</button></a></li>
                    <li><a href="internProfiles"><button>Quản lý Hồ sơ Thực tập sinh</button></a></li>
                    <li><a href="reprotingAnalysis"><button>Báo cáo và Phân tích</button></a></li>
                </ul>
            </nav>
        </header>

        <main>
            <h2>Thêm Chiến dịch Tuyển dụng</h2>
            <form id="recruitmentForm" action="recruitment" method="post">
                <table border="1px" cellspacing="0" cellpadding="5">
                    <tr>
                        <th>Tên Chiến dịch</th>
                        <th>Vị trí Tuyển dụng</th>
                        <th>Mức Lương</th>
                        <th>Trình độ Học vấn</th>
                    </tr>
                    <tr>
                        <td><input type="text" id="campaignName" name="campaignName" required></td>
                        <td><input type="text" id="position" name="position" placeholder="Nhập các vị trí, ngăn cách bởi dấu phẩy" required></td>
                        <td><input type="text" id="salary" name="salary" placeholder="Nhập các mức lương, ngăn cách bởi dấu phẩy" required></td>
                        <td><input type="text" id="education" name="education" placeholder="Nhập các trình độ, ngăn cách bởi dấu phẩy" required></td>
                    </tr>
                </table>
                <br>
                <button type="submit">Thêm Chiến dịch</button>
            </form>

            <h2>Danh sách Chiến dịch Tuyển dụng</h2>

            <table id="recruitmentTable" border="1" cellspacing="0" cellpadding="5">
                <thead>
                    <tr>
                        <th>Tên Chiến dịch</th>
                        <th>Vị trí</th>
                        <th>Mức Lương</th>
                        <th>Trình độ Học vấn</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <c:forEach items="${requestScope.listCampaign}" var="i">
                    <tbody>
                        <tr> 
                            <td>${i.campaignName}</td>
                            <td>${i.position}</td>
                            <td>${i.salary}</td>
                            <td>${i.education}</td>
                            <td><button name="delete" onclick="doDelete(${i.ID})">Xóa</button></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </main>
    </body>
    <script type="text/javascript">
            function doDelete(id){
                if (confirm("Are you want to delete ")){
                    window.location = "delete?id=" + id+ "&name=recruitment";
                }
            }
    </script>
</html>
