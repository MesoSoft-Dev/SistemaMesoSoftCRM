<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="CapaPresentacion.contactos"  ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Aquí va el contenido específico de esta página -->
    <h2 class="border-bottom pb-1 mb-3">Contactos</h2>

    <label>Nombres</label>
<asp:TextBox ID="txtNombres" runat="server" CssClass="form-control"></asp:TextBox>

<label>Apellidos</label>
<asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control"></asp:TextBox>

<label>Correo</label>
<asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control"></asp:TextBox>

<label>Teléfono</label>
<asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control"></asp:TextBox>

<label>Fecha de Nacimiento</label>
<asp:TextBox ID="txtFechaNacimiento" runat="server" CssClass="form-control"></asp:TextBox>


<label>Origien de contacto</label>
<asp:TextBox ID="txtOrigen" runat="server" CssClass="form-control"></asp:TextBox>

    <label>Sexo</label>
<asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
<asp:ListItem>Masculino</asp:ListItem>
<asp:ListItem>Femenino</asp:ListItem>
</asp:DropDownList>
                      
    <label>Tipo de comunicacion</label>
<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
<asp:ListItem>Email</asp:ListItem>
<asp:ListItem>Whatsapp</asp:ListItem>
</asp:DropDownList>
                      






</asp:Content>
