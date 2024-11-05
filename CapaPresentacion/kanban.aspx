<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/css/Kstyles.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        
        <div class="container d-flex border-bottom my-4">
            <div><h5>Oportunidades</h5></div>
        </div>

        <div class="mx-4 mb-5 d-flex justify-content-end">

          
            <button id="btnAgregarp" class="btn btn-warning fw-bold" data-bs-toggle="modal" data-bs-target="#todo_form" type="button">
                Agregar Oportunidad
            </button>
        </div>

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
                    <input type="text" class="form-control" placeholder="Ingrese nombres del contacto">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Apellidos</label>
                    <input type="text" class="form-control" placeholder="Ingrese apellidos del contacto">
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
        <div class="mt-3 d-flex justify-content-end">
            <button class="btn btn-custom me-2">Aceptar</button>
            <button class="btn btn-secondary">Cancelar</button>
        </div>
    </div>
                                 <asp:Button ID="todo_submit" runat="server" Text="Agregar oportunidad" CssClass="btn btn-success btn-block" OnClientClick="createTodo(); return false;" />     
                    </div>
                </div>
            </div>
        </div>

        <div class="container mt-4">
            <div class="row"> 
                <div class="col-md status mb-3 my-0 " id="no_status">
                    <h2 class="borde1">Nuevo Contacto</h2>
                    <div class="todo" draggable="true">Ejemplo Todo</div>

                </div>
                <div class="col-md status mb-3 my-0 ">
                    <h2 class="borde2">Cliente Potencial</h2>
                </div>
                <div class="col-md status mb-3 my-0">
                    <h2 class="borde3">Nueva Reservacion</h2>
                </div>
                <div class="col-md status mb-3 my-0 ">
                    <h2 class="borde4">Cliente Atendido</h2>
                </div>
            </div>
        </div>

        <div id="overlay" class="d-none"></div>
    </form>

    <script src="Assets/js/Kscript.js"></script>
</asp:Content>