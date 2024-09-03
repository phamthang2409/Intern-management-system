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
            <a href="index.html"><button id="logoutButton"> Đăng Xuất</button></a>
        </header>

        <main>
            <section class="info-box">
                <h2>Danh Sách Thực tập sinh Ứng Tuyển</h2>
                <table id="newInternsTable" class="table-row" border = "1px">
                    <thead>
                        <tr>
                            <th>Họ và Tên</th>
                            <th>Ngày tháng năm sinh</th>
                            <th>Email</th>
                            <th>Vị trí ứng tuyển</th>
                            <th>Mức lương</th>
                            <th>Hành động</th>
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
                                <td>
                                    <button name="ADD" onclick="doADD(${i.ID})">Duyệt</button>
                                    <button name="delete" onclick="doDelete(${i.ID})">Hủy Bỏ</button> 
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                    </tbody>
                </table>
            </section>

            <section class="info-box">
                <h2>Danh sách Hồ sơ Thực tập sinh</h2>
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
                            <th>Hành động</th>
                        </tr>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Dữ liệu hồ sơ đã duyệt sẽ được hiển thị tại đây -->
                    </tbody>
                </table>
            </section>
        </main>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you want to delete ")) {
                    window.location = "handleAdminDashBoard?id=" + id + "action=delete";
                }
            }
            function doADD(id) {
                if (confirm("Are you want to ADD Intern ")) {
                    window.location = "handleAdminDashBoard?id=" + id + "action=add";
                }
            }
        </script>
    </body>
</html>
