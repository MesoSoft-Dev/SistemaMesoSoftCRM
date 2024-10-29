using CapaModelo;
using CapaLogicaNegocio;
using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;

namespace CapaPresentacion
{
    public partial class contactos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected async void btnRegistrar_Click(object sender, EventArgs e)
        {
            // Validar campos antes de crear el objeto
            if (string.IsNullOrWhiteSpace(txtNombres.Text) || string.IsNullOrWhiteSpace(txtApellidos.Text) ||
                string.IsNullOrWhiteSpace(txtCorreo.Text) || string.IsNullOrWhiteSpace(txtTelefono.Text) ||
                string.IsNullOrWhiteSpace(txtFechaNacimiento.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "alert('Por favor complete todos los campos obligatorios.');", true);
                return;
            }

            // Recuperar los valores de los campos
            string nombres = txtNombres.Text;
            string apellidos = txtApellidos.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            string fechaNacimiento = txtFechaNacimiento.Text;
            string sexo = ddlSexo.SelectedValue == "Masculino" ? "1" : "2";
            string comEmail = ddlComEmail.SelectedValue == "Si" ? "1" : "2";
            string comWhatsapp = dllComWhatsapp.SelectedValue == "Si" ? "1" : "2";
            string tipoContacto = ddlTipoContacto.SelectedValue == "Interesado" ? "1" : "2";
            string origenContacto = txtOrigen.Text;

            // Crear un objeto que contenga la información
            var contact = new ContactModel
            {
                Nombres = nombres,
                Apellidos = apellidos,
                Correo = correo,
                Telefono = telefono,
                FechaNacimiento = fechaNacimiento,
                Sexo = sexo,
                ComEmail = comEmail,
                ComWhatsapp = comWhatsapp,
                TipoContacto = tipoContacto,
                OrigenContacto = origenContacto
            };

            // Llamar a la capa de lógica de negocio
            var registerContact = new RegisterContactServices();
            var result = await registerContact.RegisterContact(contact);

            ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"alert('{result.message}');", true);
        }
    }
}