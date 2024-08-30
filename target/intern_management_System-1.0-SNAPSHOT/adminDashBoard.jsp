<%-- 
    Document   : adminDashBoard
    Created on : Aug 27, 2024, 11:00:33 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <h2>Đăng ký Thực tập sinh mới</h2>
                <table id="newInternsTable" class="table-row" border = "1px">
                    <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Email</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Dữ liệu thực tập sinh mới đăng ký sẽ được hiển thị tại đây -->
                    </tbody>
                </table>
            </section>

            <section class="info-box">
                <h2>Danh sách Hồ sơ Thực tập sinh</h2>
                <table id="internsTable" class="table-row" border = "1px">
                    <thead>
                    <tr>
                        <th>Tên Thực tập sinh</th>
                        <th>Email</th>
                        <th>Trình độ học vấn</th>
                        <th>Vị trí ứng tuyển</th>
                        <th>Mức lương</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Dữ liệu hồ sơ đã duyệt sẽ được hiển thị tại đây -->
                    </tbody>
                </table>
            </section>
        </main>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Lấy danh sách thực tập sinh từ Local Storage
                let internProfiles = JSON.parse(localStorage.getItem('internProfiles')) || [];
                let approvedInterns = JSON.parse(localStorage.getItem('approvedInterns')) || [];
                let newInternsTable = document.getElementById('newInternsTable').getElementsByTagName('tbody')[0];
                let internsTable = document.getElementById('internsTable').getElementsByTagName('tbody')[0];

                // Hiển thị danh sách đăng ký mới
                internProfiles.forEach((profile, index) => {
                    let row = newInternsTable.insertRow();
                    row.insertCell(0).textContent = profile.lastName + ' ' + profile.firstName;
                    row.insertCell(1).textContent = profile.email;
                    let actionCell = row.insertCell(2);

                    // Nút Duyệt
                    let approveButton = document.createElement('button');
                    approveButton.textContent = 'Duyệt';
                    approveButton.addEventListener('click', function () {
                        // Thêm vào danh sách đã duyệt
                        approvedInterns.push(profile);
                        localStorage.setItem('approvedInterns', JSON.stringify(approvedInterns));

                        // Xóa khỏi danh sách đăng ký mới
                        internProfiles.splice(index, 1);
                        localStorage.setItem('internProfiles', JSON.stringify(internProfiles));
                        window.location.reload(); // Reload trang để cập nhật giao diện
                    });
                    actionCell.appendChild(approveButton);

                    // Nút Từ chối
                    let rejectButton = document.createElement('button');
                    rejectButton.textContent = 'Từ chối';
                    rejectButton.addEventListener('click', function () {
                        // Xóa khỏi danh sách đăng ký mới
                        internProfiles.splice(index, 1);
                        localStorage.setItem('internProfiles', JSON.stringify(internProfiles));
                        window.location.reload(); // Reload trang để cập nhật giao diện
                    });
                    actionCell.appendChild(rejectButton);
                });

                // Hiển thị danh sách thực tập sinh đã duyệt
                approvedInterns.forEach(profile => {
                    let row = internsTable.insertRow();
                    row.insertCell(0).textContent = profile.lastName + ' ' + profile.firstName;
                    row.insertCell(1).textContent = profile.email;
                    row.insertCell(2).textContent = profile.education;
                    row.insertCell(3).textContent = profile.position;
                    row.insertCell(4).textContent = profile.salary;
                });
            });
            syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
            autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
        </script>
    </body>
</html>
