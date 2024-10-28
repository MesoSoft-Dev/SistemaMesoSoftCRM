// CapaLogicaNegocio/AuthService.cs

using System;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json;



public class AuthService
{
    private readonly string apiEndpoint = "http://186.1.2.198/apirest/lgf/lgf.aspx"; 


    public async Task<(bool isSuccess, string message, dynamic data)> LoginAsync(string username, string password)
    {
        using (var client = new HttpClient())
        {
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            
            var op = 1; 
            var r = ConfigurationManager.AppSettings["ApiKey"]; 

            var url = $"{apiEndpoint}?op={op}&usuario={username}&contrasena={password}&r={r}";

            var response = await client.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                Console.WriteLine("json"+jsonResponse);
                var responseData = JsonSerializer.Deserialize<JsonElement>(jsonResponse);
                Console.WriteLine("response"+responseData);

                // Verificar si contiene JResponse
                if (responseData.TryGetProperty("JResponse", out JsonElement jResponse))
                {
                    var firstResponse = jResponse[0];
                    // Comprobar el estado de éxito
                    if (firstResponse.TryGetProperty("Success", out JsonElement success) && success.GetString() == "0")
                    {
                        // Retornar mensaje de error
                        var message = firstResponse.GetProperty("Message").GetString();
                        return (false, message, null);
                    }
                }

                // Si no es JResponse, asumir que es un login exitoso
                try
                {
                    var userData = JsonSerializer.Deserialize<UserData>(jsonResponse);
                    return (true, null, userData);
                }
                catch (JsonException ex)
                {
                    return (false, "Error al procesar los datos del usuario: " + ex.Message, null);
                }
            }
            else
            {
                return (false, "Error en la comunicación con el API.", null);
            }
        }
    }

    // Clase para los datos del usuario
    public class UserData
    {
        public string id_usuario { get; set; }
        public string id_grupo { get; set; }
        public string nombre_usuario { get; set; }
        public string EsAdmin { get; set; }
        public string idEmpresa { get; set; }
        public string Empresa { get; set; }
        public string idSucursal { get; set; }
        public string Sucursal { get; set; }
        public string idGerencia { get; set; }
        public string Gerencia { get; set; }
        public string idArea { get; set; }
        public string Area { get; set; }
    }
}