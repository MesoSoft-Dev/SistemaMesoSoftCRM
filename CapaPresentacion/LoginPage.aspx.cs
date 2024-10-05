using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string empresa = txtEmpresa.Text;      // Obtiene el valor del campo "Empresa"
            string email = txtEmail.Text;          // Obtiene el valor del campo "Email"
            string password = txtPassword.Text;    // Obtiene el valor del campo "Contraseña"
        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string currentCompany = txtCurrentCompany.Text;
            string currentUser = txtCurrentUser.Text;
            string currentPassword = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmNewPassword = txtConfirmNewPassword.Text;

            Login cambio = new Login();

        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            string empresa = txtForgotUsername.Text;  // Campo "Empresa"
            string usuario = txtForgotEmail.Text;     // Campo "Usuario"
            string contraseña = txtForgotName.Text;   // Campo "Contraseña"
            string correoElectronico = txtForgotDni.Text;  // Campo "Correo Electrónico"

            Login recordar = new Login();
        }
    }
}