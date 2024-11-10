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
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="todoModalLabel">Oportunidad</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body d-flex">
       
        <div class="flex-grow-1 p-3">
            <!-- Seccion de otras opciones -->
          <div id="otrasOpcionesContent" class="section-content">
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
            <!--Fin de otras opciones -->

          <div id="citasContent" class="section-content d-none">
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
  <div id="tareasContent" class="section-content">
    <button id="crearTareaBtn" class="btn btn-warning w-100" type="button" onclick="mostrarFormulario()">+ Crear Nueva Tarea</button>
    
    <!-- Contenedor para la lista de tareas -->
    <div id="tareasContainer" class="active mt-3">
        <!-- Lista de tareas -->
        <div id="listaTareas" class="mt-3 d-none"></div> 
    </div>

    <!-- Formulario para crear nueva tarea (oculto por defecto) -->
    <div id="nuevaTarea" class="d-none mt-0">
        <asp:Label ID="Label3" runat="server" CssClass="fw-bold" Text="Título:"></asp:Label>
        <asp:TextBox ID="tituloNota" CssClass="form-control" placeholder="Ingrese Título de Tarea" runat="server"></asp:TextBox>
        <asp:Label ID="Label7" runat="server" CssClass="fw-bold" Text="Descripción:"></asp:Label>
        <asp:TextBox ID="txtDescripcionTarea" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Ingrese Descripción de Tarea"></asp:TextBox>
        <div class="row">
            <div class="col-6">
                <asp:Label ID="Label8" runat="server" CssClass="fw-bold" Text="Encargado:"></asp:Label>
                <asp:TextBox ID="txtNombreEncargado" runat="server" CssClass="form-control" placeholder="Ingrese Nombre de Encargado"></asp:TextBox>
            </div>
            <div class="col-6">
                <asp:Label ID="Label9" runat="server" CssClass="fw-bold" Text="Fecha vencimiento:"></asp:Label>
                <asp:TextBox ID="txtFechaVencimiento" runat="server" CssClass="form-control" placeholder="Escoger Fecha Vencimiento"></asp:TextBox>
            </div>
        </div>
        <button class="btn fondo4 fw-bold my-2" type="button" onclick="aceptarTarea()">Aceptar</button>
        <button class="btn fw-bold border-custom2" type="button" onclick="cancelarTarea()">Cancelar</button>
    </div>
</div>




          <div id="notasContent" class="section-content d-none">
               <button id="crearNotaBtn" class="btn btn-warning w-100" type="button" onclick="toggleNota()">+ Crear Nueva Nota</button>
               <div id="nuevaNota" class="d-none mt-0">
               <asp:Label ID="Label2" runat="server" CssClass="fw-bold" Text="Nueva nota:"></asp:Label>
               <asp:TextBox ID="txtDescripcionNota" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" placeholder="Ingrese Descripción de Nota"></asp:TextBox>
               </div>
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
         var tareas = [];  // Array para almacenar las tareas



         // Función para mostrar el formulario de crear tarea y ocultar la lista
         function mostrarFormulario() {
             var nuevaTarea = document.getElementById('nuevaTarea');
             var listaTareas = document.getElementById('listaTareas');
             var tareasContainer = document.getElementById('tareasContainer');

             // Ocultar la lista de tareas
             listaTareas.classList.add('d-none');

             // Mostrar el formulario
             nuevaTarea.classList.remove('d-none');

             // Agregar la clase 'active' al contenedor de tareas
             tareasContainer.classList.add('active');
         }

         // Función para aceptar la tarea
         function aceptarTarea() {
             var nuevaTarea = document.getElementById('nuevaTarea');
             var listaTareas = document.getElementById('listaTareas');

             // Obtener los valores de los campos
             var titulo = document.getElementById('<%= tituloNota.ClientID %>').value;
    var descripcion = document.getElementById('<%= txtDescripcionTarea.ClientID %>').value;
    var encargado = document.getElementById('<%= txtNombreEncargado.ClientID %>').value;
    var fechaVencimiento = document.getElementById('<%= txtFechaVencimiento.ClientID %>').value;

    // Validación de campos
    if (titulo && descripcion && encargado && fechaVencimiento) {
        // Crear objeto de tarea
        var tarea = {
            titulo: titulo,
            descripcion: descripcion,
            encargado: encargado,
            fechaVencimiento: fechaVencimiento
        };

        // Agregar la tarea al array
        tareas.push(tarea);

        // Actualizar la lista de tareas
        actualizarListaTareas();

        // Limpiar los campos
        document.getElementById('<%= tituloNota.ClientID %>').value = '';
        document.getElementById('<%= txtDescripcionTarea.ClientID %>').value = '';
        document.getElementById('<%= txtNombreEncargado.ClientID %>').value = '';
        document.getElementById('<%= txtFechaVencimiento.ClientID %>').value = '';

        // Ocultar el formulario y mostrar la lista
        nuevaTarea.classList.add('d-none');
        listaTareas.classList.remove('d-none');
    } else {
        alert('Por favor, completa todos los campos antes de aceptar la tarea.');
    }
}

// Función para cancelar la tarea y volver a la lista
function cancelarTarea() {
    var nuevaTarea = document.getElementById('nuevaTarea');
    var listaTareas = document.getElementById('listaTareas');
    
    // Limpiar los campos de entrada
    document.getElementById('<%= tituloNota.ClientID %>').value = '';
    document.getElementById('<%= txtDescripcionTarea.ClientID %>').value = '';
    document.getElementById('<%= txtNombreEncargado.ClientID %>').value = '';
             document.getElementById('<%= txtFechaVencimiento.ClientID %>').value = '';

             // Ocultar el formulario y mostrar la lista de tareas
             nuevaTarea.classList.add('d-none');
             listaTareas.classList.remove('d-none');
         }

         // Función para actualizar la lista de tareas en el DOM
         function actualizarListaTareas() {
             var listaTareas = document.getElementById('listaTareas');

             // Limpiar las tareas existentes en el DOM
             listaTareas.innerHTML = '';

             // Recorrer las tareas y agregarlas al contenedor
             tareas.forEach(function (tarea) {
                 var nuevaDiv = document.createElement('div');
                 nuevaDiv.className = 'tarea mb-2 p-2 border rounded bg-light';
                 nuevaDiv.innerHTML = `
            <h5 class="fw-bold">${tarea.titulo}</h5>
            <p>${tarea.descripcion}</p>
            <p><strong>Encargado:</strong> ${tarea.encargado}</p>
            <p><strong>Fecha de Vencimiento:</strong> ${tarea.fechaVencimiento}</p>
        `;
                 listaTareas.appendChild(nuevaDiv);  // Aquí agregamos la tarea al contenedor de lista
             });
         }
    </script>

    <script src="Assets/js/Kscript.js"></script>
</asp:Content>
