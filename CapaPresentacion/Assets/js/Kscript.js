const todos = document.querySelectorAll(".todo");
const all_status = document.querySelectorAll(".status");
let draggableTodo = null;

/* Evento de arrastre */
todos.forEach((todo) => {
    todo.addEventListener("dragstart", dragStart);
    todo.addEventListener("dragend", dragEnd);
});

function dragStart() {
    draggableTodo = this;
    setTimeout(() => {
        this.style.display = "none";
    }, 0);
    console.log("dragStart");
}

function dragEnd() {
    draggableTodo = null;
    setTimeout(() => {
        this.style.display = "block";
    }, 0);
    console.log("dragEnd");
}

/* Eventos de las columnas para arrastrar y soltar */
all_status.forEach((status) => {
    status.addEventListener("dragover", dragOver);
    status.addEventListener("dragenter", dragEnter);
    status.addEventListener("dragleave", dragLeave);
    status.addEventListener("drop", dragDrop);
});

function dragOver(e) {
    e.preventDefault();
}

function dragEnter(e) {
    e.preventDefault(); // Prevenir comportamiento predeterminado
    // No modificar el borde en el arrastre
}

function dragLeave(e) {
    e.preventDefault(); // Prevenir comportamiento predeterminado
    // No modificar el borde en el arrastre
}

function dragDrop() {
    this.appendChild(draggableTodo);
    console.log("dropped");
}

/* Modal */
const btns = document.querySelectorAll("[data-target-modal]");
const close_modals = document.querySelectorAll(".close-modal");
const overlay = document.getElementById("overlay");

btns.forEach((btn) => {
    btn.addEventListener("click", () => {
        document.querySelector(btn.dataset.targetModal).classList.add("active");
        overlay.classList.add("active");
    });
});

close_modals.forEach((btn) => {
    btn.addEventListener("click", () => {
        const modal = btn.closest(".modal");
        modal.classList.remove("active");
        overlay.classList.remove("active");
    });
});

window.onclick = (event) => {
    if (event.target == overlay) {
        const modals = document.querySelectorAll(".modal");
        modals.forEach((modal) => modal.classList.remove("active"));
        overlay.classList.remove("active");
    }
};

/* Crear nueva tarea */
const todo_submit = document.getElementById("todo_submit");

todo_submit.addEventListener("click", createTodo);

function createTodo() {
    const input_val = document.getElementById("todo_input").value;

    if (input_val.trim() !== "") {
        const todo_div = document.createElement("div");
        const txt = document.createTextNode(input_val);

        todo_div.appendChild(txt);
        todo_div.classList.add("todo");
        todo_div.setAttribute("draggable", "true");

        document.getElementById("no_status").appendChild(todo_div);

        todo_div.addEventListener("dragstart", dragStart);
        todo_div.addEventListener("dragend", dragEnd);

        document.getElementById("todo_input").value = "";

        const modalElement = document.getElementById('todo_form');
        const modalInstance = bootstrap.Modal.getOrCreateInstance(modalElement);
        modalInstance.hide();
    }
}
