using CapaModelo;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace CapaLogicaNegocio
{
    public class OportunitiesServices
    {
        private readonly string apiEndpoint = "http://186.1.2.198/apirest/lgf/lgf.aspx";
        public OportunitiesServices() { }

        public async Task<(bool isSuccess, string message, dynamic data)> AllData()
        {
            using (var client = new HttpClient())
            {
                try
                {
                    var op = 10;
                    var apiKey = ConfigurationManager.AppSettings["ApiKey"];
                    string criterio = "1=1";

                    var url = $"{apiEndpoint}?op={op}" +
                              $"&criterio={criterio}" +
                              $"&r={apiKey}";

                    var response = await client.GetAsync(url);

                    if (response.IsSuccessStatusCode)
                    {
                        // Lee la respuesta como un string
                        var jsonResponse = await response.Content.ReadAsStringAsync();

                        // Si la respuesta está vacía (ej. '[]'), considera que no hay datos
                        if (string.IsNullOrEmpty(jsonResponse) || jsonResponse == "[]")
                        {
                            return (true, "Consulta exitosa, pero no se encontraron registros.", new List<object>());
                        }

                        // Deserializa el JSON a un objeto dinámico
                        var responseData = JsonSerializer.Deserialize<dynamic>(jsonResponse);

                        // Retorna los datos deserializados
                        return (true, "Datos obtenidos correctamente.", responseData);
                    }
                    else
                    {
                        // Si la respuesta no es exitosa, devuelve el error
                        return (false, "Error al obtener los datos del API.", null);
                    }
                }
                catch (HttpRequestException ex)
                {
                    // Captura cualquier excepción relacionada con la conexión
                    return (false, "Error en la conexión con el API: " + ex.Message, null);
                }
            }
        }


        public async Task<(bool isSuccess, string message, dynamic data)> RegisterOportunities(ContactModel contacto, string encargado, 
                string fechaRegistro, string canal, string nombreNegocio, string valorOportunidad, string idContacto,
                string fase, string seguidores, string etiqueta, string estado)
        {
            using (var client = new HttpClient())
            {
                try
                {
                
                    var op = 8;
                    var apiKey = ConfigurationManager.AppSettings["ApiKey"];

                    var url = $"{apiEndpoint}?op={op}" +
                      $"&idc={Uri.EscapeDataString(idContacto)}" +
                      $"&npc={Uri.EscapeDataString(contacto.Nombres)}" +
                      $"&apc={Uri.EscapeDataString(contacto.Apellidos)}" +
                      $"&cpc={Uri.EscapeDataString(contacto.Correo)}" +
                      $"&tpc={Uri.EscapeDataString(contacto.Telefono)}" +
                      $"&coa={""}" + // contactos adicionales
                      $"&nop={nombreNegocio}" +
                      $"&ca={canal}" +
                      $"&fa={fase}" +
                      $"&es={estado}" +
                      $"&val={valorOportunidad}" +
                      $"&enc={encargado}" +
                      $"&seg={seguidores}" +
                      $"&non=" +
                      $"&eti={etiqueta}" +
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

    }
}
