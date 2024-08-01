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
