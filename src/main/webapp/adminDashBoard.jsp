<%-- 
    Document   : adminDashBoard
    Created on : Aug 27, 2024, 11:00:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Chủ Quản trị viên</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Bảng điều khiển Quản trị viên</h1>
            <nav>
                <ul>
                    <li><a href="adminDashBoard"><button>Trang Chủ</button></a></li>
                    <li><a href="recruitment"><button>Quản lý Tuyển dụng</button></a></li>
                    <li><a href="internProfiles"><button>Quản lý Hồ sơ Thực tập sinh</button></a></li>
                    <li><a href="reprotingAnalysis"><button>Báo cáo và Phân tích</button></a></li>
                </ul>
            </nav>
            <!--            <a href="login"></a>-->
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>

        <main>
            <section class="info-box">
                <h2>Danh Sách Thực tập sinh</h2>
                <table id="newInternsTable" class="table-row" border = "1px" style="text-align: center" >
                    <thead>
                        <tr>
                            <th>Họ và Tên</th>
                            <th>Ngày tháng năm sinh</th>
                            <th>Email</th>
                            <th>Vị trí ứng tuyển</th>
                            <th>Mức lương</th>
                            <th>Tình Trạng</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listIntern}" var="i">
                        <tbody>
                            <tr>
                                <td>${i.getProfileFirstName()} ${i.getProfileLastName()}</td>
                                <td>${i.getProfileDOB()}</td>
                                <td>${i.getProfileEmail()}</td>
                                <td>${i.getProfilePosition()}</td>
                                <td>${i.getProfileSalary()}</td>
                                <c:if test="${i.getStatus() == 0}">
                                    <td>Chưa cấp tài khoản</td>
                                </c:if>
                                <c:if test="${i.getStatus() == 1}">
                                    <td>Đã cấp tài khoản</td>
                                </c:if>    
                            </tr>
                        </tbody>
                    </c:forEach>
                    </tbody>
                </table>
            </section>

            <section class="info-box">
                <h2>Danh sách Tuyển Dụng</h2>
                <table id="internsTable" class="table-row" border = "1px">
                    <thead>
                        <tr>
                        <tr>
                            <th>Họ và Tên</th>
                            <th>Ngày tháng năm sinh</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Trình độ học vấn</th>
                            <th>Vị trí ứng tuyển</th>
                            <th>Mức lương</th>
                        </tr>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dữ liệu hồ sơ đã duyệt sẽ được hiển thị tại đây -->
                    </tbody>
                </table>
            </section>
        </main>
    </body>
    <script type="text/javascript">
        function doClick() {
            if (confirm("Are you want to exit? ")) {
                window.location = "resetSession";
            }
        }
    </script>
</html>
