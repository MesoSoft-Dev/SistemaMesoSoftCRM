using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaLogicaNegocio;
using CapaModelo;

namespace CapaPresentacion
{
    public partial class _Default : Page
    {
        private LoginLN login = new LoginLN();
        private UserSessionModel _userData = new UserSessionModel();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void btnLogin_Click(object sender, EventArgs e)
        {
            string empresa     = txtEmpresa.Text;
            string usuario     = txtEmail.Text;
            string contrasenia = txtPassword.Text;

            if (string.IsNullOrEmpty(empresa) || string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(contrasenia))
            {
                Response.Write("<script>alert('EMPRESA, USUARIO Y CONTRASEÑA SON CAMPOS OBLIGATORIOS PARA INICIAR SESIÓN.')</script>");
            }
            else
            {
                var authService = new AuthService();
                var result = await authService.LoginAsync(usuario, contrasenia);

                if (result.isSuccess)
                {
                    Session["UserId"] = result.data.id_usuario;
                    Session["GroupId"] = result.data.id_grupo;
                    Session["NameUser"] = result.data.nombre_usuario;
                    Session["IsAdmin"] = result.data.EsAdmin;
                    Session["IdCompany"] = result.data.idEmpresa;
                    Session["Company"] = result.data.Empresa;
                    Session["BranchId"] = result.data.idSucursal;
                    Session["Branch"] = result.data.Sucursal;
                    Session["IdManagement"] = result.data.idGerencia;
                    Session["Management"] = result.data.Gerencia;
                    Session["AreaId"] = result.data.idArea;
                    Session["Area"] = result.data.Area;

                    Response.Redirect("panelDeControl.aspx");
                }
                else
                {
                    // Mostrar mensaje de error en ventana modal
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"alert('{result.message}');", true);
                }
            }


        }

        protected async void btnForgotPassword_Click(object sender, EventArgs e)
        {
            string currentCompany = txtCurrentCompanyFP.Text;
            string currentUser    = txtCurrentUserFP.Text;
            //string currentPass    = txtCurrentPasswordFP.Text;
            string currentEmail   = txtCurrentEmailFP.Text;

            if (string.IsNullOrEmpty(currentCompany) || string.IsNullOrEmpty(currentUser) ||
                string.IsNullOrEmpty(currentEmail))
            {
                Response.Write("<script>alert('PARA RECORDAR LA CONTRASEÑA, TODOS LOS CAMPOS SON MANDATORIOS.')</script>");
            }
            else
            {
                var forgotPassService = new ForgotPasswordServices();
                var result = await forgotPassService.ForgotPasswordAsync(currentUser);

                if (result.isSuccess)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"alert('{result.message}');", true);
                }
            }
        }

        protected async void btnChangePassword_Click(object sender, EventArgs e)
        {
            string newPassConfirm = txtConfirmNewPassword.Text;
            string newPass        = txtNewPassword.Text;
            string currentPass    = txtCurrentPassword.Text;
            string currentUser    = txtCurrentUser.Text;
            string currentCompany = txtCurrentCompany.Text;

            if (string.IsNullOrEmpty(newPassConfirm) || string.IsNullOrEmpty(newPass) || string.IsNullOrEmpty(currentPass) ||
                string.IsNullOrEmpty(currentUser) || string.IsNullOrEmpty(currentCompany))
            {
                Response.Write("<script>alert('PARA CAMBIAR LA CONTRASEÑA, TODOS LOS CAMPOS SON MANDATORIOS.')</script>");
            }
            else 
            {
                var changePassService = new ChangePasswordServices();
                var result = await changePassService.ChangePasswordAsync(currentUser, currentPass, newPass, newPassConfirm);

                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"alert('{result.message}');", true);
                
            }

        }
    }
}