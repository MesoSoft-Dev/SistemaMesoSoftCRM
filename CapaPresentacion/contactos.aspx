<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="CapaPresentacion.contactos"  ClientIDMode="Static" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Assets/css/Cstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
         <div class="mx-4 mb-5 d-flex justify-content-end">
              <button id="btnAgregarC" class="btn fondo4 rounded-5 fw-bold" data-bs-toggle="modal" data-bs-target="#crearContactoform" type="button">
                + Agregar Contacto
              </button>
        </div>
        <div id="contenidoContactos" class="shadow p-3">

        <div class="Contacto d-flex justify-content-between align-items-center pb-1 pt-2 px-5 w-100 border-bottom">
        <h6 class="col-2">Nombres</h6>
        <h6 class="col-2">Teléfono/Celular</h6>
        <h6 class="col-3">Correo Electrónico</h6>
        <h6 class="col-2">Fecha de Creación</h6>
        <h6 class="col-2">Última Actividad</h6>
    </div>
    <div class="borderC my-2"></div>

    <!-- Datos -->
    <div class="Contacto w-100 d-flex align-items-center pb-2 pt-1 ps-2 pe-5 mb-3">
    
    <div class="dropdown">
        <button class="btn m-0 p-0" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-three-dots-vertical"></i>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <li><a class="dropdown-item" href="#">Editar</a></li>
            <li><a class="dropdown-item" href="#">Eliminar</a></li>
        </ul>
    </div>

    <!-- Contenido alineado -->
    <div class="d-flex flex-grow-1 justify-content-between align-items-center ps-3">
        <p class="col-2 mb-0">Joshua Vilchez</p>
        <p class="col-2 mb-0">+5939917191611</p>
        <p class="col-3 mb-0">correotestaaa@gmail.com</p>
        <p class="col-2 mb-0">18-11-2024</p>
        <p class="col-2 mb-0">18-11-2024</p>
    </div>
</div>

                <div class="Contacto w-100 d-flex align-items-center pb-2 pt-1 ps-2 pe-5 mb-3">
    
    <div class="dropdown">
        <button class="btn m-0 p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-three-dots-vertical"></i>
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#EditarContactoform">Editar</a></li>
    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#ModalAdvertencia">Eliminar</a></li>
        </ul>
    </div>

   
    <div class="d-flex flex-grow-1 justify-content-between align-items-center ps-3">
        <p class="col-2 mb-0">Enrique Solis</p>
        <p class="col-2 mb-0">+5939917</p>
        <p class="col-3 mb-0">correotestaa2222222a@gmail.com</p>
        <p class="col-2 mb-0">18-11-2024</p>
        <p class="col-2 mb-0">18-11-2024</p>
    </div>
</div>
        
</div>  

<!-- Modal de crear -->
        <div class="modal fade" id="crearContactoform" tabindex="-1" aria-labelledby="ContactoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="fw-bold">Crear Nuevo Contacto</h5>
            </div>
            <div class="modal-body">
                <div class="container mt-1">
                    <!-- Detalles de Contacto -->
                    <div class="border-custom3 col-md-10">
                        <h2 class="fw-bold">Datos Personales</h2>
                        <div class="row d-flex align-items-start flex-column flex-sm-row">
     <div class="col my-3">
       <label>Nombres</label>
       <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Nombre"></asp:TextBox>
     </div>
     <div class="col my-3">
       <label>Apellidos</label>
       <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Apellido"></asp:TextBox>
    </div>
 </div>
                        <div class="row d-flex align-items-start flex-column flex-sm-row">
   <div class="col my-3">
      <label>Correo</label>
      <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Email"></asp:TextBox>
   </div>
   <div class="col my-3">
      <label>Teléfono</label>
      <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Teléfono"></asp:TextBox>
   </div>
</div>
                    </div>
                     <div class="row d-flex align-items-start flex-column flex-sm-row">
    <div class="col my-3">
        <label>Fecha de Nacimiento</label>
        <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control w-75" placeholder="Ingrese su Fecha de Nacimiento"></asp:TextBox>
    </div>

    <div class="col my-3">
        <label>Sexo</label>
        <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control w-75">
        <asp:ListItem Text="Seleccione una opcion" Value=""/>    
        <asp:ListItem>Masculino</asp:ListItem>
        <asp:ListItem>Femenino</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="firstValidator" runat="server" ControlToValidate="ddlSexo" InitialValue="" ErrorMessage="Por favor seleccione una opcion valida." ForeColor="Red" />

    </div>
</div>
                    <!-- Informacion adicional del contacto -->
                    <div class="border-custom col-md-10">
                        <h2 class="border-bottom fw-bold pb-1 mt-4 mb-3">Informacion Adicional</h2>
                             <div class="row d-flex align-items-start flex-column flex-sm-row">
     <div class="col my-3">
       <label>Comunicacion por Email</label>
       <asp:DropDownList ID="ddlComEmail" runat="server" CssClass="form-control w-75">
       <asp:ListItem Text="Seleccione una opcion" Value=""/>  
       <asp:ListItem>Si</asp:ListItem>
       <asp:ListItem>No</asp:ListItem>
       </asp:DropDownList>
       <asp:RequiredFieldValidator ID="thirdValidator" runat="server" ControlToValidate="ddlComEmail" InitialValue="" ErrorMessage="Por favor seleccione una opcion valida." ForeColor="Red" />
      </div>

     <div class="col my-3">
       <label>Comunicacion por Whatsapp</label>
       <asp:DropDownList ID="dllComWhatsapp" runat="server" CssClass="form-control w-75">
       <asp:ListItem Text="Seleccione una opcion" Value=""/>  
       <asp:ListItem>Si</asp:ListItem>
       <asp:ListItem>No</asp:ListItem>
       </asp:DropDownList>
       <asp:RequiredFieldValidator ID="fourthValidator" runat="server" ControlToValidate="dllComWhatsapp" InitialValue="" ErrorMessage="Por favor seleccione una opcion valida." ForeColor="Red" />
      </div>
</div>
                          <div class="row d-flex align-items-start flex-column flex-sm-row">
     <div class="col my-3">
       <label>Tipo Contacto</label>
       <asp:DropDownList ID="ddlTipoContacto" runat="server" CssClass="form-control w-75">
       <asp:ListItem Text="Seleccione una opcion" Value=""/>  
       <asp:ListItem>Interesado</asp:ListItem>
       <asp:ListItem>Cliente</asp:ListItem>
       </asp:DropDownList>
       <asp:RequiredFieldValidator ID="secondValidator" runat="server" ControlToValidate="ddlTipoContacto" InitialValue="" ErrorMessage="Por favor seleccione una opcion valida." ForeColor="Red" />
      </div>
     <div class="col my-3">
       <label>Origen de contacto</label>
       <asp:TextBox ID="txtOrigen" runat="server" CssClass="form-control w-75" placeholder="Ingrese el origen de contacto"></asp:TextBox>
     </div>
</div>
                       
            </div>
                    <div class="d-flex justify-content-end">
                        <div class="d-flex">
                            <button type="button" class="btn btn-light me-2 fw-bold border-custom2 flex-fill" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                        <div class=" d-flex container">
    
 
<asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="100px" Text="Registrar"  OnClientClick="crearContacto(); return false;" />    
</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 <!-- Modal de crear, FINAL -->
<!-- Modal de advertencia -->   
<div class="modal fade" id="ModalAdvertencia" tabindex="-1" aria-labelledby="ModalAdvertenciaLabel" aria-hidden="true">
<div class="modal-dialog modal-sm" role="document">        
    <div class="modal-content">
        <div class="modal-body">
               
                   
     <div class="ventanaConfirmar-header border-0">
         <h4 class="ventanaConfirmar-title fw-bold w-100" id="ventanaConfirmarLabel">¡IMPORTANTE!</h4>
     </div>
     <div class="ventanaConfirmar-body px-3 py-1">
         <p>Seguro que desea eliminar el registro</p>
     </div>
     <div class="ventanaConfirmar-footer pb-1 d-flex justify-content-center">
         <button type="button" id="confirmarEliminarBtn" class="btn btn-ventana"  data-bs-dismiss="modal">Eliminar</button>
         <button type="button" class="btn btn-ventana" data-bs-dismiss="modal">cancelar</button>
     </div>
 </div>
                   
               
        </div>
    </div>
</div>
<!-- Modal de advertencia,FINAL -->  

<!-- Modal de editar -->  
        <div class="modal fade" id="EditarContactoform" tabindex="-1" aria-labelledby="EditarContactoformLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="fw-bold">Editar Contacto</h5>
            </div>
            <div class="modal-body">
                <div class="container mt-1">
    <!-- Detalles de Contacto -->
    <div class="border-custom3 col-md-10">
        <h2 class="fw-bold">Datos Personales</h2>
        <div class="row d-flex align-items-start flex-column flex-sm-row">
            <div class="col my-3">
                <label>Nombres</label>
                <asp:TextBox ID="txtEditarNombres" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Nombre"></asp:TextBox>
            </div>
            <div class="col my-3">
                <label>Apellidos</label>
                <asp:TextBox ID="txtEditarApellidos" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Apellido"></asp:TextBox>
            </div>
        </div>
        <div class="row d-flex align-items-start flex-column flex-sm-row">
            <div class="col my-3">
                <label>Correo</label>
                <asp:TextBox ID="txtEditarCorreo" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Email"></asp:TextBox>
            </div>
            <div class="col my-3">
                <label>Teléfono</label>
                <asp:TextBox ID="txtEditarTelefono" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Teléfono"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row d-flex align-items-start flex-column flex-sm-row">
        <div class="col my-3">
            <label>Fecha de Nacimiento</label>
            <asp:TextBox ID="txtEditarFechaNacimiento" runat="server" CssClass="form-control w-75" placeholder="Ingrese su Fecha de Nacimiento"></asp:TextBox>
        </div>

        <div class="col my-3">
            <label>Sexo</label>
            <asp:DropDownList ID="EditarSexo" runat="server" CssClass="form-control w-75">
                <asp:ListItem Text="Seleccione una opcion" Value=""/>    
                <asp:ListItem>Masculino</asp:ListItem>
                <asp:ListItem>Femenino</asp:ListItem>
            </asp:DropDownList>
            </div>
    </div>

    <!-- Informacion adicional del contacto -->
    <div class="border-custom col-md-10">
        <h2 class="border-bottom fw-bold pb-1 mt-4 mb-3">Informacion Adicional</h2>
        <div class="row d-flex align-items-start flex-column flex-sm-row">
            <div class="col my-3">
                <label>Comunicacion por Email</label>
                <asp:DropDownList ID="EditarComEmail" runat="server" CssClass="form-control w-75">
                    <asp:ListItem Text="Seleccione una opcion" Value=""/>  
                    <asp:ListItem>Si</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
           </div>

            <div class="col my-3">
                <label>Comunicacion por Whatsapp</label>
                <asp:DropDownList ID="EditarComWhatsapp" runat="server" CssClass="form-control w-75">
                    <asp:ListItem Text="Seleccione una opcion" Value=""/>  
                    <asp:ListItem>Si</asp:ListItem>
                    <asp:ListItem>No</asp:ListItem>
                </asp:DropDownList>
         </div>
        </div>
        <div class="row d-flex align-items-start flex-column flex-sm-row">
            <div class="col my-3">
                <label>Tipo Contacto</label>
                <asp:DropDownList ID="EditarTipoContacto" runat="server" CssClass="form-control w-75">
                    <asp:ListItem Text="Seleccione una opcion" Value=""/>  
                    <asp:ListItem>Interesado</asp:ListItem>
                    <asp:ListItem>Cliente</asp:ListItem>
                </asp:DropDownList>
          </div>
            <div class="col my-3">
                <label>Origen de contacto</label>
                <asp:TextBox ID="txtEditarOrigen" runat="server" CssClass="form-control w-75" placeholder="Ingrese el origen de contacto"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-end">
        <div class="d-flex">
            <button type="button" class="btn btn-light me-2 fw-bold border-custom2 flex-fill" data-bs-dismiss="modal">Cancelar</button>
        </div>
        <div class="d-flex container">
            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-primary" Width="100px" Text="Editar" />
        </div>
    </div>
</div>

        </div>
    </div>
</div>
</div>





</form>
 <script src="Assets/js/ContactosScript.js" type="text/javascript"></script>


</asp:Content>
