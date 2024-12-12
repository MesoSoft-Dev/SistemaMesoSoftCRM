
 /* function loadJsonData(data) {
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
}  */




/*document.addEventListener("DOMContentLoaded", function () {
    cargarOportunidadesDesdeArchivo();
});
*/

//funciones de drag and drop============================================
const oportunidades = document.querySelectorAll(".oportunidad");
const all_status = document.querySelectorAll(".status");
let draggableOportunidad = null;

oportunidades.forEach((oportunidad) => {
    oportunidad.addEventListener("dragstart", dragStart);
    oportunidad.addEventListener("dragend", dragEnd);
    oportunidad.addEventListener("click", openModal);
});

function dragStart() {
    draggableOportunidad = this;
    setTimeout(() => {
        this.style.display = "none";
    }, 0);
}

function dragEnd() {
    draggableOportunidad = null;
    setTimeout(() => {
        this.style.display = "block";
    }, 0);
}

all_status.forEach((status) => {
    status.addEventListener("dragover", dragOver);
    status.addEventListener("drop", dragDrop);
});

function dragOver(e) {
    e.preventDefault();
}

function dragDrop() {
    this.appendChild(draggableOportunidad);

    const headerColor = window.getComputedStyle(this.querySelector("h2")).backgroundColor;
    draggableOportunidad.style.backgroundColor = headerColor;
}

 //creacion de oportunidades====================================================================

const oportunidadesData = {};

function limpiarCampos() {
    document.getElementById("txtNombres").value = "";
    document.getElementById("txtApellidos").value = "";
    document.getElementById("txtCorreo").value = "";
    document.getElementById("txtTelefono").value = "";
    document.getElementById("ddlGenero").value = -1;
    document.getElementById("ddlContacto").value = "";
    document.getElementById("dllencargado").value = "";
    document.getElementById("dllfechaRegistro").value = "";
    document.getElementById("ddlCanal").value = "";
    document.getElementById("txtNombreNegocio").value = "";
    document.getElementById("txtValorOportunidad").value = "";
    document.getElementById("ddlFase").value = "";
    document.getElementById("txtSeguidores").value = "";
    document.getElementById("dllEtiqueta").value = "";
    document.getElementById("dllEstado").value = "";
    document.getElementById("existsCheckbox").checked = false;
}

function despliegueOportunidad(oportunidad) {
    const oportunidadId = `oportunidad-${contIdOportunidad++}`; 
    const oportunidadElement = document.createElement("button");
    oportunidadElement.classList.add("oportunidad", "border-0");
    oportunidadElement.setAttribute("draggable", "true");
    oportunidadElement.setAttribute("data-id", oportunidadId);

   
    const input_val = `${oportunidad.PrimerContactoNombre} ${oportunidad.PrimerContactoApellido}`.trim();
    oportunidadElement.textContent = input_val;

    oportunidadElement.addEventListener("dragstart", dragStart);
    oportunidadElement.addEventListener("dragend", dragEnd);
    oportunidadElement.addEventListener("click", openModal);

    document.getElementById("no_status").appendChild(oportunidadElement);
    oportunidadesData[oportunidadId] = { notas: [], tareas: [], oportunidad: oportunidad };
}

function validarFormulario() {
    const nombres = document.getElementById("txtNombres").value;
    const apellidos = document.getElementById("txtApellidos").value;
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value; txtTelefono
    


    if (nombres.trim() === "") {
        alert("El campo Nombres es obligatorio.");
        return false;
    }

    if (apellidos.trim() === "") {
        alert("El campo Apellidos es obligatorio.");
        return false;
    }
        if (correo.trim() === "") {
            alert("El campo Correo Electrónico es obligatorio.");
            return false;
        }

        if (telefono.trim() === "") {
            alert("El campo Teléfono es obligatorio.");
            return false;
        }
    return true;
}
function validarFormularioEditar() {
    const nombres = document.getElementById("txtEditarNombres").value;
    const apellidos = document.getElementById("txtEditarApellidos").value;
    const correo = document.getElementById("txtEditarCorreo").value;
    const telefono = document.getElementById("txtEditarTelefono").value; txtTelefono



    if (nombres.trim() === "") {
        alert("El campo Nombres es obligatorio.");
        return false;
    }

    if (apellidos.trim() === "") {
        alert("El campo Apellidos es obligatorio.");
        return false;
    }
    if (correo.trim() === "") {
        alert("El campo Correo Electrónico es obligatorio.");
        return false;
    }

    if (telefono.trim() === "") {
        alert("El campo Teléfono es obligatorio.");
        return false;
    }
    return true;
}
let contIdOportunidad = 0;

function createOportunidad() {
    if (validarFormulario() == false) {
        return;
    }

    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    const fechaRegistro = document.getElementById("dllfechaRegistro").value;
    const selectedDate = new Date(fechaRegistro);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        alert("Por favor, ingrese una fecha válida que no sea anterior a hoy.");
        return;
    }

    const oportunidadId = `oportunidad_${contIdOportunidad++}`;
    oportunidadesData[oportunidadId] = { notas: [], tareas: [] };

  
    const oportunidad = {
        id: oportunidadId,
        nombre: nombre,
        apellido: apellido,
        fechaRegistro: fechaRegistro
    };

   
    despliegueOportunidad(oportunidad);

    limpiarCampos();

    const modalElement = document.getElementById('oportunidad_form');
    const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
    // modalInstance.hide(); // ahora da problemas el cerrar modales desde javascript
}
// editar oportunidad
function editarOportunidad() {
    if (validarFormularioEditar() == false) {
        return;
    }

    const oportunidadId = document.getElementById('oportunidadModal').getAttribute("data-id"); 
    const nombre = document.getElementById("txtEditarNombres").value; 
    const apellido = document.getElementById("txtEditarApellidos").value; 
    const input_val = `${nombre} ${apellido}`.trim();

    const fechaRegistro = document.getElementById("ddlEditarFechaRegistro").value; 
    const selectedDate = new Date(fechaRegistro);
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (selectedDate < today) {
        alert("Por favor, ingrese una fecha válida que no sea anterior a hoy.");
        return;
    }

 
    if (!oportunidadesData[oportunidadId]) {
        console.error(`No se encontró la oportunidad con ID: ${oportunidadId}`);
        return;
    }

   
    oportunidadesData[oportunidadId].nombre = nombre;
    oportunidadesData[oportunidadId].apellido = apellido;
    oportunidadesData[oportunidadId].fechaRegistro = fechaRegistro; 

  
    const oportunidadButton = document.querySelector(`button[data-id='${oportunidadId}']`);
    if (oportunidadButton) {
        oportunidadButton.textContent = input_val;
    }

    limpiarCampos();

    const modalElement = document.getElementById('oportunidad_form');
    const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
  
}

function cargarDatosOportunidad(oportunidadId) {
    const oportunidad = oportunidadesData[oportunidadId];
   
    const nombresInput = document.getElementById("txtEditarNombres");

    console.log(oportunidad.PrimerContactoApellido);

    if (nombresInput) {
        nombresInput.value = oportunidad.oportunidad.PrimerContactoNombre || "";
    } else {
        console.warn("No se encontró el input 'txtEditarNombres' en el DOM.");
    }
    document.getElementById("txtEditarApellidos").value = oportunidad.oportunidad.PrimerContactoApellido || "";
    document.getElementById("txtEditarCorreo").value = oportunidad.oportunidad.PrimerContactoCorreo || "";
    document.getElementById("txtEditarTelefono").value = oportunidad.oportunidad.PrimerContactoTel || "";
    document.getElementById("ddlEditarCanal").value = oportunidad.oportunidad.Canal || "";
    document.getElementById("txtEditarEncargado").value = oportunidad.oportunidad.Encargado || "";
    document.getElementById("ddlEditarFechaRegistro").value = oportunidad.oportunidad.FechaRegistro || "";
    document.getElementById("txtEditarNombreNegocio").value = oportunidad.oportunidad.NombreNegocio || "";
    document.getElementById("txtEditarOportunidad").value = oportunidad.oportunidad.Valor || "";
    document.getElementById("txtEditarSeguidores").value = oportunidad.oportunidad.Seguidores || ""; 
    document.getElementById("ddlEditarEtiqueta").value = oportunidad.oportunidad.Etiquetas || "";
    document.getElementById("ddlEditarFase").value = oportunidad.oportunidad.Fase || "";
    document.getElementById("ddlEditarEstado").value = oportunidad.oportunidad.Estatus || "";
    console.log(`Datos de la oportunidad con ID ${oportunidadId} cargados correctamente.`);
}


// Despliege del modal de edicion, citas, tareas y notas.
function openModal(event) {
    event.preventDefault();
    const oportunidadId = event.currentTarget.getAttribute("data-id");
    document.getElementById('oportunidadModal').setAttribute("data-id", oportunidadId);

    renderNotas(oportunidadId);
    renderTareas(oportunidadId);

    const modalElement = document.getElementById('oportunidadModal');
    const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
    modalInstance.show();
    cargarDatosOportunidad(oportunidadId);
    
}
    function showSection(sectionId) {
        const sections = document.querySelectorAll(".section-content");
        sections.forEach((section) => {
            section.classList.add("d-none");
        });

        document.getElementById(sectionId).classList.remove("d-none");
    }


    document.addEventListener('DOMContentLoaded', function () {
        const elementos = document.querySelectorAll('.SidebarmElemento');

        elementos.forEach(elemento => {
            elemento.addEventListener('click', function () {
                elementos.forEach(e => e.classList.remove('active'));

                this.classList.add('active');
            });
        });
    });

//funciones de citas========================================================

function validarFormularioCitas() {
    const fechaCita = document.getElementById("fechaCita").value;
    const lugarReunion = document.getElementById("txtLugarReunion").value;
    const temaReunion = document.getElementById("txtTemaReunion").value;

    if (fechaCita.trim() === "") {
        alert("El campo Fecha de Cita es obligatorio.");
        return false;
    }

    if (lugarReunion.trim() === "") {
        alert("El campo Lugar de Reunión es obligatorio.");
        return false;
    }

    if (temaReunion.trim() === "") {
        alert("El campo Tema de Reunión es obligatorio.");
        return false;
    }

    return true;
}

    // funciones de notas===========================================================================================================================
    function mostrarFormularioNota() {
        document.getElementById('crearNotaBtn').classList.add('d-none');
        document.getElementById('contenidoNotas').classList.add('d-none');
        document.getElementById('formularioNota').classList.remove('d-none');
    }

    function ocultarFormularioNota() {
        document.getElementById('crearNotaBtn').classList.remove('d-none');
        document.getElementById('formularioNota').classList.add('d-none');
        document.getElementById('contenidoNotas').classList.remove('d-none');
    }


    function mostrarFormularioEditNota() {
        document.getElementById('crearNotaBtn').classList.add('d-none');
        document.getElementById('contenidoNotas').classList.add('d-none');
        document.getElementById('lblAgregarNota').classList.add('d-none'); 
        document.getElementById('formularioEditarNota').classList.remove('d-none');
    }

    function ocultarFormularioEditNota() {

        document.getElementById('crearNotaBtn').classList.remove('d-none');
        document.getElementById('contenidoNotas').classList.remove('d-none');
        document.getElementById('lblAgregarNota').classList.remove('d-none');
        document.getElementById('formularioEditarNota').classList.add('d-none');

    }

function abrirVentanaNota(oportunidadId, notaId) {
    document.getElementById('crearNotaBtn').classList.add('d-none');
    document.getElementById('contenidoNotas').classList.add('d-none');
    document.getElementById("ventanaConfirmacion").classList.remove("d-none");
    document.getElementById("lblAgregarNota").classList.add("d-none");

    const btnEliminarNota = document.getElementById("btnEliminarNota");
    btnEliminarNota.setAttribute("data-oportunidad-id", oportunidadId);
    btnEliminarNota.setAttribute("data-nota-id", notaId);
}

    function cerrarVentanaNota() {
        document.getElementById('crearNotaBtn').classList.remove('d-none');
        document.getElementById('contenidoNotas').classList.remove('d-none');
        document.getElementById("ventanaConfirmacion").classList.add("d-none");
        document.getElementById("lblAgregarNota").classList.remove("d-none");
    }



    //crear notas===========================================================================
function renderNotas(oportunidadId) {
    const notasContainer = document.getElementById("contenidoNotas");
    notasContainer.innerHTML = "";

    if (!oportunidadesData[oportunidadId]) {
        console.error(`No se encontró la oportunidad con ID: ${oportunidadId}`);
        return; 
    }

    if (!oportunidadesData[oportunidadId].notas) {
        console.error(`No se encontraron notas para la oportunidad con ID: ${oportunidadId}`);
        return; 
    }

    oportunidadesData[oportunidadId].notas.forEach((nota) => {
        const notaElement = document.createElement("div");
        notaElement.classList.add("Nota", "my-3", "d-flex");
        notaElement.setAttribute("data-id", nota.id);

        const contenidoNota = `
        <div class="flex-grow-1 p-2">
            <div class="DetalleNota">${nota.descripcion}</div>
            <div class="subTarea">Ejemplo fecha</div>
            <div class="subTarea">Ejemplo encargado</div>
        </div>
        <div class="d-flex flex-column align-items-start me-5 p-2">
            <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" onclick="cargareditarNota('${oportunidadId}', '${nota.id}')">Editar</button>
            <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaNota('${oportunidadId}', '${nota.id}')">Eliminar</button>  
        </div>
    `;
        notaElement.innerHTML = contenidoNota;
        notasContainer.appendChild(notaElement);
    });
}

let idcontnotas = 0;
function guardarNota() {
    const descripcionNota = document.getElementById("notaDescripcion").value.trim();
    const oportunidadId = document.getElementById('oportunidadModal').getAttribute("data-id");

    if (descripcionNota !== "") {
        const notaId = `nota_${idcontnotas++}`;
        oportunidadesData[oportunidadId].notas.push({ id: notaId, descripcion: descripcionNota });

        document.getElementById("notaDescripcion").value = "";
        renderNotas(oportunidadId);
        ocultarFormularioNota();
    } else {
        alert("Por favor, completa todos los campos antes de guardar la nota.");
    }
}

let notaIdActual = null; // Variable para almacenar el ID de la nota que se está editando

function cargareditarNota(oportunidadId, notaId) {
    mostrarFormularioEditNota(); 

    
    const notaData = oportunidadesData[oportunidadId].notas.find(nota => nota.id === notaId);
    if (!notaData) {
        alert("No se encontró la nota para editar.");
        return;
    }

    notaIdActual = notaId;

    document.getElementById("EditnotaDescripcion").value = notaData.descripcion; 
}

function editarnota() {
    if (!notaIdActual) {
        alert("No se puede editar la nota. ID no válido.");
        return;
    }

    const oportunidadId = document.getElementById('oportunidadModal').getAttribute("data-id");
    const nuevaDescripcion = document.getElementById("EditnotaDescripcion").value.trim(); 

    if (nuevaDescripcion === "") {
        alert("Por favor, completa el campo de descripción antes de guardar.");
        return;
    }

    const notaIndex = oportunidadesData[oportunidadId].notas.findIndex(nota => nota.id === notaIdActual);
    if (notaIndex !== -1) {
        oportunidadesData[oportunidadId].notas[notaIndex].descripcion = nuevaDescripcion;
    }

    renderNotas(oportunidadId);

    ocultarFormularioEditNota();

    notaIdActual = null;
}

// Eliminar notas ============================================================================================
function eliminarNota() {
    const btnEliminarNota = document.getElementById("btnEliminarNota");
    const oportunidadId = btnEliminarNota.getAttribute("data-oportunidad-id");
    const notaId = btnEliminarNota.getAttribute("data-nota-id");

    if (oportunidadId && notaId) {
        oportunidadesData[oportunidadId].notas = oportunidadesData[oportunidadId].notas.filter((nota) => nota.id !== notaId);
        renderNotas(oportunidadId);
        cerrarVentanaNota();
    }
}
// funciones de tareas =========================================================
    
    function mostrarFormularioTarea() {
        document.getElementById('crearTareaBtn').classList.add('d-none');
        document.getElementById('contenidoTareas').classList.add('d-none');
        document.getElementById('formularioTarea').classList.remove('d-none');
    }

    function ocultarFormularioTarea() {
        document.getElementById('crearTareaBtn').classList.remove('d-none');
        document.getElementById('formularioTarea').classList.add('d-none');
        document.getElementById('contenidoTareas').classList.remove('d-none');
    }

    function mostrarFormularioEditTarea() {
        document.getElementById('crearTareaBtn').classList.add('d-none');
        document.getElementById('contenidoTareas').classList.add('d-none');
        document.getElementById('lblAgregarTarea').classList.add('d-none');
        document.getElementById('formularioEditarTarea').classList.remove('d-none');
    }

    function ocultarFormularioEditTarea() {
        document.getElementById('crearTareaBtn').classList.remove('d-none');
        document.getElementById('contenidoTareas').classList.remove('d-none');
        document.getElementById('lblAgregarTarea').classList.remove('d-none');
        document.getElementById('formularioEditarTarea').classList.add('d-none');
    }

    function cerrarVentanaTarea() {
        document.getElementById('crearTareaBtn').classList.remove('d-none');
        document.getElementById('contenidoTareas').classList.remove('d-none');
        document.getElementById("ventanaConfirmacionTarea").classList.add("d-none");
        document.getElementById("lblAgregarTarea").classList.remove("d-none");
    }

function abrirVentanaTarea(oportunidadId, tareaId) {
    document.getElementById('crearTareaBtn').classList.add('d-none');
    document.getElementById('contenidoTareas').classList.add('d-none');
    document.getElementById("ventanaConfirmacionTarea").classList.remove("d-none");
    document.getElementById("lblAgregarTarea").classList.add("d-none");

    const btnEliminarTarea = document.getElementById("btnEliminarTarea");
    btnEliminarTarea.setAttribute("data-oportunidad-id", oportunidadId);
    btnEliminarTarea.setAttribute("data-tarea-id", tareaId);
}

// Crear tareas ===========================================================================
let tareaIdCounter = 0;

function renderTareas(oportunidadId) {
    const tareasContainer = document.getElementById("contenidoTareas");
    tareasContainer.innerHTML = "";

    // Verifica si la oportunidad existe
    if (!oportunidadesData[oportunidadId]) {
        console.error(`No se encontró la oportunidad con ID: ${oportunidadId}`);
        return; // Salir de la función si no existe
    }

    // Verifica si hay tareas
    if (!oportunidadesData[oportunidadId].tareas) {
        console.error(`No se encontraron tareas para la oportunidad con ID: ${oportunidadId}`);
        return; // Salir de la función si no hay tareas
    }

    // Renderiza las tareas
    oportunidadesData[oportunidadId].tareas.forEach((tarea) => {
        const tareaElement = document.createElement("div");
        tareaElement.classList.add("Tarea", "my-3", "d-flex");
        tareaElement.setAttribute("data-id", tarea.id);

        const contenidoTarea = `
            <div class="flex-grow-1 p-2">
                <div class="DetalleTarea">${tarea.titulo}</div>
                <div class="subTarea">${tarea.descripcion}</div>
                <div class="subTarea">${tarea.fecha}</div>
            </div>
            <div class="d-flex flex-column align-items-start me-5 p-2">
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" onclick="cargareditarTareas('${oportunidadId}', '${tarea.id}')">Editar</button>
                <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaTarea('${oportunidadId}', '${tarea.id}')">Eliminar</button>
            </div>
        `;
        tareaElement.innerHTML = contenidoTarea;
        tareasContainer.appendChild(tareaElement);
    });
}


function guardarTarea() {
    const descripcionTarea = document.getElementById("tareaDescripcion").value.trim();
    const tituloTarea = document.getElementById("tareaTitulo").value.trim();
    const fechaTarea = document.getElementById("tareasFecha").value.trim();
    document.getElementById("tareasEncargado").value.trim();
    const oportunidadId = document.getElementById('oportunidadModal').getAttribute("data-id");

    if (descripcionTarea !== "" && tituloTarea !== "" && fechaTarea !== "") {
        const tareaId = `tarea_${tareaIdCounter++}`;

        oportunidadesData[oportunidadId].tareas.push({ id: tareaId, titulo: tituloTarea, descripcion: descripcionTarea, fecha: fechaTarea });

        document.getElementById("tareaDescripcion").value = "";
        document.getElementById("tareaTitulo").value = "";
        document.getElementById("tareasFecha").value = "";
        document.getElementById("tareasEncargado").value = "";

        renderTareas(oportunidadId);
        ocultarFormularioTarea();
    } else {
        alert("Por favor, completa todos los campos antes de guardar la tarea.");
    }
}

let tareaIdActual = null; // Variable para almacenar el ID de la tarea que se está editando
// editar tareas ========================================================================

function cargareditarTareas(oportunidadId, tareaId) {
    mostrarFormularioEditTarea(); 

    const tareaData = oportunidadesData[oportunidadId].tareas.find(tarea => tarea.id === tareaId);
    if (!tareaData) {
        alert("No se encontró la tarea para editar.");
        return;
    }

    tareaIdActual = tareaId;

    document.getElementById("tareaTituloEditar").value = tareaData.titulo; 
    document.getElementById("tareaDescripcionEditar").value = tareaData.descripcion; 
    document.getElementById("tareasFechaEditar").value = tareaData.fecha; 
    
}

function editartarea() {
    if (!tareaIdActual) {
        alert("No se puede editar la tarea. ID no válido.");
        return;
    }

    const oportunidadId = document.getElementById('oportunidadModal').getAttribute("data-id");
    const nuevoTitulo = document.getElementById("tareaTituloEditar").value.trim(); 
    const nuevaDescripcion = document.getElementById("tareaDescripcionEditar").value.trim(); 
    const nuevaFecha = document.getElementById("tareasFechaEditar").value.trim(); 
    if (nuevoTitulo === "" || nuevaDescripcion === "" || nuevaFecha === "") {
        alert("Por favor, completa todos los campos antes de guardar.");
        return;
    }

    const tareaIndex = oportunidadesData[oportunidadId].tareas.findIndex(tarea => tarea.id === tareaIdActual);
    if (tareaIndex !== -1) {
        oportunidadesData[oportunidadId].tareas[tareaIndex].titulo = nuevoTitulo;
        oportunidadesData[oportunidadId].tareas[tareaIndex].descripcion = nuevaDescripcion;
        oportunidadesData[oportunidadId].tareas[tareaIndex].fecha = nuevaFecha;
    }

    renderTareas(oportunidadId);

    ocultarFormularioEditTarea();

    tareaIdActual = null;
}

// Eliminar tareas ========================================================================
function eliminarTarea() {
    const btnEliminarTarea = document.getElementById("btnEliminarTarea");
    const oportunidadId = btnEliminarTarea.getAttribute("data-oportunidad-id");
    const tareaId = btnEliminarTarea.getAttribute("data-tarea-id");

    if (oportunidadId && tareaId) {
        oportunidadesData[oportunidadId].tareas = oportunidadesData[oportunidadId].tareas.filter((tarea) => tarea.id !== tareaId);
        renderTareas(oportunidadId);
        cerrarVentanaTarea();
    }
}

    //selector de fechas en tareas=============================================
    document.addEventListener('DOMContentLoaded', () => {
        const tareasFechaElement = document.getElementById('tareasFecha');

        if (tareasFechaElement) {
            flatpickr(tareasFechaElement, {
                enableTime: true,
                dateFormat: "Y-m-d\\TH:i",
                time_24hr: true,
                onChange: function (selectedDates, dateStr, instance) {
                    const selectedDate = new Date(dateStr);
                    const today = new Date();
                    today.setHours(0, 0, 0, 0); 

                    if (selectedDate < today) {
                        alert("Por favor, seleccione una fecha válida que no sea anterior a hoy.");
                        instance.clear(); 
                    }
                }
            });
        }
    });


document.addEventListener('DOMContentLoaded', () => {
    const fechaCitaElement = document.getElementById('tareasFechaEditar');

    if (fechaCitaElement) {
        flatpickr(fechaCitaElement, {
            enableTime: true,
            dateFormat: "Y-m-d\\TH:i",
            time_24hr: true,
            onChange: function (selectedDates, dateStr, instance) {
                const selectedDate = new Date(dateStr);
                const today = new Date();
                today.setHours(0, 0, 0, 0);

                if (selectedDate < today) {
                    alert("Por favor, seleccione una fecha válida que no sea anterior a hoy.");
                    instance.clear();

                }
            }
        });
    }
});

    //selector de fechas en citas=============================================

    document.addEventListener('DOMContentLoaded', () => {
        const fechaCitaElement = document.getElementById('fechaCita');

        if (fechaCitaElement) {
            flatpickr(fechaCitaElement, {
                enableTime: true,
                dateFormat: "Y-m-d\\TH:i",
                time_24hr: true,
                onChange: function (selectedDates, dateStr, instance) {
                    const selectedDate = new Date(dateStr);
                    const today = new Date();
                    today.setHours(0, 0, 0, 0); 

                    if (selectedDate < today) {
                        alert("Por favor, seleccione una fecha válida que no sea anterior a hoy.");
                        instance.clear(); 

                    }
                }
            });
        }
    });

