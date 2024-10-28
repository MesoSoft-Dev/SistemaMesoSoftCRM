using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaAccesoDatos;
using CapaModelo;

namespace CapaLogicaNegocio
{
    public class LoginLN
    {
        private ConsultaDatos consultaDatos = new ConsultaDatos();

        public string ValidateLogin(string user, string password, string company)
        {
            var validations = new Dictionary<string, Func<int>>
            {
                { "Empresa", () => ValidaCampoEmpresa(company) },
                { "Usuario", () => ValidaCampoUsuario(user) }
            };

            foreach (var validation in validations)
            {
                int result = validation.Value();
                if (result != 1) // 1 significa que está todo bien
                {
                    return $"La {validation.Key} ingresada -{GetErrorMessage(validation.Key, result)}- ";
                }
            }

            return "A"; // Todo está bien
        }

        private string GetErrorMessage(string type, int result)
        {
            if (type == "Empresa")
            {
                switch (result)
                {
                    case 0:
                        return "No Existe";
                    case 2:
                        return "No Está Activa";
                    case 3:
                        return "error al Validar Empresa";
                    default:
                        return "error desconocido";
                }
            }
            else // Usuario
            {
                switch (result)
                {
                    case 4:
                        return "No Existe";
                    case 5:
                        return "No Está Activo";
                    case 7:
                        return "error al Validar Usuario";
                    default:
                        return "error desconocido";
                }
            }
        }



        /*
        public UserSessionModel LoginUser(string user, string password, string company)
        {
            UserSessionModel userData = consultaDatos.LoginUser(user, password, company);

            if (userData != null)
            {
                userData = consultaDatos.CreateDataSession(userData);
            }
            
            return userData;
        }
        */
        public bool ShouldChangePassword(UserSessionModel userData)
        {
            if (!userData.CambiarContrasena)
            {
                int diasTranscurridos = (DateTime.Now.Date - userData.FechaUltCamCon).Days;
                int diasParaRenovar = userData.DiasRenovar;
                return diasTranscurridos >= diasParaRenovar;
            }
            return false;
        }

        private int ValidaCampoEmpresa(String nombreEmpresa)
        {
            int resultadoConsulta = consultaDatos.ValidaExistenciaEmpresa(nombreEmpresa);
            return resultadoConsulta;

        }

        private int ValidaCampoUsuario(String nombreUsuario)
        {
            int resultadoConsulta = consultaDatos.ValidaExistenciaUsuario(nombreUsuario);
            return resultadoConsulta; 
        }

        // CAMBIAR CONTRASEÑAS
        /*
        public bool ValidatePassword(string newPassword, object oldPassword)
        {
            bool resPasswordValidation = consultaDatos.oldEqualsNewPassword(newPassword, oldPassword);
        }

        */
    }
}
