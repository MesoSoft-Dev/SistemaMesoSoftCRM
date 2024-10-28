using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaModelo
{
    public class UserSessionModel
    {
        public string ConnectionStrings { get; set; }
        public string IdUsuario { get; set; }
        public string IdGrupo { get; set; }
        public string NombreUsuario { get; set; }
        public string ClaveUsuario { get; set; }
        public string Administrador { get; set; }
        public string IdEmpresa { get; set; }
        public string IdSucursal { get; set; }
        public string IdGerencia { get; set; }
        public string IdArea { get; set; }
        public bool CambiarContrasena { get; set; }
        public DateTime FechaUltCamCon { get; set; }
        public string Servidor { get; set; }
        public string Correo {  get; set; } 
        public string MasInfo { get; set; }
        public string Activo { get; set; }

        public int DiasRenovar { get; set; }

    }
}
