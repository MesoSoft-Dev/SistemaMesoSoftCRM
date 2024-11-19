function validarFormulario2() {
    const nombres = document.getElementById("txtNombres").value;
    const apellidos = document.getElementById("txtApellidos").value;
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;
    const fechaNacimiento = document.getElementById("txtFechaNacimiento").value;
    const origen = document.getElementById("txtOrigen").value;

    if (nombres.trim() === "") {
        console.log("TEST VALIDACION 11");
        return false;
    }

    if (apellidos.trim() === "") {
        return false;
    }

    if (correo.trim() === "") {
        return false;
    }

    if (telefono.trim() === "") {
        return false;
    }

    if (fechaNacimiento.trim() === "") {
        return false;
    }

    if (origen.trim() === "") {
        return false;
    }
    return true;
    console.log("TEST VALIDACION");
}


let contactoCounter = 0;

function crearContacto() {
    console.log("TEST INICIO");

    if (validarFormulario2() == false) {
        return;
    }

    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const nombreYapellido = `${nombre} ${apellido}`.trim();
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;

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
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#ModalAdvertencia">Eliminar</a></li>
            </ul>
        </div>

        <div class="d-flex flex-grow-1 justify-content-between align-items-center ps-3">
            <p class="col-2 mb-0">${nombreYapellido}</p>
            <p class="col-2 mb-0">${telefono}</p>
            <p class="col-3 mb-0">${correo}</p>
            <p class="col-2 mb-0">${new Date().toLocaleDateString()}</p>
            <p class="col-2 mb-0">${new Date(2024, 11, 19).toLocaleDateString()}</p>
        </div>
    `;

    document.getElementById("contenidoContactos").appendChild(contactoElement);
}



