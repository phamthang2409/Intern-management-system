document.addEventListener("DOMContentLoaded", function() {
    // Get the modals
    var registerModal = document.getElementById("registerModal");
    var loginModal = document.getElementById("loginModal");

    // Get the buttons that open the modals
    var registerBtn = document.getElementById("registerBtn");
    var loginBtn = document.getElementById("loginBtn");

    // Get the <span> elements that close the modals
    var closeRegister = document.getElementById("closeRegister");
    var closeLogin = document.getElementById("closeLogin");

    // When the user clicks the button, open the register modal
    registerBtn.onclick = function() {
        registerModal.style.display = "block";
    }

    // When the user clicks the button, open the login modal
    loginBtn.onclick = function() {
        loginModal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the register modal
    closeRegister.onclick = function() {
        registerModal.style.display = "none";
    }

    // When the user clicks on <span> (x), close the login modal
    closeLogin.onclick = function() {
        loginModal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == registerModal) {
            registerModal.style.display = "none";
        }
        if (event.target == loginModal) {
            loginModal.style.display = "none";
        }
    }

    // Password confirmation for register form
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
