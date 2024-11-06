const todos = document.querySelectorAll(".todo");
const all_status = document.querySelectorAll(".status");
let draggableTodo = null;

todos.forEach((todo) => {
    todo.addEventListener("dragstart", dragStart);
    todo.addEventListener("dragend", dragEnd);
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

// Cambia el fondo del "todo" al color de fondo del h2 del contenedor "status"
function dragDrop() {
    this.appendChild(draggableTodo);

    // Obtener el color de fondo del h2 dentro de este contenedor
    const headerColor = window.getComputedStyle(this.querySelector("h2")).backgroundColor;
    draggableTodo.style.backgroundColor = headerColor;
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("todo_submit").addEventListener("click", createTodo);
});

function createTodo() {
    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    if (input_val !== "") {
        const todo_div = document.createElement("div");
        todo_div.textContent = input_val;
        todo_div.classList.add("todo");
        todo_div.setAttribute("draggable", "true");

        document.getElementById("no_status").appendChild(todo_div);

        // Asignar los eventos de arrastre al nuevo "todo"
        todo_div.addEventListener("dragstart", dragStart);
        todo_div.addEventListener("dragend", dragEnd);

        // Limpiar los campos de entrada
        document.getElementById("txtNombres").value = "";
        document.getElementById("txtApellidos").value = "";

        // Cerrar el modal después de agregar la oportunidad
        const modalElement = document.getElementById('todo_form');
        const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
        modalInstance.hide();
    }
}
