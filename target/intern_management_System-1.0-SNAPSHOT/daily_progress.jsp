<%-- 
    Document   : daily_progress
    Created on : Aug 23, 2024, 11:06:25 AM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h2>Tiến độ Hằng ngày của Thực tập sinh</h2>

            <!-- Bảng chứa form nhập liệu và tiến độ -->
            <table id="progressTable">
                <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Ngày</th>
                        <th>Mô tả Tiến độ</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Hàng chứa form nhập liệu -->
                    <tr>
                        <td><input type="text" id="internName" placeholder="Nhập tên thực tập sinh"></td>
                        <td><input type="date" id="date"></td>
                        <td><input type="text" id="description" placeholder="Nhập mô tả tiến độ"></td>
                        <td><button onclick="addProgress()">Thêm Tiến độ</button></td>
                    </tr>
                    <!-- Các tiến độ hằng ngày sẽ được thêm vào đây -->
                </tbody>
            </table>
        </main>

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

            function displayProgress() {
                // Lấy dữ liệu tiến độ từ Local Storage
                let dailyProgress = JSON.parse(localStorage.getItem('dailyProgress')) || [];
                let tableBody = document.querySelector('#progressTable tbody');

                // Xóa nội dung hiện tại trong bảng, trừ hàng đầu tiên (form nhập liệu)
                tableBody.innerHTML = tableBody.rows[0].outerHTML;

                // Duyệt qua danh sách tiến độ và hiển thị lên bảng
                dailyProgress.forEach(progress => {
                    let row = document.createElement('tr');

                    let nameCell = document.createElement('td');
                    nameCell.textContent = progress.name;
                    row.appendChild(nameCell);

                    let dateCell = document.createElement('td');
                    dateCell.textContent = progress.date;
                    row.appendChild(dateCell);

                    let descriptionCell = document.createElement('td');
                    descriptionCell.textContent = progress.description;
                    row.appendChild(descriptionCell);

                    // Thêm hàng vào bảng
                    tableBody.appendChild(row);
                });
            }
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh


        </script>
    </body>
</html>
