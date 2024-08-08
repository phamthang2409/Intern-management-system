document.addEventListener("DOMContentLoaded", function() {

    var registerModal = document.getElementById("registerModal");
    var loginModal = document.getElementById("loginModal");


    var registerBtn = document.getElementById("registerBtn");
    var loginBtn = document.getElementById("loginBtn");


    var closeRegister = document.getElementById("closeRegister");
    var closeLogin = document.getElementById("closeLogin");


    registerBtn.onclick = function() {
        registerModal.style.display = "block";
    }


    loginBtn.onclick = function() {
        loginModal.style.display = "block";
    }


    closeRegister.onclick = function() {
        registerModal.style.display = "none";
    }


    closeLogin.onclick = function() {
        loginModal.style.display = "none";
    }


    window.onclick = function(event) {
        if (event.target == registerModal) {
            registerModal.style.display = "none";
        }
        if (event.target == loginModal) {
            loginModal.style.display = "none";
        }
    }

    // kiểm tra lại mật khẩu
    var form = document.querySelector("form");
    var password = document.getElementById("register_password");
    var confirmPassword = document.getElementById("confirm_password");

    form.addEventListener("submit", function(event) {
        if (password.value !== confirmPassword.value) {
            event.preventDefault();
            alert("Mật khẩu và xác nhận mật khẩu không khớp.");
        }
    });
});
/*đăng xuất*/
document.addEventListener('DOMContentLoaded', function() {
    const logoutButton = document.getElementById('logout-button');

    logoutButton.addEventListener('click', function() {
        // Xử lý sự kiện đăng xuất
        // Ví dụ: Xóa token xác thực, chuyển hướng đến trang đăng nhập, v.v.
        alert('Bạn đã đăng xuất');
        window.location.href = 'index.html'; // Chuyển hướng đến trang chủ
    });
});
/*đánh giá */
document.addEventListener("DOMContentLoaded", function() {
    // Các chức năng modal đã có

    // Hiển thị form đánh giá
    window.showReviewForm = function(formId) {
        var form = document.getElementById(formId);
        form.style.display = form.style.display === "none" ? "block" : "none";
    };
});
/*đăng ký khóa học cho nhân viên*/
document.addEventListener("DOMContentLoaded", function() {
    // Hiển thị form đăng ký
    window.showRegistrationForm = function(formId) {
        var form = document.getElementById(formId);
        form.style.display = form.style.display === "none" ? "block" : "none";
    };
});
/*thêm nhân viên mới*/
document.addEventListener("DOMContentLoaded", function() {
    const employeeList = document.getElementById("employeeList");

    function displayEmployees() {
        if (employeeList) {
            employeeList.innerHTML = "";
            let employees = localStorage.getItem("employees");
            if (employees) {
                employees = JSON.parse(employees);
                employees.forEach(function(employee, index) {
                    const employeeDiv = document.createElement("div");
                    employeeDiv.className = "item";
                    employeeDiv.innerHTML = `
                        <h3>${employee.name}</h3>
                        <p>Email: ${employee.email}</p>
                        <p>Chức Vụ: ${employee.position}</p>
                        <div class="actions">
                            <button class="detail-btn" onclick="viewEmployeeDetail(${index})">Chi Tiết</button>
                            <button class="delete-btn" onclick="deleteEmployee(${index})">Xóa</button>
                        </div>
                    `;
                    employeeList.appendChild(employeeDiv);
                });
            } else {
                employeeList.innerHTML = "<p>Chưa có nhân viên nào.</p>";
            }
        }
    }

    window.deleteEmployee = function(index) {
        let employees = localStorage.getItem("employees");
        if (employees) {
            employees = JSON.parse(employees);
            employees.splice(index, 1);
            localStorage.setItem("employees", JSON.stringify(employees));
            displayEmployees(); // Cập nhật danh sách sau khi xóa
        }
    };

    window.viewEmployeeDetail = function(index) {
        let employees = localStorage.getItem("employees");
        if (employees) {
            employees = JSON.parse(employees);
            const employee = employees[index];

            // Lưu thông tin chi tiết nhân viên
            localStorage.setItem("employeeDetail", JSON.stringify(employee));

            // Chuyển hướng sang trang chi tiết nhân viên
            window.location.href = "employee_details.html";
        }
    };

    function loadEmployeeDetail() {
        const employeeDetailSection = document.getElementById("employeeDetail");
        if (employeeDetailSection) {
            let employee = localStorage.getItem("employeeDetail");
            if (employee) {
                employee = JSON.parse(employee);
                document.getElementById("employeeName").innerText = `Họ và Tên: ${employee.name}`;
                document.getElementById("employeeEmail").innerText = `Email: ${employee.email}`;
                document.getElementById("employeePosition").innerText = `Chức Vụ: ${employee.position}`;
            } else {
                employeeDetailSection.innerHTML = "<p>Không có thông tin nhân viên.</p>";
            }
        }
    }

    window.goBack = function() {
        window.location.href = "employee_list.html";
    };

    // Load employees list on page load
    displayEmployees();

    // Tải thông tin chi tiết về nhân viên nếu ở trang chi tiết
    loadEmployeeDetail();
    //trở về trang danh sách nhân viên
    window.goBack = function() {
        window.location.href = "employee_list.html";
    };

});

/*danh sách ứng viên*/
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('recruitmentForm');
    const recruitmentList = document.getElementById('recruitmentList');

    // Tải danh sách ứng viên từ localStorage
    const savedApplicants = JSON.parse(localStorage.getItem('applicants')) || [];
    savedApplicants.forEach(applicant => {
        addApplicantToList(applicant);
    });

    form.addEventListener('submit', function (event) {
        event.preventDefault(); // Ngăn không gửi biểu mẫu đến máy chủ

        // Lấy dữ liệu từ biểu mẫu
        const name = document.getElementById('ho-va-ten').value;
        const gender = document.getElementById('gioi-tinh').value;
        const dob = document.getElementById('ngay-sinh').value;
        const phone = document.getElementById('so-dien-thoai').value;
        const email = document.getElementById('email').value;
        const position = document.getElementById('vi-tri-ung-tuyen').value;
        const education = document.getElementById('trinh-do-hoc-van').value;
        const salary = document.getElementById('muc-luong-co-ban').value;

        const applicant = {
            name, gender, dob, phone, email, position, education, salary
        };

        // Thêm ứng viên vào danh sách
        addApplicantToList(applicant);

        // Lưu danh sách vào localStorage
        const currentApplicants = JSON.parse(localStorage.getItem('applicants')) || [];
        currentApplicants.push(applicant);
        localStorage.setItem('applicants', JSON.stringify(currentApplicants));

        // Xóa dữ liệu biểu mẫu
        form.reset();
    });

    function addApplicantToList(applicant) {
        const applicantDiv = document.createElement('div');
        applicantDiv.classList.add('applicant');

        // Thêm nội dung vào phần tử
        applicantDiv.innerHTML = `
            <h3>${applicant.name}</h3>
            <p><strong>Giới tính:</strong> ${applicant.gender}</p>
            <p><strong>Ngày sinh:</strong> ${applicant.dob}</p>
            <p><strong>Số điện thoại:</strong> ${applicant.phone}</p>
            <p><strong>Email:</strong> ${applicant.email}</p>
            <p><strong>Vị trí ứng tuyển:</strong> ${applicant.position}</p>
            <p><strong>Trình độ học vấn:</strong> ${applicant.education}</p>
            <p><strong>Mức lương cơ bản:</strong> ${applicant.salary}</p>
        `;

        recruitmentList.appendChild(applicantDiv);
    }
});



