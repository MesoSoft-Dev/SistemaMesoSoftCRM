    <%@ Page Title="Login" Language="C#"  AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CapaPresentacion._Default" ClientIDMode="Static" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Content/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" type="text/css" href="Assets/css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 

   
    <style>
        .fondo {
    background-image: linear-gradient(0deg, rgba(221, 212, 206, 0.6), rgba(221, 212, 206, 0.6)), url(Assets/img/fondoGranFrancia.png);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    font-family: 'Times New Roman', Times, serif;
    font-size: 18px;
}

       
       
    </style>

  </head>
<body class="fondo">

    <form id="form1" class="w-100 " runat="server">
      
        <div class="container ">
            <div class="login-box bg-opacity-50 bg-white p-0 m-0 rounded-0 align-content-center justify-content-center">
                <!-- Sección de inicio de sesión -->
                  <div class="row align-content-center mb-0 pb-0 ">
                        <img src="Assets/img/granFranciaBannerLogin.png" alt="logo" class="img-fluid"/>
                   </div>
            <div id="loginSection" class="px-4">
                    
                   <div class="login-form mt-2 pt-2 align-content-center justify-content-center">
                        <p class="py-0 my-0 fw-bold">Empresa</p>
                        <asp:TextBox ID="txtEmpresa" runat="server" CssClass="form-control" Placeholder="Ingresar Empresa" />
                        <p class="py-0 my-0 fw-bold">Usuario</p>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Ingresar Email" />
                        <p class="py-0 my-0 fw-bold">Contraseña</p>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control mb-4" TextMode="Password" Placeholder="Ingresar Contraseña" />
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn incBoton" Text="Iniciar Sesión" OnClick="btnLogin_Click" />
                    </div>
                    <div class="options fw-bold mt-4">
                        <a class="pt-1 text-black " href="javascript:void(0);" onclick="showChangePassword()">Cambiar Contraseña</a>
                        <a class="pt-1 text-black " href="javascript:void(0);" onclick="showForgotPassword()">Recordar Contraseña</a>
                    </div>
                </div>

                <!-- Sección de cambiar contraseña -->
                <div id="changePasswordSection" class="hidden pb-1 mb-1">
    <div class="pt-0 mt-0 pb-3 px-4 rounded-0 change-password">
        <p class="py-0 my-0  fw-bold">Empresa</p>
        <asp:TextBox ID="txtCurrentCompany" runat="server" CssClass="form-control " TextMode="Password" Placeholder="Ingresa Empresa" />
        <p class="py-0 my-0 fw-bold">Usuario</p>
        <asp:TextBox ID="txtCurrentUser" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Ingresa Usuario" />
        <p class="py-0 my-0 fw-bold">Contraseña Actual</p>
        <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Ingresa Contraseña Actual" />
        <p class="py-0 my-0  fw-bold">Nueva Contraseña</p>
        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Ingresa Nueva Contraseña" />
        <p class="py-0 my-0  fw-bold">Confirmar Contraseña</p>
        <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass=" form-control" TextMode="Password" Placeholder="Confirmar Nueva Contraseña" />
        <div class="d-flex justify-content-center">
            <asp:Button ID="btnChangePassword" runat="server" Class="btn incBoton w-100 my-3" Text="Cambiar" />
        </div>
        <br />
    </div>

    
    <div class="d-flex justify-content-between px-4 pt-1 p ">
        <a href="javascript:void(0);" onclick="showForgotPassword()" class="text-black fw-bold">¿Olvidaste la contraseña?</a>
        <a href="javascript:void(0);" onclick="showLogin()" class="text-black fw-bold">Regresar a Iniciar Sesión</a>
    </div>
</div>

                <!-- Sección de recordar contraseña -->
                <div id="forgotPasswordSection" runat="server" class="hidden ">
                <div  class="remember-password px-4 mt-0 pt-0 rounded-0">
                    <p class="py-0 my-0 fw-bold">Empresa</p>
                    <asp:TextBox ID="txtForgotUsername" runat="server" Class="form-control" Placeholder="Ingresar Empresa" />
                    <p class="py-0 my-0 fw-bold">Usuario</p>
                     <asp:TextBox ID="txtForgotEmail" runat="server" Class="form-control" Placeholder="Ingresar Usuario" />
                     <p class="py-0 my-0 fw-bold">Contraseña</p>
                     <asp:TextBox ID="txtForgotName" runat="server" Class="form-control " Placeholder="Ingresar Contraseña" /> 
                    <div class="d-flex justify-content-center mt-1 mb-1">
                     <asp:Button ID="btnForgotPassword" runat="server" Class="btn incBoton w-100 my-3" Text="Recordar" />
                    </div>
                    <div class="pt-2 d-flex align-items-center mb-5">
                    <p class="mb-0 fw-bold">Correo Electrónico:</p>
                     <asp:TextBox ID="txtForgotDni" runat="server" Class="form-control ms-2" Placeholder="Ingresar Correo Electrónico" />
                     </div>
                  
                    </div>
                     <div class="d-flex justify-content-between p-1 m-1">
      <a class="text-black fw-bold " href="javascript:void(0);" onclick="showChangePassword()">Cambiar Contraseña</a>
     <a href="javascript:void(0);" onclick="showLogin()" class="text-black fw-bold">Regresar a Iniciar Sesión</a>
     </div>
                    
                </div>
            </div>
        </div>
        <script src="../Assets/js/script.js"></script>
        <script src="Assets/js/recordar.js"></script>
    </form>
</body>
</html>