<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="kanban.aspx.cs" Inherits="CapaPresentacion.kanban" ClientIDMode="Static" Async="true"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="Assets/css/Kstyles.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <script>
   /*         function loadJsonData(data) {
                // Verificar si los datos están vacíos
                console.log("loadJsonData called");
                if (!data || data.length === 0) {
                    alert("No se encontraron registros.");
                    return;
                }
                console.log(data);
                // Recorrer los datos de oportunidades y mostrarlos
                data.forEach(oportunidad => {
                    const oportunidadElement = document.createElement("button");
                    oportunidadElement.classList.add("oportunidad", "border-0");
                    oportunidadElement.setAttribute("draggable", "true");

                    // Crear el nombre completo de la oportunidad
                    const input_val = `${oportunidad.PrimerContactoNombre} ${oportunidad.PrimerContactoApellido}`.trim();
                    oportunidadElement.textContent = input_val;

                    // Agregar el evento de clic para abrir el modal
                    oportunidadElement.addEventListener("click", () => openModal(oportunidad));

                    // Asumiendo que el contenedor con id "no_status" existe
                    document.getElementById("no_status").appendChild(oportunidadElement);
                });
            } 
       */
            async function cargarOportunidadesDesdeArchivo() {
                try {
                    const response = await fetch("Assets/js/oportunidades.json");
                    if (!response.ok) {
                        throw new Error('Error al cargar el archivo JSON');
                    } const oportunidades = await response.json();
                    oportunidades.forEach(oportunidad => {
                        despliegueOportunidad(oportunidad);
                    });
                } catch (error) {
                }
            }
        </script>
        <div class="container d-flex border-bottom border-dark my-4">
            <div><h5 class="fw-bold">Oportunidades</h5></div>
        </div>

        <div class="mx-4 mb-5 d-flex justify-content-end">

          
           <button id="btnAgregarp" class="btn fondo4 rounded-5 fw-bold" data-bs-toggle="modal" data-bs-target="#oportunidad_form" type="button">
    + Agregar Oportunidad
</button>
</div>

<!-- Modal de creación de oportunidades --> 
<div class="modal fade" id="oportunidad_form" tabindex="-1" aria-labelledby="oportunidadModalLabel" aria-hidden="true">
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
                            <div class="col-sm-4 col-md-7 ms-md-5">
                                <asp:TextBox ID="txtBuscarContacto" runat="server" CssClass="form-control" Placeholder="Buscar Contacto"></asp:TextBox>
                            </div>
                            <div class="col-md-4 col-sm-4">
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

                    <!-- Detalles de oportunidad -->
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
                    <div class="d-flex justify-content-end">
                        <div class="d-flex">
                            <button type="button" class="btn btn-light me-2 fw-bold border-custom2 flex-fill" data-bs-dismiss="modal">Cancelar</button>
                        </div>
                        <div class="d-flex">
                            <asp:Button ID="oportunidad_submit" runat="server" Text="Aceptar" CssClass="btn fondo4 me-2 fw-bold flex-fill" OnClick="createOportunidad" />
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- Fin del modal-->


 <!-- Modal de editar oportunidad -->

<div class="modal fade" id="oportunidadModal" tabindex="-1" aria-labelledby="oportunidadModalLabel" aria-hidden="true">
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
                <asp:TextBox ID="txtEditarNombres" runat="server" CssClass="form-control" placeholder="Ingrese nombres del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Apellidos</label>
                <asp:TextBox ID="txtEditarApellidos" runat="server" CssClass="form-control" placeholder="Ingrese apellidos del contacto"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Género</label>
                <asp:DropDownList ID="ddlEditarGenero" runat="server" CssClass="form-control form-select w-75"> 
                <asp:ListItem>Femenino</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                </asp:DropDownList>
                </div>
              </div>
              <div class="row mb-3">
            <div class="col-md-4">
                <label class="form-label">Correo Electrónico</label>
                <asp:TextBox ID="txtEditarCorreo" runat="server" CssClass="form-control" Placeholder="Ingrese correo del contacto" TextMode="Email"></asp:TextBox>
            </div>
            <div class="col-md-4">
                <label class="form-label">Teléfono</label>
                <asp:TextBox ID="txtEditarTelefono" runat="server" CssClass="form-control" Placeholder="Ingrese teléfono del contacto"></asp:TextBox>
            </div>
         <div class="col-md-4">
             <label class="form-label">Tipo Contacto</label>
             <asp:DropDownList ID="EditarTipoContacto" runat="server" CssClass="form-control form-select w-75"> 
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
            <asp:TextBox ID="txtEditarEncargado" runat="server" class="form-control" placeholder="Nombre encargado"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Fecha Registro</label>
            <asp:TextBox ID="ddlEditarFechaRegistro" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
        <div class="col-md-4">
           <label class="form-label">Canal</label>
             <asp:DropDownList ID="ddlEditarCanal" runat="server" CssClass="form-control form-select w-75"> 
             <asp:ListItem>Llamada</asp:ListItem>
             <asp:ListItem>Email</asp:ListItem>
             </asp:DropDownList>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Nombre Negocio</label>
            <asp:TextBox ID="txtEditarNombreNegocio" runat="server" CssClass="form-control" Placeholder="Ingrese nombre negocio"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Valor de Oportunidad</label>
            <asp:TextBox ID="txtEditarOportunidad" runat="server" CssClass="form-control" Placeholder="Ingrese valor de oportunidad" TextMode="Number"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Fase</label>
            <asp:DropDownList ID="ddlEditarFase" runat="server" CssClass="form-control form-select w-75"> 
            <asp:ListItem>Interesado</asp:ListItem>
            <asp:ListItem>En Progreso</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="row mb-3">
        <div class="col-md-4">
            <label class="form-label">Seguidores</label>
            <asp:TextBox ID="txtEditarSeguidores" runat="server" CssClass="form-control" Placeholder="Ingrese seguidores"></asp:TextBox>
        </div>
        <div class="col-md-4">
            <label class="form-label">Etiqueta</label>
             <asp:DropDownList ID="ddlEditarEtiqueta" runat="server" CssClass="form-control form-select w-100"> 
             <asp:ListItem>Etiqueta 1</asp:ListItem>
             <asp:ListItem>Etiqueta 2</asp:ListItem>
             </asp:DropDownList>
        </div> 
        <div class="col-md-4">
            <label class="form-label">Estado</label>
              <asp:DropDownList ID="ddlEditarEstado" runat="server" CssClass="form-control form-select w-75"> 
              <asp:ListItem>Abierto</asp:ListItem>
              <asp:ListItem>Cerrado</asp:ListItem>
              </asp:DropDownList>
           </div>
       </div>
   </div>
              <div class="d-flex justify-content-end">
    <div class="d-flex"> <!-- OnClick="btnEditarOportunidad_Click"-->                                       <!--   editarOportunidad()     -->            
<button type="button" id="btnEditarOportunidad" class="btn fondo4 me-2 fw-bold flex-fill" onclick="editarOportunidad();">Aceptar</button>
<button type="button" class="btn btn-light me-2 fw-bold border-custom2 flex-fill" data-bs-dismiss="modal">Cancelar</button>

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
                       <div class="d-flex justify-content-end"> 
                           <asp:Button ID="btnCita" runat="server" type="button" CssClass="btn fondo3 mt-2" Text="GuardarCita" OnClientClick="validarFormularioCitas(); return false;" />
                        </div>

                   </div>
          </div>
<!--Formulario de crear citas final-->

<!--Contenedor de tareas-->
  <div id="tareasContent" class="section-content d-none">
    <h6 class="headerForms" id="lblAgregarTarea">Agregar Nueva Tarea</h6>
    <button id="crearTareaBtn" class="btn fondo3 w-100" type="button" onclick="mostrarFormularioTarea()">+ Crear Nueva Tarea</button>
    <div class="contenedorTareas" id="contenidoTareas">

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
            <asp:Button ID="ButtonEdit" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Tarea" OnClientClick="editartarea(); return false;" />
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

</div>
              
<!-- Contenido de notas,Final-->

 <!-- Formulario de  crear notas -->
         <div id="formularioNota" class="d-none">
    <div class="mb-1">
       <label class="fw-bold">Nueva Nota</label>
    </div>
    <div class="mb-3">
        <asp:TextBox ID="notaDescripcion" runat="server" CssClass="form-control text-start" TextMode="MultiLine" placeholder="Ingresa descripcion de nota." Rows="5" Columns="50"></asp:TextBox>
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
        <asp:TextBox ID="EditnotaDescripcion" runat="server" CssClass="form-control text-start " TextMode="MultiLine" placeholder="Ingresa descripcion de nota." Rows="5" Columns="50"></asp:TextBox>
    </div> 
     <div class="d-flex justify-content-end">
        <asp:Button ID="Button1" runat="server" type="button" CssClass="btn fondo3 me-2" Text="Guardar Nota" OnClientClick="editarnota(); return false;" />
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
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.js"></script>
</asp:Content>