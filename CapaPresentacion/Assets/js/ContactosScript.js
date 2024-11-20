document.addEventListener("DOMContentLoaded", function () {
    cargarContactosDesdeArchivo(); // Llama a la función al cargar la página
});

function validarFormulario2() {
    const nombres = document.getElementById("txtNombres").value;
    const apellidos = document.getElementById("txtApellidos").value;
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;
    const fechaNacimiento = document.getElementById("txtFechaNacimiento").value;
    const origen = document.getElementById("txtOrigen").value;

    if (nombres.trim() === "") {
        alert("Por favor, complete el campo de nombres.");
        return false;
    }

    if (apellidos.trim() === "") {
        alert("Por favor, complete el campo de apellidos.");
        return false;
    }

    if (correo.trim() === "") {
        alert("Por favor, complete el campo de correo.");
        return false;
    }

    if (telefono.trim() === "") {
        alert("Por favor, complete el campo de teléfono.");
        return false;
    }

    if (fechaNacimiento.trim() === "") {
        alert("Por favor, complete el campo de fecha de nacimiento.");
        return false;
    }

    if (origen.trim() === "") {
        alert("Por favor, complete el campo de origen de contacto.");
        return false;
    }
    return true;
}


let contactoCounter = 0;

async function cargarContactosDesdeArchivo() {
    try {
        const response = await fetch("Assets/js/contactos.json"); // Asegúrate de que la ruta sea correcta
        if (!response.ok) {
            throw new Error('Error al cargar el archivo JSON');
        }
        const contactos = await response.json();
        contactos.forEach(contacto => {
            despliegueContacto(contacto);
        });
    } catch (error) {
        console.error('Error:', error);
    }
}

function despliegueContacto(contacto) {
    const contactoId = `contacto-${contactoCounter++}`;

    const contactoElement = document.createElement("div");
    contactoElement.classList.add("Contacto", "w-100", "d-flex", "align-items-center", "pb-2", "pt-1", "ps-2", "pe-5", "mb-3");
    contactoElement.id = contactoId;

    contactoElement.innerHTML = `
        <div class="dropdown">
            <button class="btn m-0 p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-three-dots-vertical"></i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                 <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#EditarContactoform">Editar</a></li>
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#ModalAdvertencia" onclick="cargarEliminar(this)">Eliminar</a></li>
            </ul>
        </div>

        <div class="d-flex flex-grow-1 justify-content-between align-items-center ps-3">
            <p class="col-2 mb-0">${contacto.nombre} ${contacto.apellido}</p>
            <p class="col-2 mb-0">${contacto.telefono}</p>
            <p class="col-3 mb-0">${contacto.correo}</p>
            <p class="col-2 mb-0">${contacto.fechaCreacion}</p>
            <p class="col-2 mb-0">${contacto.fechaOtro}</p>
        </div>
    `;

    document.getElementById("contenidoContactos").appendChild(contactoElement);
}

function crearContacto() {
   

    if (validarFormulario2() == false) {
        return;
    }

    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const nombreYapellido = `${nombre} ${apellido}`.trim();
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;

    const contacto = {
        nombre: nombre,
        apellido: apellido,
        correo: correo,
        telefono: telefono,
        fechaCreacion: new Date().toLocaleDateString(),
        fechaOtro: new Date(2024, 11, 19).toLocaleDateString()
    };
    despliegueContacto(contacto);
}

function cargarEliminar(elemento) {
    const contactoElement = elemento.closest('.Contacto');
    document.getElementById("confirmarEliminarBtn").onclick = function () {
        eliminarContacto(contactoElement);
    };
}

function eliminarContacto(contactoElement) {
    contactoElement.remove();
}
