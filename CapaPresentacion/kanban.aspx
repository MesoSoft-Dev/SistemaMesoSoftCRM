<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">

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
   
    <!-- Detalles de contacto -->
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

    <!-- Detalles de oportunidad-->
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
             <asp:Button ID="todo_submit" runat="server" Text="Aceptar" CssClass="btn fondo4 me-2 fw-bold flex-fill" OnClientClick="createTodo(); return false;" />
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
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
    
      <div class="modal-body d-flex">
       
        <div class="flex-grow-1 p-3">
            <!-- Seccion de otras opciones, Editar oportunidad -->
          <div id="otrasOpcionesContent" class="section-content">
              <h6 class="headerForms">Editar Oportunidad</h6>

            <div class="border-custom3 col-md-12">
                <asp:Label ID="Label1" runat="server" CssClass="fw-bold" Text="Detalles de Contacto"></asp:Label>
                <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Nombres</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Ingrese nombres del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Apellidos</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Ingrese apellidos del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Género</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control form-select w-75"> 
                <asp:ListItem>Femenino</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                </asp:DropDownList>
                </div>
              </div>
              <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Placeholder="Ingrese correo del contacto" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Teléfono</label>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Placeholder="Ingrese teléfono del contacto"></asp:TextBox>
            </div>
         <div class="col-md-4">
             <label class="form-label">Tipo Contacto</label>
             <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control form-select w-75"> 
             <asp:ListItem>Interesado</asp:ListItem>
             <asp:ListItem>Cliente</asp:ListItem>
             </asp:DropDownList>
           </div>
          </div>
         </div>
         <div class="border-custom col-md-12">
          <h5 class="fw-bold">Detalles de Oportunidades</h5>
    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Encargado</label>
            <asp:TextBox ID="TextBox8" runat="server" class="form-control" placeholder="Nombre encargado"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Fecha Registro</label>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="col-md-4">
           <label class="form-label">Canal</label>
             <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control form-select w-75"> 
             <asp:ListItem>Llamada</asp:ListItem>
             <asp:ListItem>Email</asp:ListItem>
             </asp:DropDownList>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Nombre Negocio</label>
            <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Placeholder="Ingrese nombre negocio"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Valor de Oportunidad</label>
            <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" Placeholder="Ingrese valor de oportunidad" TextMode="Number"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Fase</label>
            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control form-select w-75"> 
            <asp:ListItem>Interesado</asp:ListItem>
            <asp:ListItem>En Progreso</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Seguidores</label>
            <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Placeholder="Ingrese seguidores"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Etiqueta</label>
             <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control form-select w-100"> 
             <asp:ListItem>Etiqueta 1</asp:ListItem>
             <asp:ListItem>Etiqueta 2</asp:ListItem>
             </asp:DropDownList>
        </div> 
        <div class="col-md-4">
            <label class="form-label">Estado</label>
              <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control form-select w-75"> 
              <asp:ListItem>Abierto</asp:ListItem>
              <asp:ListItem>Cerrado</asp:ListItem>
              </asp:DropDownList>
           </div>
       </div>
   </div>
</div>
            <!--Fin de otras opciones, editar oportunidad-->

<!--Formulario de crear citas-->    
          <div id="citasContent" class="section-content d-none">
              <h6 class="headerForms" >Agregar Nueva Cita</h6>
                   <asp:Label ID="Label4" runat="server"  CssClass="fw-bold"  Text="Escoger fecha:"></asp:Label>
                   <asp:TextBox ID="fechaCita" runat="server"  CssClass="form-control" placeholder="Escoger Fecha de Cita"></asp:TextBox>
                   <div class="row">
                      <div class="col-6">   
                           <asp:Label ID="Label5" runat="server"  CssClass="fw-bold"  Text="Lugar de reunión"></asp:Label>
                           <asp:TextBox ID="txtLugarReunion" runat="server"  CssClass="form-control" placeholder="Ingrese Lugar de Reunión"></asp:TextBox>
                     </div>
   
                    <div class="col-6">    
                         <asp:Label ID="Label6" runat="server"  CssClass="fw-bold"  Text="Tema de reunión"></asp:Label>
                         <asp:TextBox ID="txtTemaReunion" runat="server" CssClass="form-control"  placeholder="Ingrese Tema de Reunión"></asp:TextBox>
                    </div>
                   </div>
          </div>
<!--Formulario de crear citas final-->

<!--Contenedor de tareas-->
  <div id="tareasContent" class="section-content d-none">
    <h6 class="headerForms" id="lblAgregarTarea">Agregar Nueva Tarea</h6>
    <button id="crearTareaBtn" class="btn fondo3 w-100" type="button" onclick="mostrarFormularioTarea()">+ Crear Nueva Tarea</button>
    <div class="contenedorTareas" id="contenidoTareas">

        <div class="Tarea my-3 d-flex"> 
            <div class="flex-grow-1 p-2"> 
                <div class="DetalleTarea">Ejemplo</div>
                <div class="subTarea">EX</div>
                <div class="subTarea">Ex</div>
            </div>  
            <div class="d-flex flex-column align-items-start me-5 p-2 ">
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" id="btnEditTarea" onclick="mostrarFormularioEditTarea(); return false;">Editar</button>
                <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaTarea()">Eliminar</button>
            </div>
        </div>

    </div>
              
    <!-- Contenido de tareas, Final -->

    <!-- Formulario para crear tareas -->
    <div id="formularioTarea" class="d-none">
        <div class="mb-1">
            <label class="fw-bold">Título</label>
            <asp:TextBox ID="tareaTitulo" CssClass="form-control text-start" runat="server" placeholder="Ingrese Título de Tarea."></asp:TextBox>
        </div>
        <div class="mb-1">
            <label class="fw-bold">Descripción</label>
            <asp:TextBox ID="tareaDescripcion" runat="server" CssClass="form-control text-start" TextMode="MultiLine" placeholder="Ingrese Descripción de Tarea." Rows="5" Columns="50"></asp:TextBox>
        </div>
        <div class="row mb-2">
            <div class="col-6">
                <label class="fw-bold">Encargado:</label>
                <asp:TextBox ID="tareasEncargado" runat="server" CssClass="form-control text-start" placeholder="Ingrese Nombre de Encargado"></asp:TextBox>
            </div>
            <div class="col-6">
                <label class="fw-bold">Fecha vencimiento:</label>
                <asp:TextBox ID="tareasFecha" runat="server" CssClass="form-control text-start" placeholder="Escoger Fecha Vencimiento"></asp:TextBox>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <asp:Button ID="guardarTareaBtn" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Tarea" OnClientClick="guardarTarea(); return false;" />
            <button type="button" class="btn border-custom2" onclick="ocultarFormularioTarea()">Cancelar</button>
        </div>
    </div>
    <!-- Formulario para crear tareas, FINAL -->

    <!-- Formulario para editar tareas -->
    <div id="formularioEditarTarea" class="d-none">
       <h6 class="headerForms">Editar Tarea</h6>
<div class="mb-1">
    <label class="fw-bold">Título</label>
    <asp:TextBox ID="tareaTituloEditar" CssClass="form-control text-start" runat="server" placeholder="Ingrese Título de Tarea."></asp:TextBox>
</div>
<div class="mb-1">
    <label class="fw-bold">Descripción</label>
    <asp:TextBox ID="tareaDescripcionEditar" runat="server" CssClass="form-control text-start" TextMode="MultiLine" placeholder="Ingrese Descripción de Tarea." Rows="5" Columns="50"></asp:TextBox>
</div>
<div class="row mb-2">
    <div class="col-6">
        <label class="fw-bold">Encargado:</label>
        <asp:TextBox ID="tareasEncargadoEditar" runat="server" CssClass="form-control text-start" placeholder="Ingrese Nombre de Encargado"></asp:TextBox>
    </div>
    <div class="col-6">
        <label class="fw-bold">Fecha vencimiento:</label>
        <asp:TextBox ID="tareasFechaEditar" runat="server" CssClass="form-control text-start"  placeholder="Escoger Fecha Vencimiento"></asp:TextBox>
    </div>
</div>
        <div class="d-flex justify-content-end">
            <asp:Button ID="ButtonEdit" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Tarea" />
            <button type="button" class="btn border-custom2" onclick=" ocultarFormularioEditTarea()">Cancelar</button>
        </div>
    </div>
    <!-- Formulario para editar tareas, FINAL -->

    <!-- Ventana de Confirmación en tareas -->
    <div id="ventanaConfirmacionTarea" class="ventanaConfirmar-content d-none mx-auto mt-5">
        <div class="ventanaConfirmar-header border-0">
            <h4 class="ventanaConfirmar-title fw-bold w-100" >¡IMPORTANTE!</h4>
        </div>
        <div class="ventanaConfirmar-body px-3 py-1">
            <p>Seguro que desea eliminar el registro</p>
        </div>
        <div class="ventanaConfirmar-footer pb-1 d-flex justify-content-center">
            <asp:Button ID="btnEliminarTarea" runat="server" CssClass="btn btn-ventana me-5" Text="Eliminar" OnClientClick="eliminarTarea(); return false;" />
            <a href="#" class=" btn btn-ventana" onclick="cerrarVentanaTarea()">Cancelar</a>
        </div>
    </div>
    <!-- Ventana de Confirmación en tareas final -->

</div>
 <!-- Formulario para crear nueva tarea,Final -->




<!-- Contenido de notas-->
<div id="notasContent" class="section-content d-none">
<h6 class="headerForms" id="lblAgregarNota">Agregar Nueva Nota</h6>
<button id="crearNotaBtn" class="btn fondo3 w-100" type="button" onclick="mostrarFormularioNota()">+ Crear Nueva Nota</button>
<div class="contenedorNotas" id="contenidoNotas">

<div class="Nota my-3 d-flex"> 
    <div class="flex-grow-1 p-2"> 
        <div class="DetalleNota">Ejemplo</div>
        <div class="subNota">EX</div>
        <div class="subNota">Ex</div>
    </div>
    <div class="d-flex flex-column align-items-start me-5 p-2 "> 
        <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" id="btnEditNota" onclick="mostrarFormularioEditNota(); return false;">Editar</button>
        <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentana()">Eliminar</button>
    </div>
</div>

</div>
              
<!-- Contenido de notas,Final-->

 <!-- Formulario de  crear notas -->
         <div id="formularioNota" class="d-none">
    <div class="mb-1">
       <label class="fw-bold">Nueva Nota</label>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="notaDescripcion" runat="server" CssClass="form-control py-5 text-start " TextMode="MultiLine" placeholder="Ingresa descripcion de nota."></asp:TextBox>
    </div>

   
    <div class="d-flex justify-content-end">
        <asp:Button ID="guardarNotaBtn" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Nota" OnClientClick="guardarNota(); return false;" />
        <button type="button" class="btn border-custom2" onclick="ocultarFormularioNota()">Cancelar</button>
    </div>
</div>
 <!-- Formulario de notas,FINAL-->
<!-- Formulario de editar Notas-->
 <div id="formularioEditarNota" class="d-none">
<h6 class="headerForms">Editar Nota</h6>

    <div class="mb-1">
       <label class="fw-bold">Nueva Nota</label>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="EditnotaDescripcion" runat="server" CssClass="form-control py-5 text-start " TextMode="MultiLine" placeholder="Ingresa descripcion de nota."></asp:TextBox>
    </div>
     <div class="d-flex justify-content-end">
        <asp:Button ID="Button1" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Nota" />
        <button type="button" class="btn border-custom2" onclick="ocultarFormularioEditNota()">Cancelar</button>
    </div>
</div>
 <!-- formulario de editar Notas final-->

 <!-- Ventana de Confirmación en notas -->
    <div id="ventanaConfirmacion" class="ventanaConfirmar-content d-none mx-auto mt-5">
        <div class="ventanaConfirmar-header border-0">
            <h4 class="ventanaConfirmar-title fw-bold w-100" id="ventanaConfirmarLabel">¡IMPORTANTE!</h4>
        </div>
        <div class="ventanaConfirmar-body px-3 py-1">
            <p>Seguro que desea eliminar el registro</p>
        </div>
        <div class="ventanaConfirmar-footer pb-1 d-flex justify-content-center">
            <asp:Button ID="btnEliminarNota" runat="server" CssClass="btn btn-ventana me-5" Text="Eliminar" OnClientClick="eliminarNota(); return false;" />
            <a href="#" class="btn btn-ventana" onclick="cerrarVentanaNota()">Cancelar</a>
        </div>
    </div>
<!-- Ventana de Confirmación en notas final -->




          </div>
          <p id="oportunidadEdit"></p>
        </div>

        <!-- SidebarModal  -->
        <div class="list-group col-3 min-vh-100 bordeSidebarm flex-shrink-0">
          <button type="button" class="SidebarmElemento" id="otrasOpciones" onclick="showSection('otrasOpcionesContent')">Otras opciones:</button>
          <button type="button" class="SidebarmElemento" id="citas" onclick="showSection('citasContent')">Citas  ></button>
          <button type="button" class="SidebarmElemento" id="tareas" onclick="showSection('tareasContent')">Tareas ></button>
          <button type="button" class="SidebarmElemento" id="notas" onclick="showSection('notasContent')">Notas ></button>
          <div class="d-flex flex-column mt-auto">
            <button class="btn fondo4  fw-bold my-2">Aceptar</button>
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
        .custom-height {
    height: 100px; /* Set your desired height here */
}
    </style>

    

    <script src="Assets/js/Kscript.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.js"></script>
</asp:Content>