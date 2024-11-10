<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/css/Kstyles.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        
        <div class="container d-flex border-bottom border-dark my-4">
            <div><h5 class="fw-bold">Oportunidades</h5></div>
        </div>

        <div class="mx-4 mb-5 d-flex justify-content-end">

          
            <button id="btnAgregarp" class="btn fondo4 rounded-5 fw-bold" data-bs-toggle="modal" data-bs-target="#todo_form" type="button">
                + Agregar Oportunidad
            </button>
        </div>

        <!-- Modal de creacion de oportunidades -->
        <div class="modal fade" id="todo_form" tabindex="-1" aria-labelledby="todoModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                     <h5 class="fw-bold">Crear Nueva Oportunidad</h5>
                </div>
                <div class="modal-body">
                        <div class="container mt-1">
   
    <!-- Contact Details Section -->
    <div class="border-custom3 col-md-10">
        <h5 class="fw-bold">Detalles de Contacto</h5>
        <div class="row mb-3">
            <div class="col-md-7  ms-5">
                <asp:TextBox ID="txtBuscarContacto" runat="server" CssClass="form-control" Placeholder="Buscar Contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <div class="form-check mx-auto">
                    <asp:CheckBox ID="existsCheckbox" runat="server" />
                    <label class="form-check-label" for="existsCheckbox">Existe</label>
                </div>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Nombres</label>
                <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" placeholder="Ingrese nombres del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Apellidos</label>
                <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" placeholder="Ingrese apellidos del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Género</label>
                <asp:DropDownList ID="ddlGenero" runat="server" CssClass="form-control form-select w-75"> 
                <asp:ListItem>Femenino</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                </asp:DropDownList>
           </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Placeholder="Ingrese correo del contacto" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Teléfono</label>
                <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Placeholder="Ingrese teléfono del contacto"></asp:TextBox>
            </div>
         <div class="col-md-4">
             <label class="form-label">Tipo Contacto</label>
             <asp:DropDownList ID="ddlContacto" runat="server" CssClass="form-control form-select w-75"> 
             <asp:ListItem>Interesado</asp:ListItem>
             <asp:ListItem>Cliente</asp:ListItem>
             </asp:DropDownList>
         </div>
        </div>
    </div>

    <!-- Opportunity Details Section -->
    <div class="border-custom col-md-10">
        <h5 class="fw-bold">Detalles de Oportunidades</h5>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Encargado</label>
                <asp:TextBox ID="dllencargado" runat="server" class="form-control" placeholder="Nombre encargado"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Fecha Registro</label>
                <asp:TextBox ID="dllfechaRegistro" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-md-4">
               <label class="form-label">Canal</label>
                 <asp:DropDownList ID="ddlCanal" runat="server" CssClass="form-control form-select w-75"> 
                 <asp:ListItem>Llamada</asp:ListItem>
                 <asp:ListItem>Email</asp:ListItem>
                 </asp:DropDownList>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Nombre Negocio</label>
                <asp:TextBox ID="txtNombreNegocio" runat="server" CssClass="form-control" Placeholder="Ingrese nombre negocio"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Valor de Oportunidad</label>
                <asp:TextBox ID="txtValorOportunidad" runat="server" CssClass="form-control" Placeholder="Ingrese valor de oportunidad" TextMode="Number"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Fase</label>
                <asp:DropDownList ID="ddlFase" runat="server" CssClass="form-control form-select w-75"> 
                <asp:ListItem>Interesado</asp:ListItem>
                <asp:ListItem>En Progreso</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Seguidores</label>
                <asp:TextBox ID="txtSeguidores" runat="server" CssClass="form-control" Placeholder="Ingrese seguidores"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Etiqueta</label>
                 <asp:DropDownList ID="dllEtiqueta" runat="server" CssClass="form-control form-select w-100"> 
                 <asp:ListItem>Etiqueta 1</asp:ListItem>
                 <asp:ListItem>Etiqueta 2</asp:ListItem>
                 </asp:DropDownList>
            </div> 
            <div class="col-md-4">
                <label class="form-label">Estado</label>
                  <asp:DropDownList ID="dllEstado" runat="server" CssClass="form-control form-select w-75"> 
                  <asp:ListItem>Abierto</asp:ListItem>
                  <asp:ListItem>Cerrado</asp:ListItem>
                  </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class=" d-flex justify-content-end">
        <div class="d-flex">
            <asp:Button ID="btnCancelar" class="btn-close" runat="server" Text="Cancelar" data-bs-dismiss="modal" CssClass="btn btn-light me-2 fw-bold border-custom2 flex-fill" />
       </div>
         <div class="d-flex">
             <asp:Button ID="todo_submit" runat="server" Text="Aceptar" CssClass="btn btn-custom me-2 fw-bold flex-fill" OnClientClick="createTodo(); return false;" />
         </div>
         
    </div>
</div>
    
                </div>
            </div>
        </div>
    </div>
        <!-- Fin del modal-->


 <!-- Modal de editar oportunidad -->

<div class="modal fade" id="todoModal" tabindex="-1" aria-labelledby="todoModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="todoModalLabel">Oportunidad</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex">
       
        <div class="flex-grow-1 p-3">
          <div id="otrasOpcionesContent" class="section-content">
            <asp:Label ID="Label4" runat="server"  CssClass="fw-bold"  Text="Escoger fecha:"></asp:Label>
           <asp:TextBox ID="TextBox4" runat="server"  CssClass="form-control" placeholder="Escoger Fecha de Cita"></asp:TextBox>
         <div class="row">
             <div class="col-6">   
                  <asp:Label ID="Label5" runat="server"  CssClass="fw-bold"  Text="Lugar de reunión"></asp:Label>
                  <asp:TextBox ID="TextBox5" runat="server"  CssClass="form-control" placeholder="Ingrese Lugar de Reunión"></asp:TextBox>
             </div>
   
            <div class="col-6">    
                 <asp:Label ID="Label6" runat="server"  CssClass="fw-bold"  Text="Tema de reunión"></asp:Label>
                 <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"  placeholder="Ingrese Tema de Reunión"></asp:TextBox>
            </div>
       </div>
          </div>

          <div id="tareasContent" class="section-content d-none">
            <p>Contenido de Tareas</p>
          </div>
          <div id="notasContent" class="section-content d-none">
            <p>Contenido de Notas</p>
          </div>
          <p id="oportunidadEdit"></p>
        </div>

        <!-- SidebarModal  -->
       <div class="list-group min-vh-100 bordeSidebarm flex-shrink-0 p-3" style="width: 200px;">
           <asp:Label ID="Label1" runat="server" CssClass="fw-bold" Text="Otras opciones:"></asp:Label>
           <button type="button" class="SidebarmElemento list-group-item list-group-item-action" id="citas" onclick="showSection('otrasOpcionesContent')">Citas ></button>
           <button type="button" class="SidebarmElemento list-group-item list-group-item-action" id="tareas" onclick="showSection('tareasContent')">Tareas ></button>
           <button type="button" class="SidebarmElemento list-group-item list-group-item-action" id="notas" onclick="showSection('notasContent')">Notas ></button>
           <div class="d-flex flex-column mt-auto">
               <button class="btn fondo4 fw-bold my-2">Aceptar</button>
               <button class="btn fw-bold border-custom2">Eliminar</button>
          </div>
       </div>
          <!-- Fin del sidebarModal-->
      </div>
    </div>
  </div>
</div>
<!-- Fin del modal -->

        <div class="container mt-4 shadow  w-100">
    <div class="row">
        <div class="col-md status mb-3 my-0 border-end border-dark pt-2 mb-4" id="no_status">
            <h2 class="fondo1 mb-4">Nuevo Contacto</h2>
            <button class="todo border-0" draggable="true">Ejemplo Todo</button>
        </div>
        <div class="col-md status mb-3 my-0 border-end border-start border-dark pt-2 mb-4">
            <h2 class="fondo2 mb-4">Cliente Potencial</h2>
        </div>
        <div class="col-md status mb-3 my-0 border-end border-start border-dark pt-2 mb-4">
            <h2 class="fondo3 mb-4">Nueva Reservación</h2>
        </div>
        <div class="col-md status mb-3 my-0 border-start border-dark pt-2">
            <h2 class="fondo4 mb-4">Cliente Atendido</h2>
        </div>
    </div>
</div>

        <div id="overlay" class="d-none"></div>
    </form>

    <style>
     .SidebarmElemento.active {
         background-color: #efda9d !important; 
         color: #000 !important;   
     }

    </style>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const elementos = document.querySelectorAll('.SidebarmElemento');

            elementos.forEach(elemento => {
                elemento.addEventListener('click', function () {
                    // Quitar la clase 'active' de todos los elementos
                    elementos.forEach(e => e.classList.remove('active'));

                    // Agregar la clase 'active' al elemento clicado
                    this.classList.add('active');
                });
            });
        }); 
    </script>

    <script src="Assets/js/Kscript.js"></script>
</asp:Content>