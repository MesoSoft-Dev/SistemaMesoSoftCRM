<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="CapaPresentacion.contactos"  ClientIDMode="Static" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
         <div class="mx-4 mb-5 d-flex justify-content-end">
              <button id="btnAgregarC" class="btn fondo4 rounded-5 fw-bold" data-bs-toggle="modal" data-bs-target="#oportunidad_form" type="button">
                + Agregar Contacto
              </button>
        </div>

        <div class="modal fade" id="oportunidad_form" tabindex="-1" aria-labelledby="oportunidadModalLabel" aria-hidden="true">
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
    
 
    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="100px" Text="Registrar" OnClick="btnRegistrar_Click" />
    
</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</form>



</asp:Content>
