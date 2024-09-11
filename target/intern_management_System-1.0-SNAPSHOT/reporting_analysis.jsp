<%-- 
Document   : reporting_analysis
Created on : Aug 28, 2024, 10:42:44 AM
Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Báo cáo và Phân tích</title>
        <link rel="stylesheet" href="css/reporting_analysis.css">
        <script src="js/script.js"></script>
    </head>
    <body>
        <header>
            <h1>Báo cáo và phân tích</h1>
            <nav>
                <ul>
                    <li><a href="adminDashBoard"><button>Trang Chủ</button></a></li>
                    <li><a href="recruitment"><button>Quản lý Tuyển dụng</button></a></li>
                    <li><a href="internProfiles"><button>Quản lý Hồ sơ Thực tập sinh</button></a></li>
                    <li><a href="reprotingAnalysis"><button>Báo cáo và Phân tích</button></a></li>
                </ul>
                
            </nav>
            <button id="logoutButton" onclick="doClick()">Đăng Xuất</button>
        </header>
            <main>
                <h2>Báo cáo Hiệu suất Thực tập sinh</h2>
                <table id="reportingTable">
                    <thead>
                        <tr>
                            <th>Tên Thực tập sinh</th>
                            <th>Số buổi vắng</th>
                            <th>Kỹ năng</th>
                            <th>Điểm</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Hiệu suất của thực tập sinh sẽ được thêm tại đây -->
                    </tbody>
                </table>
            </main>

            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    // Lấy dữ liệu từ Local Storage
                    let performanceData = JSON.parse(localStorage.getItem('performanceData')) || [];

                    // Hàm hiển thị dữ liệu báo cáo hiệu suất thực tập sinh
                    function displayPerformanceReport() {
                        const reportingTableBody = document.querySelector('#reportingTable tbody');
                        reportingTableBody.innerHTML = ''; // Xóa dữ liệu cũ

                        performanceData.forEach(performance => {
                            let row = document.createElement('tr');

                            let internNameCell = document.createElement('td');
                            internNameCell.textContent = performance.internName;
                            row.appendChild(internNameCell);

                            let absentSessionsCell = document.createElement('td');
                            absentSessionsCell.textContent = performance.absentSessions;
                            row.appendChild(absentSessionsCell);

                            let skillNameCell = document.createElement('td');
                            skillNameCell.textContent = performance.skillName;
                            row.appendChild(skillNameCell);

                            let skillScoreCell = document.createElement('td');
                            skillScoreCell.textContent = performance.skillScore;
                            row.appendChild(skillScoreCell);

                            reportingTableBody.appendChild(row);
                        });
                    }

                    // Hiển thị báo cáo khi trang được tải
                    displayPerformanceReport();
                });
                syncNameInput('internName'); // ID của ô nhập liệu tên thực tập sinh
                autoFillName('profileName'); // ID của phần tử hiển thị tên thực tập sinh
            </script>

            <script>
                function doClick() {
                    if (confirm("Are you want to exit? ")) {
                        window.location = "resetSession";
                    }
                }
            </script>
    </body>
</html>
