using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using MSDLLS;
using CapaModelo;
using static System.Collections.Specialized.BitVector32;

namespace CapaAccesoDatos
{
    public class ConsultaDatos
    {
        //Lee la cadena de conexion del webconfig ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

        private string SqlConnectionString = ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
        SqlCommand sqlcmd;
        SqlDataReader sqldr;

        public int ValidaExistenciaEmpresa(string nombreEmpresa)
        {
            try
            {
                Object existeEmpresa = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Empresa", "e_tblEmpresas", "Empresa='" + nombreEmpresa + "'"), "Null");
                if (existeEmpresa == null) { return 0; }
                else
                {
                    Object activaEmpresa = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Activa", "e_tblEmpresas", "Empresa='" + nombreEmpresa + "'"), "Null");
                    if (activaEmpresa == null) { return 2; }
                }
            }
            catch (Exception ex)
            {
                return 3;
            }

            return 1; // PASA TODAS LAS VALIDACIONES ES DECIR, ESTÁ ACTIVA Y EXISTE LA EMPRESA
        }

        public int ValidaExistenciaUsuario(string nombreUsuario)
        {
            try
            {
                Object existeUsuario = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Usuario", "e_tblUsuarios", "Usuario='" + nombreUsuario + "'"), "Null");
                if (existeUsuario == null) { return 4; }
                else
                {
                    Object activaUsuario = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Activo", "e_tblUsuarios", "Usuario='" + nombreUsuario + "'"), "Null");
                    if (activaUsuario == null) { return 5; }
                }
            }
            catch (Exception e)
            {
                return 7;
            }

            return 6;
        }

        public UserSessionModel LoginUser(string username, string password, string company)
        {
            UserSessionModel model = new UserSessionModel();
            string user = "";
            SqlConnection sqlConnLocal = null;
            string hashstoredpass = "";
            try
            {
                string connectionStrings = (string)Varios.Nz(Varios.Dlookup(SqlConnectionString, "ConnectionStrings", "e_tblEmpresas", "Empresa='" + company + "'"), "");
                sqlConnLocal = new SqlConnection(connectionStrings);
                sqlConnLocal.Open();
                sqlcmd = new SqlCommand("SELECT * FROM seg_tblUsuarios WHERE nombre_usuario = @nombre_usuario", sqlConnLocal);
                sqlcmd.Parameters.AddWithValue("@nombre_usuario", username);
                sqldr = sqlcmd.ExecuteReader();

                if (!sqldr.Read())
                {
                    sqldr.Close();
                    sqlConnLocal.Close();
                    return null;
                }

                string hashgivenpass = Seguridad.clave_cifrada(password);
                if (sqldr.Read()) 
                { 
                    hashstoredpass = sqldr["clave_usuario"].ToString();
                    user = sqldr["nombre_usuario"].ToString();
                    model.IdUsuario = sqldr["id_usuario"].ToString();
                    model.IdGrupo = sqldr["id_grupo"].ToString();
                    model.NombreUsuario = user;
                    model.ClaveUsuario = hashstoredpass;
                    model.Administrador = sqldr["administrador"].ToString();
                    model.IdEmpresa = sqldr["idEmpresa"].ToString();
                    model.IdSucursal = sqldr["idSucursal"].ToString();
                    model.IdGerencia = sqldr["idGerencia"].ToString();
                    model.IdArea = sqldr["idArea"].ToString();
                    model.CambiarContrasena = Convert.ToBoolean(sqldr["cambiar_contrasena"]);
                    model.FechaUltCamCon = Convert.ToDateTime(sqldr["FechaUltCamCon"]);

                }
                if (!hashgivenpass.Equals(hashstoredpass))
                {
                    sqldr.Close();
                    sqlConnLocal.Close();
                    return null;
                }
                //SON IGUALES, SE CREA SESSION Y EL HISTORIAL DE ACCESOS
                //CreateSession(company);
                sqldr.Close();
                RegisterAccessHistoy(user);
                sqlConnLocal.Close();
                return model;
            }
            catch (Exception ex)
            {
                LogError(ex);
                sqldr.Close();
                sqlConnLocal.Close();
                return null;
            }

        }

        public UserSessionModel CreateDataSession(UserSessionModel userData)
        {
            string connectionString = userData.ConnectionStrings;

            if (connectionString == null) { return null; }

            try
            {
                userData.Servidor = (string)Varios.Nz(Varios.Dlookup(connectionString, "SCServidor", "par_tblParametros"), "");
                userData.Correo = (string)Varios.Nz(Varios.Dlookup(connectionString, "SCCorreoEnvia", "par_tblParametros"), "");
                userData.MasInfo = (string)Varios.Nz(Varios.Dlookup(connectionString, "SCMasInfo", "par_tblParametros"), "");
                userData.Activo = (string)Varios.Nz(Varios.Dlookup(connectionString, "scActivo", "par_tblParametros"), "");
                userData.DiasRenovar = (int)Varios.Nz(Varios.Dlookup(connectionString, "CntDiasRenovarContraseña", "par_tblParametros"), 0);
            }
            catch (Exception ex)
            {
                LogError(ex);
                return null;
            }


            return userData;
        }
        
        private void RegisterAccessHistoy(string user)
        {
           /* try
            {
                // Lee la cadena de conexión de la empresa
                string connectionStrings = Varios.Nz(Varios.Dlookup(SqlConnectionString, "ConnectionStrings", "e_tblEmpresas", "Empresa='" + txtEmpresa.Text + "'"), "");

                // Crea una nueva variable de conexión
                using (SqlConnection sqlConnLocal = new SqlConnection(connectionStrings))
                {
                    // Abre la conexión
                    sqlConnLocal.Open();

                    // Registra en el historial de acceso
                    string nombreModulo = (string) Varios.Dlookup(connectionStrings, "nombre_modulo", "seg_tblmodulos", "id_modulo=" + 1);
                    string myQuery = "INSERT INTO seg_tblhistorialacceso(usuario, modulo, nombre_ordenador, fecha_hora_entrada, id_conexion) " +
                                     "VALUES(@usuario, @modulo, @nombreOrdenador, GETDATE(), @idConexion)";

                    using (SqlCommand sqlCmd = new SqlCommand(myQuery, sqlConnLocal))
                    {
                        sqlCmd.Parameters.AddWithValue("@usuario", user);
                        sqlCmd.Parameters.AddWithValue("@modulo", nombreModulo);
                        sqlCmd.Parameters.AddWithValue("@nombreOrdenador", Environment.MachineName);
                        sqlCmd.Parameters.AddWithValue("@idConexion", 1);

                        sqlCmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                LogError(ex); 
                return; 
            }*/

        }

        // CAMBIO DE CONTRASEÑAS

        public string oldEqualsNewPassword(string newPassword, string oldPassword)
        {
            string response = "A";
            string oldPasswordAux = Seguridad.descifrar_clave(oldPassword);
            try
            {
                if (oldPasswordAux == newPassword)
                {
                    response = "Nueva Contraseña debe ser diferente a la Anterior";
                }
               // Seguridad.IgualAContraseñasAnteriores(ConnectionStrings, Seguridad.clave_cifrada(Me.txtNC.Text), Session("id_usuario")) = True Then


            }
            catch (Exception ex)
            {
                LogError(ex);
                return "false";
            }
            return "true";
        }
        private void LogError(Exception ex)
        {
            string filePath = "error_log.txt";

            // Verifica si el archivo existe
            if (!System.IO.File.Exists(filePath))
            {
                // Crea el archivo y escribe la cabecera
                using (var stream = System.IO.File.Create(filePath))
                {
                    // Puedes agregar un encabezado o una línea inicial si deseas
                    byte[] info = new UTF8Encoding(true).GetBytes("Registro de Errores:\n");
                    stream.Write(info, 0, info.Length);
                }
            }

            // Registra el error en el archivo
            using (var writer = System.IO.File.AppendText(filePath))
            {
                writer.WriteLine($"{DateTime.Now}: {ex.Message}");
                writer.WriteLine(ex.StackTrace);
                writer.WriteLine(); // Línea en blanco para separar errores
            }
        }


    }
}
