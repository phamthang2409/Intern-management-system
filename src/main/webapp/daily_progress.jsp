<%-- 
    Document   : daily_progress
    Created on : Aug 23, 2024, 11:06:25 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Theo dõi Tiến độ Hằng ngày</title>
        <link rel="stylesheet" href="css/daily_progress.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="script.js"></script>
    </head>
    <body>
        <header>
            <h1> Tiến độ Hằng ngày</h1>
            <nav>
                <ul>
                    <li><a href="mentorDashBoard"><button>Trang chủ</button></a></li>
                </ul>
            </nav>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>
        <main>
            <h2>Báo cáo tiến độ hằng ngày của Thực tập sinh</h2>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
            <!-- Bảng chứa form nhập liệu và tiến độ -->
            <form action="dailyProgress" method="post">
                <c:set var="t" value="${sessionScope.mentorProfile}"/>
                <input type="hidden" name="mentorID" value="${t.getID()}"/>
                <table id="progressTable">
                    <thead>
                        <tr>
                            <th>Mã số Thực tập sinh</th>
                            <th>Ngày</th>
                            <th>Mô tả Tiến độ</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Hàng chứa form nhập liệu -->
                        <tr>
                            <td><input type="text" id="internID" name="internID" placeholder="Nhập mã số thực tập sinh"></td>
                            <td><input type="date" id="date" name="date"></td>
                            <td><input type="text" id="description" name="description" placeholder="Nhập mô tả tiến độ"></td>
                            <td><button type="submit">Thêm Tiến độ</button></td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <table id="progressTable" style="padding-top: 50px ">
                <thead>
                    <tr>
                        <th>Mã số Thực tập sinh</th>
                        <th>Ngày</th>
                        <th>Mô tả Tiến độ</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hàng chứa form nhập liệu -->
                    <c:if test="${requestScope.listProgress != null}">
                        <c:forEach items="${requestScope.listProgress}" var="i">
                            <tr>
                                <td>${i.getInternID()}</td>
                                <td>${i.getDateReport()}</td>
                                <td>${i.getDescription()}</td>
                                <td><button id="delete" onclick="doDelete(${i.getID()})">Xóa</button></td>
                            </tr>
                        </c:forEach>
                    </c:if>

                </tbody>
            </table>
        </main>
    </body>
    <script type="text/javascript">
        function doDelete(id) {
            if (confirm("Are you want to delete")) {
                window.location = "delete?id=" + id + "&name=dailyProgress";
            }
        }
        function doClick() {
            if (confirm("Are you want to exit? ")) {
                window.location = "resetSession";
            }
        }
    </script>
</html>
