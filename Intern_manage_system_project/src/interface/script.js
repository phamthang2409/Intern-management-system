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
    const addEmployeeForm = document.getElementById("addEmployeeForm");

    if (addEmployeeForm) {
        addEmployeeForm.addEventListener("submit", function(event) {
            event.preventDefault();

            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const position = document.getElementById("position").value;

            const employee = {
                name: name,
                email: email,
                position: position
            };

            let employees = localStorage.getItem("employees");
            if (employees) {
                employees = JSON.parse(employees);
            } else {
                employees = [];
            }

            employees.push(employee);
            localStorage.setItem("employees", JSON.stringify(employees));

            window.location.href = "employee_list.html";
        });
    }

    const employeeList = document.getElementById("employeeList");

    function displayEmployees() {
        if (employeeList) {
            employeeList.innerHTML = "";
            let employees = localStorage.getItem("employees");
            if (employees) {
                employees = JSON.parse(employees);
                employees.forEach(function(employee) {
                    const employeeDiv = document.createElement("div");
                    employeeDiv.className = "item";
                    employeeDiv.innerHTML = `
                        <h3>${employee.name}</h3>
                        <p>Email: ${employee.email}</p>
                        <p>Chức Vụ: ${employee.position}</p>
                    `;
                    employeeList.appendChild(employeeDiv);
                });
            } else {
                employeeList.innerHTML = "<p>Chưa có nhân viên nào.</p>";
            }
        }
    }


    displayEmployees();
});

/*danh sách ứng viên*/
document.addEventListener("DOMContentLoaded", function() {
    const recruitmentForm = document.getElementById("recruitmentForm");

    if (recruitmentForm) {
        recruitmentForm.addEventListener("submit", function(event) {
            event.preventDefault();

            const name = document.getElementById("name").value;
            const email = document.getElementById("email").value;
            const position = document.getElementById("position").value;

            const applicant = {
                name: name,
                email: email,
                position: position
            };

            let applicants = localStorage.getItem("applicants");
            if (applicants) {
                applicants = JSON.parse(applicants);
            } else {
                applicants = [];
            }

            applicants.push(applicant);
            localStorage.setItem("applicants", JSON.stringify(applicants));

            // khởi động form
            recruitmentForm.reset();

            // tải lại applicants list
            displayApplicants();
        });
    }

    const recruitmentList = document.getElementById("recruitmentList");

    function displayApplicants() {
        if (recruitmentList) {
            recruitmentList.innerHTML = "";
            let applicants = localStorage.getItem("applicants");
            if (applicants) {
                applicants = JSON.parse(applicants);
                applicants.forEach(function(applicant) {
                    const applicantDiv = document.createElement("div");
                    applicantDiv.className = "applicant";
                    applicantDiv.innerHTML = `
                        <h3>${applicant.name}</h3>
                        <p>Email: ${applicant.email}</p>
                        <p>Vị Trí Ứng Tuyển: ${applicant.position}</p>
                    `;
                    recruitmentList.appendChild(applicantDiv);
                });
            } else {
                recruitmentList.innerHTML = "<p>Chưa có ứng viên nào.</p>";
            }
        }
    }


    displayApplicants();
});

