<%@ Page Title="Login" Language="C#"  AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="CapaPresentacion._Default" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Content/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <title>Iniciar Sesión</title>
    <link rel="stylesheet" type="text/css" href="../Assets/css/styles.css" />
  </head>
<body>

    <form id="form1" class="w-100" runat="server">
      
        <div class="container">
            <div class="login-box pt-0 px-0 rounded-0 ">
                <!-- Sección de inicio de sesión -->
                  <div class="row align-content-center pb-4">
                        <img src="Assets/bannerCRM.png" alt="logo" class="img-fluid"/>
                   </div>
            <div id="loginSection" class="px-4 ">
                    <h2>Iniciar Sesión</h2>
                   <div class="login-form ">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Contraseña" />
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Iniciar Sesión" />
                    </div>
                    <div class="options">
                        <a class="pt-1" href="javascript:void(0);" onclick="showChangePassword()">Cambiar Contraseña</a>
                        <a class="pt-1" href="javascript:void(0);" onclick="showForgotPassword()">Recordar Contraseña</a>
                    </div>
                </div>

                <!-- Sección de cambiar contraseña -->
                <div id="changePasswordSection" class="hidden px-4 rounded-0">
                    <h3>Cambiar Contraseña</h3>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Contraseña Actual" />
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Nueva Contraseña" />
                    <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirmar Nueva Contraseña" />
                    <div class="d-flex justify-content-center">
                    <asp:Button ID="btnChangePassword" runat="server" Class="btn btn-primary w-100" Text="Aceptar" />
                    </div>
                    <br />
                    <a href="javascript:void(0);" onclick="showLogin()">Regresar a Iniciar Sesión</a>
                </div>

                <!-- Sección de recordar contraseña -->
                <div id="forgotPasswordSection" class="hidden px-4 rounded-0">
                    <h3>Recordar Contraseña</h3>
                    <asp:TextBox ID="txtForgotUsername" runat="server" Class="form-control" Placeholder="Ingresar Empresa" />
                     <asp:TextBox ID="txtForgotEmail" runat="server" Class="form-control" Placeholder="Ingresar Usuario" />
                     <asp:TextBox ID="txtForgotName" runat="server" Class="form-control" Placeholder="Ingresar Contraseña" /> 
                    <div class="d-flex justify-content-center mt-1 mb-1">
                     <asp:Button ID="btnForgotPassword" runat="server" Class="btn btn-primary w-100" Text="Aceptar" />
                    </div>
                    <asp:TextBox ID="txtForgotDni" runat="server" Class="form-control mt-2" Placeholder="Correo Electronico para enviar Contraseña" />
                    <br />
                    <a href="javascript:void(0);" onclick="showLogin()">Regresar a Iniciar Sesión</a>
                </div>
            </div>
        </div>
        <script src="../Assets/js/script.js"></script>
    </form>
</body>
</html>
