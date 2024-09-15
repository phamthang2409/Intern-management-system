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
            <a href="login"><button id="logoutButton"> Đăng Xuất</button></a>
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
                            <td><button type="submit" onclick="addProgress()">Thêm Tiến độ</button></td>
                        </tr>
                        <c:forEach items="${requestScope.listProgress}" var="i">
                            <tr>
                                <td>${i.getInternID()}</td>
                                <td>${i.getDateReport()}</td>
                                <td>${i.getDescription()}</td>
                                <td><button name="delete" onclick="doDelete(${i.getCandidateID()})">Xóa</button></td>
                            </tr>
                        </c:forEach>

                    </tbody>
                </table>
            </form>
        </main>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you want to delete")) {
                    window.location = "delete?id=" + id + "&name=dailyProgress";
                }
            }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Hiển thị tiến độ khi trang được tải
                displayProgress();
            });

            function addProgress() {
                // Lấy dữ liệu từ các trường nhập liệu
                let internName = document.getElementById('internName').value;
                let date = document.getElementById('date').value;
                let description = document.getElementById('description').value;

                // Kiểm tra xem tất cả các thông tin đã được nhập chưa
                if (!internName || !date || !description) {
                    alert("Vui lòng nhập đầy đủ thông tin.");
                    return;
                }

                // Tạo đối tượng chứa thông tin tiến độ mới
                let progress = {
                    name: internName,
                    date: date,
                    description: description
                };

                // Lấy dữ liệu tiến độ hiện có từ Local Storage
                let dailyProgress = JSON.parse(localStorage.getItem('dailyProgress')) || [];

                // Thêm tiến độ mới vào danh sách
                dailyProgress.push(progress);

                // Lưu lại danh sách vào Local Storage
                localStorage.setItem('dailyProgress', JSON.stringify(dailyProgress));

                // Cập nhật bảng hiển thị tiến độ
                displayProgress();

                // Xóa dữ liệu trong các trường nhập liệu sau khi lưu
                document.getElementById('internName').value = '';
                document.getElementById('date').value = '';
                document.getElementById('description').value = '';

                alert("Tiến độ mới đã được lưu.");
            }

        </script>
    </body>
</html>
