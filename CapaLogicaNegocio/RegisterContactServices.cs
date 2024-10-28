using System;
using System.Configuration;
using System.Net.Http;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using CapaModelo;

namespace CapaLogicaNegocio
{
    public class RegisterContactServices
    {
        private readonly string apiEndpoint = "http://186.1.2.198/apirest/lgf/lgf.aspx";

        public async Task<(bool isSuccess, string message, dynamic data)> RegisterContact(ContactModel contacto)
        {
            using (var client = new HttpClient())
            {
                try
                {
                    var op = 7;
                    var apiKey = ConfigurationManager.AppSettings["ApiKey"];

                    var url = $"{apiEndpoint}?op={op}" +
                      $"&no={Uri.EscapeDataString(contacto.Nombres)}" +
                      $"&ap={Uri.EscapeDataString(contacto.Apellidos)}" +
                      $"&co={Uri.EscapeDataString(contacto.Correo)}" +
                      $"&te={Uri.EscapeDataString(contacto.Telefono)}" +
                      $"&fe={Uri.EscapeDataString(contacto.FechaNacimiento)}" +
                      $"&oc={Uri.EscapeDataString(contacto.OrigenContacto)}" +
                      $"&tc={Uri.EscapeDataString(contacto.TipoContacto)}" +
                      $"&opa=&ep=&ce=&cet=&pp=&sx={Uri.EscapeDataString(contacto.Sexo)}" +
                      $"&cpe={Uri.EscapeDataString(contacto.ComEmail)}" +
                      $"&cpw={Uri.EscapeDataString(contacto.ComWhatsapp)}" +
                      $"&r={apiKey}";


                    // Enviar la solicitud POST
                    var response = await client.PostAsync(url, null);

                    if (response.IsSuccessStatusCode)
                    {
                        var jsonResponse = await response.Content.ReadAsStringAsync();
                        var responseData = JsonSerializer.Deserialize<JsonElement>(jsonResponse);

                        // Verificar si contiene JResponse
                        if (responseData.TryGetProperty("JResponse", out JsonElement jResponse) && jResponse.ValueKind == JsonValueKind.Array)
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
                        return (true, "Registro ingresado correctamente.", null);
                    }
                    else
                    {
                        return (false, "Error en la comunicación con el API: " + response.ReasonPhrase, null);
                    }
                }
                catch (HttpRequestException ex)
                {
                    return (false, "Error en la conexión con el API: " + ex.Message, null);
                }
                catch (JsonException ex)
                {
                    return (false, "Error al procesar la respuesta del API: " + ex.Message, null);
                }
                catch (Exception ex)
                {
                    return (false, "Ocurrió un error inesperado: " + ex.Message, null);
                }
            }
        }

        private StringContent BuildContent(ContactModel contacto)
        {
            var content = new StringContent(
                $"no={(contacto.Nombres)}" +
                $"&ap={(contacto.Apellidos)}" +
                $"&co={(contacto.Correo)}" +
                $"&te={(contacto.Telefono)}" +
                $"&fe={(contacto.FechaNacimiento)}" +
                $"&oc={(contacto.OrigenContacto)}" +
                $"&tc={(contacto.TipoContacto)}" +
                $"&sx={(contacto.Sexo)}" +
                $"&cpe={(contacto.ComEmail)}" +
                $"&opa = &ep = &ce = &cet = &pp = " +
                $"&cpw={(contacto.ComWhatsapp)}"
            );

            return content;
        }
    }
}
