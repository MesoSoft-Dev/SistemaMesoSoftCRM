using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace CapaLogicaNegocio
{
    public class ChangePasswordServices
    {
        private readonly string apiEndpoint = "http://186.1.2.198/apirest/lgf/lgf.aspx";

        public async Task<(bool isSuccess, string message, dynamic data)> ChangePasswordAsync(string username, string previusPass, string newPass, string confirmPass)
        {
            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var op = 3;
                var r = ConfigurationManager.AppSettings["ApiKey"];

                var url = $"{apiEndpoint}?op={op}&usuario={username}&contrasenaAnt={previusPass}&contrasenaNew={newPass}&contrasenaCon={confirmPass}&r={r}";

                try
                {
                    var response = await client.GetAsync(url);

                    if (!response.IsSuccessStatusCode)
                    {
                        return (false, "Error en la comunicación con el API.", null);
                    }


                    var jsonResponse = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("json" + jsonResponse);
                    var responseData = JsonSerializer.Deserialize<JsonElement>(jsonResponse);
                    Console.WriteLine("response" + responseData);



                    // Verificar si contiene JResponse
                    if (!responseData.TryGetProperty("JResponse", out JsonElement jResponse))
                    {
                        return (false, "Error al procesar los datos del usuario ", null);

                    }

                    var firstResponse = jResponse[0];
                    // Comprobar el estado de éxito
                    if (firstResponse.TryGetProperty("Success", out JsonElement success) && success.GetString() == "1")
                    {
                        // Retornar mensaje
                        var message = firstResponse.GetProperty("Message").GetString();
                        return (true, message, null);
                    }
                    else
                    {
                        var message = firstResponse.GetProperty("Message").GetString();
                        return (false, message, null);
                    }


                }
                catch (Exception e)
                {
                    return (false, "Error al ejecutar proceso, comúniquese con el Administrador: " + e.Message, null);
                }

            }
            // Añadir un retorno por defecto al final del método
            return (false, "Se produjo un error inesperado.", null);
        }
    }
}
