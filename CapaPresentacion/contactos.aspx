<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="CapaPresentacion.contactos"  ClientIDMode="Static" Async="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Aquí va el contenido específico de esta página -->
    <h2 class="border-bottom pb-1 mb-3">Datos Personales</h2>

<div class="container">
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
</div>

<h2 class="border-bottom pb-1 mt-4 mb-3">Informacion Adicional</h2>
<div class="container">
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
    <asp:Button ID="btnRegistrar" runat="server" CssClass="btn btn-primary" Width="100px" Text="Registrar" OnClick="btnRegistrar_Click" />
    
</div>
  
                      






</asp:Content>
