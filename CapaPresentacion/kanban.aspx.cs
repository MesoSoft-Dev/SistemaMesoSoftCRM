using CapaLogicaNegocio;
using CapaModelo;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class kanban : System.Web.UI.Page
    {
        // Llamar a la capa de lógica de negocio
        OportunitiesServices registerContact = new OportunitiesServices();

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Llamar al método AllData() para obtener los datos del servidor
                var response = await registerContact.AllData();

                if (response.isSuccess)
                {
                    string jsonData = response.data.ToString();

                    // Aquí es donde les decía que se debe hacer la integración
                    // el objeto jsonData tiene todos los registros
                    // ustedes deben usarlo y obtener todos los datos que están en formato json y presentarlo 
                    // usando javascript
                    // y que funcione todo lo de presentar hasta cuando se de clic en cada oportunidad
                    // Inyectar el JSON y llamar a la función 'loadJsonData' en el archivo Kscript.js (probar o modificar)
                    string filePath = Server.MapPath("~/Assets/js/oportunidades.json");

                    // Escribir los datos JSON en el archivo
                    using (StreamWriter writer = new StreamWriter(filePath, false)) // 'false' sobrescribe el contenido
                    {
                        writer.Write(jsonData);
                    }

                    string script = $"cargarOportunidadesDesdeArchivo();";
                    ClientScript.RegisterStartupScript(this.GetType(), "cargarOportunidadesDesdeArchivo", script, true);


                }
                else
                {
                    // Manejar el error si no se pudo cargar el JSON
                     ClientScript.RegisterStartupScript(this.GetType(), "ErrorMessage",
                        $"alert('Error: {response.message}');", true);
                }
            }

        }

        protected async void createOportunidad(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNombres.Text) || string.IsNullOrWhiteSpace(txtApellidos.Text) ||
                string.IsNullOrWhiteSpace(txtCorreo.Text) || string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "alert('Por favor complete todos los campos de Detalles de contacto.');", true);
                return;
            }

            // Recuperar los valores de los campos
            string nombres = txtNombres.Text;
            string apellidos = txtApellidos.Text;
            string correo = txtCorreo.Text;
            string telefono = txtTelefono.Text;
            string sexo = ddlGenero.SelectedValue == "Masculino" ? "1" : "2";
            string tipoContacto = ddlContacto.SelectedValue == "Interesado" ? "1" : "2";
            string encargado = "1";// dllencargado.Text;
            string fechaRegistro = dllfechaRegistro.Text;
            string canal = ddlCanal.SelectedValue == "Llamada" ? "1" : "2";
            string nombreNegocio = txtNombreNegocio.Text;
            string valorOportunidad = txtValorOportunidad.Text;
            string fase = ddlFase.SelectedValue == "Interesado" ? "1" : "2";
            string seguidores = txtSeguidores.Text;
            string etiqueta = dllEtiqueta.Text;
            string estado = dllEstado.SelectedValue == "Abierto" ? "1" : "2";
            string idContacto = "";
            string buscarContacto = txtBuscarContacto.Text;
            // este se debe implementar el cajón de texto no está implementadoo
            //string buscar = existsCheckbox.Checked;


            // Crear un objeto que contenga la información
            var contact = new ContactModel
            {
                Nombres = nombres,
                Apellidos = apellidos,
                Correo = correo,
                Telefono = telefono,
                Sexo = sexo,
                TipoContacto = tipoContacto
            };
            
            var result = await registerContact.RegisterOportunities(contact, encargado, fechaRegistro, canal, nombreNegocio, valorOportunidad,idContacto, fase, seguidores, 
                etiqueta, estado);

            ScriptManager.RegisterStartupScript(this, GetType(), "showModal", $"alert('{result.message}');", true);
        }
        protected void btnEditarOportunidad_Click(object sender, EventArgs e)
        {
          /*  if (string.IsNullOrWhiteSpace(txtEditNombres.Text) || string.IsNullOrWhiteSpace(txtEditApellidos.Text) ||
                string.IsNullOrWhiteSpace(txtCorreoE.Text) || string.IsNullOrWhiteSpace(txtEditTelefono.Text) ||
                string.IsNullOrWhiteSpace(txtEditEncargado.Text) || string.IsNullOrWhiteSpace(txtEditFechaRegistro.Text) ||
                string.IsNullOrWhiteSpace(txtEditNombreNegocio.Text) || string.IsNullOrWhiteSpace(txtEditOportunidad.Text) ||
                string.IsNullOrWhiteSpace(txtEditSeguidores.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showModal", "alert('Por favor complete todos los campos obligatorios.');", true);
                return;
            }

            string nombres = txtEditNombres.Text;
            string apellidos = txtEditApellidos.Text;
            string genero = EditGenero.SelectedValue;
            string correoElectronico = txtCorreoE.Text;
            string telefono = txtEditTelefono.Text;
            string tipoContacto = EditTipoContacto.SelectedValue;
            string encargado = txtEditEncargado.Text;
            string fechaRegistro = txtEditFechaRegistro.Text;
            string canal = EditCanal.SelectedValue;
            string nombreNegocio = txtEditNombreNegocio.Text;
            string valorOportunidad = txtEditOportunidad.Text;
            string fase = EditFase.SelectedValue;
            string seguidores = txtEditSeguidores.Text;
            string etiqueta = EditEtiqueta.SelectedValue;
            string estado = EditEstado.SelectedValue; */
        }
    }
}