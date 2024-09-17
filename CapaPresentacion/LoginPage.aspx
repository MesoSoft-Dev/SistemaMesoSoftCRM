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
  

    <style>
       .banner {
           /*background-color: var(--banner-color, #343A48); */
            top: 0;
            width: 100%;
            }
    </style>
</head>
<body>

  <div class="container-fluid position-fixed banner">
    <div class="row justify-content-between pb-3 pt-3 bg-primary align-items-center">
        <div class="col text-white">
            <h1>MesoSoft CRM <i class="bi bi-bar-chart-fill"></i></h1>
        </div>
        <div class="col-auto">
            <img src="Assets/Mesosoft.png" alt="logo" width="75" height="75" class="img-fluid">
        </div>
    </div>
</div>
    
    <form id="form1" runat="server">
        
     


        
        <div class="container">
            <div class="login-box">
                <!-- Sección de inicio de sesión -->
                <div id="loginSection">
                    <h2>Iniciar Sesión</h2>
                    <div class="login-form">
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
                <div id="changePasswordSection" class="hidden">
                    <h3>Cambiar Contraseña</h3>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Contraseña Actual" />
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Nueva Contraseña" />
                    <asp:TextBox ID="txtConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Confirmar Nueva Contraseña" />
                    <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-primary" Text="Aceptar" />
                    <br />
                    <a href="javascript:void(0);" onclick="showLogin()">Regresar a Iniciar Sesión</a>
                </div>

                <!-- Sección de recordar contraseña -->
                <div id="forgotPasswordSection" class="hidden">
                    <h3>Recordar Contraseña</h3>
                    <asp:TextBox ID="txtForgotUsername" runat="server" CssClass="form-control" Placeholder="Usuario" />
                    <asp:TextBox ID="txtForgotEmail" runat="server" CssClass="form-control" Placeholder="Email" />
                    <asp:TextBox ID="txtForgotName" runat="server" CssClass="form-control" Placeholder="Nombre" />
                    <asp:TextBox ID="txtForgotDni" runat="server" CssClass="form-control" Placeholder="DNI" />
                    <asp:Button ID="btnForgotPassword" runat="server" CssClass="btn btn-primary" Text="Aceptar" />
                    <br />
                    <a href="javascript:void(0);" onclick="showLogin()">Regresar a Iniciar Sesión</a>
                </div>
            </div>
        </div>
        <script src="../Assets/js/script.js"></script>
    </form>
</body>
</html>
