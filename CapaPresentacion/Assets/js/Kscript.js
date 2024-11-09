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

    // Obtener el color de fondo del h2 dentro de este contenedor
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

// Funciónes del modal de edicion
function openModal(event) {
    event.preventDefault(); 

    const todoDetails = event.currentTarget.textContent; 
    document.getElementById("oportunidadEdit").textContent = todoDetails;

 
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