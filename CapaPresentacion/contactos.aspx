<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="CapaPresentacion.contactos"  ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Aquí va el contenido específico de esta página -->
    <h2 class="border-bottom pb-1 mb-3">Datos Personales</h2>

<div class="container">
   <div class="row my-3">
       <div class="col">
         <label>Nombres</label>
         <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Nombre"></asp:TextBox>
       </div>
       <div class="col">
         <label>Apellidos</label>
         <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Apellido"></asp:TextBox>
      </div>
   </div>

  <div class="row my-3">
     <div class="col">
        <label>Correo</label>
        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Email"></asp:TextBox>
     </div>
     <div class="col">
        <label>Teléfono</label>
        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Teléfono"></asp:TextBox>
     </div>
  </div>

  <div class="row my-3">
      <div class="col">
          <label>Fecha de Nacimiento</label>
          <asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Fecha de Nacimiento"></asp:TextBox>
      </div>

      <div class="col">
          <label>Sexo</label>
          <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control w-75 my-auto">
          
          <asp:ListItem>Masculino</asp:ListItem>
          <asp:ListItem>Femenino</asp:ListItem>
          </asp:DropDownList>
      </div>
  </div>
</div>

<h2 class="border-bottom pb-1 mt-5 mb-3">Informacion Adicional</h2>
<div class="container">
     <div class="row my-3">
      <div class="col">
        <label>Tipo Contacto</label>
        <asp:DropDownList ID="ddlTipoContacto" runat="server" CssClass="form-control w-75 my-auto" placeholder="Escoge una opcion">
        <asp:ListItem>Interesado</asp:ListItem>
        <asp:ListItem>Cliente</asp:ListItem>
        </asp:DropDownList>
       </div>
      <div class="col">
        <label>Origen de contacto</label>
        <asp:TextBox ID="txtOrigen" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese el origen de contacto"></asp:TextBox>
      </div>
 </div>
     <div class="row my-3">
     <div class="col">
       <label>Comunicacion por Email</label>
       <asp:DropDownList ID="ddlComEmail" runat="server" CssClass="form-control w-75" placeholder="Escoge una opcion">
       <asp:ListItem>Si</asp:ListItem>
       <asp:ListItem>No</asp:ListItem>
       </asp:DropDownList>
      </div>

     <div class="col">
       <label>Comunicacion por Whatsapp</label>
       <asp:DropDownList ID="dllComWhatsapp" runat="server" CssClass="form-control w-75" placeholder="Escoge una opcion">
       <asp:ListItem>Si</asp:ListItem>
       <asp:ListItem>No</asp:ListItem>
       </asp:DropDownList>
      </div>
</div>
</div>
  
                      






</asp:Content>
