<%-- 
    Document   : training_program
    Created on : Sep 3, 2024, 4:08:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thiết lập Chương trình Đào tạo</title>
        <link rel="stylesheet" href="css/traning_program.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Thiết lập Chương trình Đào tạo</h1>
            <%@include file="menu_mentor.jsp"%>
        </header>
        
        <main>
            <h2>Chương trình Đào tạo</h2>
            <c:if test="${requestScope.msg != null}">
                <h2 style="color: red">${requestScope.msg}</h2>
            </c:if>
            <form id="trainingForm" action="trainingForm" method="post">
                <label for="programName">Tên Chương trình:</label>
                <input type="text" id="programName" name="programName" required><br><br>

                <label for="startDate">Ngày Bắt đầu Khóa học:</label>
                <input type="date" id="startDate" name="startDate" required><br><br>

                <label for="endDate">Ngày Kết thúc Khóa học:</label>
                <input type="date" id="endDate" name="endDate" required><br><br>

                <label for="sessionStartTime">Thời gian Bắt đầu Buổi học:</label>
                <input type="time" id="sessionStartTime" name="sessionStartTime" pattern="[0-9]{2}:[0-9]{2}" required><br><br>

                <label for="sessionEndTime">Thời gian Kết thúc Buổi học:</label>
                <input type="time" id="sessionEndTime" name="sessionEndTime" pattern="[0-9]{2}:[0-9]{2}" required><br><br>

                <label for="trainerName">Tên Người Phụ trách:</label>
                <select type="text" id="trainerName" name="trainerName" required>
                    <c:forEach items="${requestScope.listProfileStaff}" var="i">
                        <option value="${i.getTrainerName()}">${i.getTrainerName()}</option>
                    </c:forEach>
                    
                </select>
                <br><br>

                <button type="submit">Thêm Chương trình Đào tạo</button>
            </form>

            <table id="trainingTable" style="text-align: center" border = 1px>
                <thead>
                    <tr>
                        <th>Tên Chương trình</th>
                        <th>Ngày Bắt đầu</th>
                        <th>Ngày Kết thúc</th>
                        <th>Thời gian Bắt đầu Buổi học</th>
                        <th>Thời gian Kết thúc Buổi học</th>
                        <th>Người Phụ trách</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.listTraining}" var="i">
                        <tr>
                            <td>${i.programName}</td>
                            <td>${i.startDate}</td>
                            <td>${i.endDate}</td>
                            <td>${i.sessionStartTime}</td>
                            <td>${i.sessionEndTime}</td>
                            <td>${i.trainerName}</td>
                            <td><button name="delete" onclick="doDelete(${i.ID})">Xóa</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
    </body>
    <script type="text/javascript">
            function doDelete(id){
                if (confirm("Are you want to delete")){
                    window.location = "delete?id=" + id +"&name=trainingForm";
                }
            }
    </script>
</html>
