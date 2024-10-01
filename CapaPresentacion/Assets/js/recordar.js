$("#btnForgotPassword").on("click", function (event) {
    

    
    event.preventDefault();

    var empresa = $("#txtForgotUsername").val();
    var usuario = $("#txtForgotEmail").val();
    var contraseña = $("#txtForgotName").val();
    var correo = $("#txtForgotDni").val();

    
    console.log("Empresa: " + empresa);
    console.log("Usuario: " + usuario);
    console.log("Contraseña: " + contraseña);
    console.log("Correo Electronico: " + correo);
    
    
});