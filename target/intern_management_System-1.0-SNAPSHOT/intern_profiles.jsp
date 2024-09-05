<%-- 
    Document   : intern_profiles
    Created on : Aug 28, 2024, 10:25:34 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý Hồ sơ Thực tập sinh</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Quản lý Hồ sơ Thực tập sinh</h1>
            <nav>
                <ul>
                    <ul>
                        <li><a href="adminDashBoard"><button>Trang Chủ</button></a></li>
                        <li><a href="internProfileRegister"><button>Thêm thực tập sinh </button></a></li>

                    </ul>
            </nav>
        </header>
        <main>
            <c:if test="${requestScope.msg != null}">
                <h3 style="color: red">${requestScope.msg}</h3>
            </c:if>
            <h2>Danh sách Thực tập sinh</h2>
            <c:if test="${requestScope.listIntern == null}">
                <h3>Không có dữ liệu tìm thấy</h3>
            </c:if>
            <c:if test="${requestScope.listIntern != null}">
                <table id="internsTable" class="table-row" border = '1px' style="text-align: center">
                    <thead>
                        <tr>
                            <th>Họ và Tên</th>
                            <th>Ngày tháng năm sinh</th>
                            <th>Email</th>
                            <th>Số điện thoại</th>
                            <th>Trình độ học vấn</th>
                            <th>Vị trí ứng tuyển</th>
                            <th>Mức lương</th>
                            <th>Hành động</th>
                            <th>Cấp tài khoản</th>
                        </tr>
                    </thead>
                    <c:forEach items="${requestScope.listIntern}" var="i">
                        <tbody>
                            <tr>
                                <td>${i.getProfileFirstName()} ${i.getProfileLastName()}</td>
                                <td>${i.getProfileDOB()}</td>
                                <td>${i.getProfileEmail()}</td>
                                <td>${i.getProfilePhone()}</td>
                                <td>${i.getProfileEducation()}</td>
                                <td>${i.getProfilePosition()}</td>
                                <td>${i.getProfileSalary()}</td>
                                <td>
                                    <button name="delete" onclick="doDelete(${i.getID()})">Xóa</button>
                                </td>
                                <td>
                                    <button name="add" onclick="doADD(${i.getID()})">Cấp tài khoản</button>
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </c:if>
        </main>

        <script type="text/javascript">
            function doDelete(id) {
                if (confirm("Are you want to delete ")) {
                    window.location = "delete?id=" + id +"&name=internProfiles";
                }
            }
            
            function doADD(id){
                window.location = "register?id="+id;
            }
        </script>
    </body>
</html>
