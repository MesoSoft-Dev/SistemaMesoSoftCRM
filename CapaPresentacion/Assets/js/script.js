function showChangePassword() {
    document.getElementById('loginSection').classList.add('hidden');
    document.getElementById('forgotPasswordSection').classList.add('hidden');
    document.getElementById('changePasswordSection').classList.remove('hidden');
}

function showForgotPassword() {
    document.getElementById('loginSection').classList.add('hidden');
    document.getElementById('changePasswordSection').classList.add('hidden');
    document.getElementById('forgotPasswordSection').classList.remove('hidden');
}

function showLogin() {
    document.getElementById('loginSection').classList.remove('hidden');
    document.getElementById('changePasswordSection').classList.add('hidden');
    document.getElementById('forgotPasswordSection').classList.add('hidden');
}

//funcion de clase active
document.addEventListener("DOMContentLoaded", function () {
    var currentPage = window.location.pathname.split("/").pop().replace('.aspx', '');

    var navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(function (link) {
        link.classList.remove('active');
    });

    var activeLink = document.getElementById(currentPage);
    if (activeLink) {
        activeLink.classList.add('active');
    }
});
