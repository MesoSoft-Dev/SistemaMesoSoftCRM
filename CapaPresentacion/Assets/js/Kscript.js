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

// Función para crear un nueva oportunidad
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("todo_submit").addEventListener("click", createTodo);
});


function createTodo() {
    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    if (input_val !== "") {
        const todo_button = document.createElement("button");
        todo_button.textContent = input_val;
        todo_button.classList.add("todo", "border-0");
        todo_button.setAttribute("draggable", "true");

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

// Despliege del modal de edicion
function openModal(event) {
    event.preventDefault(); 

    const todoDetails = event.currentTarget.textContent; 
 //   document.getElementById("oportunidadEdit").textContent = todoDetails;

 
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




//crear notas===========================================================================
let notaIdCounter = 0;

function guardarNota() {
    const descripcionNota = document.getElementById("notaDescripcion").value.trim();

    if (descripcionNota !== "") {
        const nuevaNota = document.createElement("div");
        nuevaNota.classList.add("Nota", "my-3", "d-flex");
        nuevaNota.setAttribute("data-id", notaIdCounter);

        const contenidoNota = `
            <div class="flex-grow-1 p-2">
                <div class="DetalleNota">${descripcionNota}</div>
                <div class="subNota">Ejemplo de texto 1</div>
                <div class="subNota">Ejemplo de texto 2</div>
            </div>
            <div class="d-flex flex-column align-items-start me-5 p-2">
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" id="btnEditNota" onclick="mostrarFormularioEditNota(); return false;">Editar</button>
                <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentana(${notaIdCounter})">Eliminar</button>
            </div>
        `;
        nuevaNota.innerHTML = contenidoNota;

        document.getElementById("contenidoNotas").appendChild(nuevaNota);

        document.getElementById("notaDescripcion").value = "";

        ocultarFormularioNota();

        notaIdCounter++;
    }
    else {
        alert("Por favor, completa todos los campos antes de guardar la tarea.")
    }
}

function abrirVentana(notaId) {
    document.getElementById('crearNotaBtn').classList.add('d-none');
    document.getElementById('contenidoNotas').classList.add('d-none');
    document.getElementById("ventanaConfirmacion").classList.remove("d-none");
    document.getElementById("lblAgregarNota").classList.add("d-none"); 
    document.getElementById("btnEliminarNota").setAttribute("data-id", notaId);
}

function cerrarVentana() {
    document.getElementById('crearNotaBtn').classList.remove('d-none');
    document.getElementById('contenidoNotas').classList.remove('d-none');
    document.getElementById("ventanaConfirmacion").classList.add("d-none");
    document.getElementById("lblAgregarNota").classList.remove("d-none"); 
}

function eliminarNota() {
    const notaId = document.getElementById("btnEliminarNota").getAttribute("data-id");
    const nota = document.querySelector(`.Nota[data-id='${notaId}']`);
    if (nota) {
        nota.remove();
    }
    cerrarVentana();
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

// Crear tareas ===========================================================================
function guardarTarea() {
    const descripcionTarea = document.getElementById("tareaDescripcion").value.trim();
    const tituloTarea = document.getElementById("tareaTitulo").value.trim();
    const nombreEncargado = document.getElementById("tareasEncargado").value.trim();
    const fechaTarea = document.getElementById("tareasFecha").value.trim();

    if (descripcionTarea !== "" && tituloTarea !== "" && nombreEncargado !== "" && fechaTarea !== "") {
        const nuevaTarea = document.createElement("div");
        nuevaTarea.classList.add("Tarea", "my-3", "d-flex");
        nuevaTarea.setAttribute("data-id", tareaIdCounter);

        const contenidoTarea = `
            <div class="flex-grow-1 p-2">
                <div class="DetalleTarea">${tituloTarea}</div>
                <div class="subTarea">${descripcionTarea}</div>
                <div class="subTarea">${fechaTarea}</div>
            </div>
            <div class="d-flex flex-column align-items-start me-5 p-2">
                <button type="button" class="btn fondo3 mb-1 fw-bold w-100 rounded-5 py-1" onclick="mostrarFormularioEditTarea(); return false;">Editar</button>
                <button class="btn fondo3 fw-bold w-100 rounded-5 py-1" type="button" onclick="abrirVentanaTarea(${tareaIdCounter})">Eliminar</button>
            </div>
        `;
        nuevaTarea.innerHTML = contenidoTarea;

        document.getElementById("contenidoTareas").appendChild(nuevaTarea);

        document.getElementById("tareaDescripcion").value = "";
        document.getElementById("tareaTitulo").value = "";
        document.getElementById("tareasEncargado").value = "";
        document.getElementById("tareasFecha").value = "";
        ocultarFormularioTarea();

        tareaIdCounter++;
    } else {
        alert("Por favor, completa todos los campos antes de guardar la tarea.");
    }
}

// Ventana de confirmación de tareas ========================================================================
function abrirVentanaTarea(tareaId) {
    document.getElementById('crearTareaBtn').classList.add('d-none');
    document.getElementById('contenidoTareas').classList.add('d-none');
    document.getElementById("ventanaConfirmacionTarea").classList.remove("d-none");
    document.getElementById("lblAgregarTarea").classList.add("d-none"); 
    document.getElementById("btnEliminarTarea").setAttribute("data-id", tareaId);
}

function cerrarVentanaTarea() {
    document.getElementById('crearTareaBtn').classList.remove('d-none');
    document.getElementById('contenidoTareas').classList.remove('d-none');
    document.getElementById("ventanaConfirmacionTarea").classList.add("d-none");
    document.getElementById("lblAgregarTarea").classList.remove("d-none"); 
}

function eliminarTarea() {
    const tareaId = document.getElementById("btnEliminarTarea").getAttribute("data-id");
    const tarea = document.querySelector(`.Tarea[data-id='${tareaId}']`);
    if (tarea) {
        tarea.remove();
    }
    cerrarVentanaTarea();
}