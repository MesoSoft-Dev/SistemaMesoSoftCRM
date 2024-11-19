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


function crearContacto() {
    console.log("TEST INICIO");
    // if (validarFormulario2() == false) {
    //      return;
    //  }

    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    const contactoElement = document.createElement("div");
    contactoElement.classList.add("Contacto", "d-flex", "justify-content-between", "align-items-center", "px-4", "mb-3");

    // Asignar el contenido al div
    contactoElement.innerHTML = `
        <p>${input_val}</p>
    `;

    // Agregar el div al contenedor de contactos
    document.getElementById("contenidoContactos").appendChild(contactoElement);
}
