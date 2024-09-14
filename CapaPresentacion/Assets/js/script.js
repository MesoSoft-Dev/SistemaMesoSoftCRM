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
