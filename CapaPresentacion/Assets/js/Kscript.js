
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

function dragDrop() {
    this.style.border = "none";
    this.appendChild(draggableTodo);
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

        todo_div.addEventListener("dragstart", dragStart);
        todo_div.addEventListener("dragend", dragEnd);

        document.getElementById("txtNombres").value = "";
        document.getElementById("txtApellidos").value = "";

        const modalElement = document.getElementById('todo_form');
        const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
        modalInstance.hide();
    }
}
