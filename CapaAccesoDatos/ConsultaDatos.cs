using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MSDLLS;

namespace CapaAccesoDatos
{
    public class ConsultaDatos
    {
         //Lee la cadena de conexion del webconfig ConfigurationManager.ConnectionStrings["MiConexion"].ConnectionString;

         private string SqlConnectionString = ConfigurationManager.ConnectionStrings["SqlConnectionString"].ConnectionString;
         public int ValidaExistenciaEmpresa(string nombreEmpresa) 
         {
             Object existeEmpresa = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Empresa", "e_tblEmpresas", "Empresa='" + nombreEmpresa +"'"), "Null");
             if (existeEmpresa == null) { return 0; }
             else
             {
                 Object activaEmpresa = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Activa", "e_tblEmpresas", "Empresa='" + nombreEmpresa + "'"), "Null");
                 if (activaEmpresa == null) { return 2; }
             }

             return 1; // PASA TODAS LAS VALIDACIONES ES DECIR, ESTÁ ACTIVA Y EXISTE LA EMPRESA
         }

         public int ValidaExistenciaUsuario(string nombreUsuario)
         {
            Object existeUsuario = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Usuario", "e_tblUsuarios", "Usuario='" + nombreUsuario + "'"), "Null");
             if (existeUsuario == null) { return 0; }
             else
             {
                 Object activaUsuario = Varios.Nz(Varios.Dlookup(SqlConnectionString, "Activo", "e_tblUsuarios", "Usuario='" + nombreUsuario + "'"), "Null");
                 if (activaUsuario == null) { return 2; }
             }

             return 1; 
         }
         

    }
}
