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
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                            <div class="container mt-4">
        <h3>Crear Nueva Oportunidad</h3>
        <!-- Contact Details Section -->
        <div class="border-custom">
            <h5>Detalles de Contacto</h5>
            <div class="row mb-3">
                <div class="col-md-8">
                    <input type="text" class="form-control" placeholder="Buscar Contacto">
                </div>
                <div class="col-md-4">
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="existsCheckbox">
                        <label class="form-check-label" for="existsCheckbox">Existe</label>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Nombres</label>
                  <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Nombre"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellidos</label>
                     <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control w-75 my-auto" placeholder="Ingrese su Apellido"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Correo Electrónico</label>
                    <input type="email" class="form-control" placeholder="Ingrese correo del contacto">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Teléfono</label>
                    <input type="text" class="form-control" placeholder="Ingrese teléfono del contacto">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Género</label>
                    <select class="form-select">
                        <option>Femenino</option>
                        <option>Masculino</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label class="form-label">Tipo Contacto</label>
                    <select class="form-select">
                        <option>Interesado</option>
                        <option>Cliente</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Opportunity Details Section -->
        <div class="border-custom">
            <h5>Detalles de Oportunidades</h5>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Encargado</label>
                    <input type="text" class="form-control" placeholder="Nombre encargado">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Fecha Registro</label>
                    <input type="date" class="form-control">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Nombre Negocio</label>
                    <input type="text" class="form-control" placeholder="Ingrese nombre negocio">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Valor de Oportunidad</label>
                    <input type="number" class="form-control" placeholder="Ingrese valor de oportunidad">
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label class="form-label">Seguidores</label>
                    <input type="text" class="form-control" placeholder="Ingrese seguidores">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Etiqueta</label>
                    <select class="form-select">
                        <option>Etiqueta 1</option>
                        <option>Etiqueta 2</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label class="form-label">Canal</label>
                    <select class="form-select">
                        <option>Llamada</option>
                        <option>Email</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Fase</label>
                    <select class="form-select">
                        <option>Interesado</option>
                        <option>En Progreso</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Estado</label>
                    <select class="form-select">
                        <option>Abierto</option>
                        <option>Cerrado</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Buttons -->
        
    </div>
          <asp:Button ID="todo_submit" runat="server" Text="Agregar oportunidad" CssClass="btn btn-success btn-block" OnClientClick="createTodo(); return false;" />     
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
            <p>Contenido de Otras Opciones</p>
          </div>
          <div id="citasContent" class="section-content d-none">
            <p>Contenido de Citas</p>
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
          <button type="button" class="SidebarmElemento" id="otrasOpciones" onclick="showSection('otrasOpcionesContent')">Otras opciones:</button>
          <button type="button" class="SidebarmElemento" id="citas" onclick="showSection('citasContent')">Citas  ></button>
          <button type="button" class="SidebarmElemento" id="tareas" onclick="showSection('tareasContent')">Tareas ></button>
          <button type="button" class="SidebarmElemento" id="notas" onclick="showSection('notasContent')">Notas ></button>
          <div class="d-flex flex-column mt-auto">
            <button class="btn fondo4  fw-bold my-2 ">Aceptar</button>
            <button class="btn fw-bold ">Eliminar</button>
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

    <script src="Assets/js/Kscript.js"></script>
</asp:Content>