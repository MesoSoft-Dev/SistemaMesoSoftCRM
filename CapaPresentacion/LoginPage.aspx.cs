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
            string empresa = txtEmpresa.Text;
            string usuario = txtEmail.Text;
            string contraseña = txtPassword.Text;

            string passEmpresa = "lagranfrancia";
            string passUsuario = "lagranfrancia@gmail.com";
            string passContraseña = "12345";



            if (empresa == passEmpresa && usuario == passUsuario && contraseña == passContraseña)
            {
                Response.Write("<script>alert('Usuario Correcto')</script>");
                Response.Redirect("panelDeControl.aspx");

            }
            else
            {
                Response.Write("<script>alert('Usuario Incorrecto')</script>");
            }

        }
         
       
    } 
}