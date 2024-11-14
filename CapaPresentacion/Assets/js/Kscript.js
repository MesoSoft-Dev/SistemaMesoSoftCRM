//funciones de drag and drop============================================
const todos = document.querySelectorAll(".todo");
const all_status = document.querySelectorAll(".status");
let draggableTodo = null;

todos.forEach((todo) => {
    todo.addEventListener("dragstart", dragStart);
    todo.addEventListener("dragend", dragEnd);
    todo.addEventListener("click", openModal); 
});

function dragStart() {
    draggableTodo = this;
    setTimeout(() => {
        this.style.display = "none";
    }, 0);
}

function dragEnd() {
    draggableTodo = null;
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
    this.appendChild(draggableTodo);

    const headerColor = window.getComputedStyle(this.querySelector("h2")).backgroundColor;
    draggableTodo.style.backgroundColor = headerColor;
}
 //creacion de oportunidades====================================================================

const todosData = {}; 

function generateUniqueId() {
    return `todo_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`;
}
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("todo_submit").addEventListener("click", createTodo);
});



function createOportunidad() {
    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    if (input_val !== "") {
        const todoId = generateUniqueId(); 
        todosData[todoId] = { notas: [], tareas: [] }; 

        const todo_button = document.createElement("button");
        todo_button.textContent = input_val;
        todo_button.classList.add("todo", "border-0");
        todo_button.setAttribute("draggable", "true");
        todo_button.setAttribute("data-id", todoId); 

        document.getElementById("no_status").appendChild(todo_button);

        todo_button.addEventListener("dragstart", dragStart);
        todo_button.addEventListener("dragend", dragEnd);
        todo_button.addEventListener("click", openModal); 
        document.getElementById("txtNombres").value = "";
        document.getElementById("txtApellidos").value = "";

        const modalElement = document.getElementById('todo_form');
        const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
        modalInstance.hide();
    }
}

// Despliege del modal de edicion, citas, tareas y notas.
function openModal(event) {
    event.preventDefault();
    const todoId = event.currentTarget.getAttribute("data-id"); 
    document.getElementById('todoModal').setAttribute("data-id", todoId); 

    renderNotas(todoId); 
    renderTareas(todoId); 

    const modalElement = document.getElementById('todoModal');
    const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
    modalInstance.show();
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
    document.getElementById('lblAgregarNota').classList.add('d-none'); lblAgregarNota
    document.getElementById('formularioEditarNota').classList.remove('d-none');
}

function ocultarFormularioEditNota() {

    document.getElementById('crearNotaBtn').classList.remove('d-none');
    document.getElementById('contenidoNotas').classList.remove('d-none');
   document.getElementById('lblAgregarNota').classList.remove('d-none');
    document.getElementById('formularioEditarNota').classList.add('d-none');

}

function abrirVentanaNota(todoId, notaId) {
    console.log("TEST INICION")
    document.getElementById('crearNotaBtn').classList.add('d-none');
    document.getElementById('contenidoNotas').classList.add('d-none');
    document.getElementById("ventanaConfirmacion").classList.remove("d-none");
    document.getElementById("lblAgregarNota").classList.add("d-none");

    const btnEliminarNota = document.getElementById("btnEliminarNota");
    btnEliminarNota.setAttribute("data-todo-id", todoId);
    btnEliminarNota.setAttribute("data-nota-id", notaId);
    console.log("TEST FINAL")

}

function cerrarVentanaNota() {
    document.getElementById('crearNotaBtn').classList.remove('d-none');
    document.getElementById('contenidoNotas').classList.remove('d-none');
    document.getElementById("ventanaConfirmacion").classList.add("d-none");
    document.getElementById("lblAgregarNota").classList.remove("d-none");
}



//crear notas===========================================================================
let notaIdCounter = 0;

function renderNotas(todoId) {
    const notasContainer = document.getElementById("contenidoNotas");
    notasContainer.innerHTML = "";

    todosData[todoId].notas.forEach((nota) => {
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
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" onclick="mostrarFormularioEditNota()">Editar</button>
                <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaNota('${todoId}', '${nota.id}')">Eliminar</button>  
            </div>
        `;
        notaElement.innerHTML = contenidoNota;
        notasContainer.appendChild(notaElement);
    });
}
function guardarNota() {
    const descripcionNota = document.getElementById("notaDescripcion").value.trim();
    const todoId = document.getElementById('todoModal').getAttribute("data-id"); 

    if (descripcionNota !== "") {
        const notaId = generateUniqueId();
        todosData[todoId].notas.push({ id: notaId, descripcion: descripcionNota });

        document.getElementById("notaDescripcion").value = "";
        renderNotas(todoId); 
        ocultarFormularioNota();
    } else {
        alert("Por favor, completa todos los campos antes de guardar la nota.");
    }
}
//Eliminar notas============================================================================================
function eliminarNota() {
    console.log("TEST INICION")

    const btnEliminarNota = document.getElementById("btnEliminarNota");
    const todoId = btnEliminarNota.getAttribute("data-todo-id");
    const notaId = btnEliminarNota.getAttribute("data-nota-id");

    if (todoId && notaId) {
        todosData[todoId].notas = todosData[todoId].notas.filter((nota) => nota.id !== notaId);
        renderNotas(todoId); 
        cerrarVentanaNota();
    } else {
        console.error("No se encontraron los IDs necesarios para eliminar la nota.");
    }
}







// funciones de tareas =========================================================
let tareaIdCounter = 0;

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

function abrirVentanaTarea(todoId, tareaId) {
    document.getElementById('crearTareaBtn').classList.add('d-none');
    document.getElementById('contenidoTareas').classList.add('d-none');
    document.getElementById("ventanaConfirmacionTarea").classList.remove("d-none");
    document.getElementById("lblAgregarTarea").classList.add("d-none");

    const btnEliminarTarea = document.getElementById("btnEliminarTarea");
    btnEliminarTarea.setAttribute("data-todo-id", todoId);
    btnEliminarTarea.setAttribute("data-tarea-id", tareaId);
}

// Crear tareas ===========================================================================
function renderTareas(todoId) {
    const tareasContainer = document.getElementById("contenidoTareas");
    tareasContainer.innerHTML = ""; 

    todosData[todoId].tareas.forEach((tarea) => {
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
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" onclick="mostrarFormularioEditTarea()">Editar</button>
        <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaTarea('${todoId}', '${tarea.id}')">Eliminar</button>
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
    const todoId = document.getElementById('todoModal').getAttribute("data-id"); 

    if (descripcionTarea !== "" && tituloTarea !== "" && fechaTarea !== "") {
        const tareaId = generateUniqueId();
        todosData[todoId].tareas.push({ id: tareaId, titulo: tituloTarea, descripcion: descripcionTarea, fecha: fechaTarea });

        document.getElementById("tareaDescripcion").value = "";
        document.getElementById("tareaTitulo").value = "";
        document.getElementById("tareasFecha").value = "";
        document.getElementById("tareasEncargado").value = "";

        renderTareas(todoId); 
        ocultarFormularioTarea();
    } else {
        alert("Por favor, completa todos los campos antes de guardar la tarea.");
    }
}

// Eliminar tareas ========================================================================


function eliminarTarea() {
    const btnEliminarTarea = document.getElementById("btnEliminarTarea");
    const todoId = btnEliminarTarea.getAttribute("data-todo-id");
    const tareaId = btnEliminarTarea.getAttribute("data-tarea-id");

    if (todoId && tareaId) {
        todosData[todoId].tareas = todosData[todoId].tareas.filter((tarea) => tarea.id !== tareaId);
        renderTareas(todoId); 
        cerrarVentanaTarea();
    } else {
        console.error("No se encontraron los IDs necesarios para eliminar la tarea.");
    }
}

//selector de fechas en tareas=============================================
document.addEventListener('DOMContentLoaded', () => {
    const tareasFechaElement = document.getElementById('tareasFecha');

    if (tareasFechaElement) {
        flatpickr(tareasFechaElement, {
            enableTime: true, 
            dateFormat: "Y-m-d\\TH:i", 
            time_24hr: true 
        });
        
    }
});
//selector de fechas en citas=============================================

document.addEventListener('DOMContentLoaded', () => {
    const tareasFechaElement = document.getElementById('fechaCita');

    
    if (tareasFechaElement) {
        
        flatpickr(tareasFechaElement, {
            enableTime: true,
            dateFormat: "Y-m-d\\TH:i", 
            time_24hr: true 
        });
        
    } 
});


