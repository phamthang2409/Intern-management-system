// script.js

// Lưu tên đầy đủ sau khi đăng ký
function saveRegisteredName() {
    const lastName = document.getElementById('lastName').value.trim();
    const firstName = document.getElementById('firstName').value.trim();
    const fullName = `${lastName} ${firstName}`;
    localStorage.setItem('registeredInternName', fullName);
}

// Kiểm tra và đồng bộ tên trên các trang khác
function syncNameInput(inputId) {
    const registeredName = localStorage.getItem('registeredInternName');
    const nameInput = document.getElementById(inputId);

    nameInput.addEventListener('blur', function () {
        if (nameInput.value.trim() !== registeredName) {
            alert("Tên không khớp với tên đã đăng ký. Vui lòng nhập lại.");
            nameInput.value = ''; // Xóa giá trị sai
            nameInput.focus(); // Đặt lại focus vào ô nhập liệu
        }
    });
}

// Tự động điền tên vào các trang khác nếu có phần tử với id tương ứng
function autoFillName(elementId) {
    const registeredName = localStorage.getItem('registeredInternName');
    const nameElement = document.getElementById(elementId);

    if (nameElement) {
        nameElement.textContent = registeredName;
    }
}

// Gọi hàm lưu tên sau khi thực tập sinh đăng ký
document.getElementById('internForm')?.addEventListener('submit', function() {
    saveRegisteredName();
});

// Ví dụ gọi hàm syncNameInput cho các trang có ô nhập liệu tên
// syncNameInput('internName');

// Ví dụ gọi hàm autoFillName cho các trang hiển thị tên
// autoFillName('profileName');
