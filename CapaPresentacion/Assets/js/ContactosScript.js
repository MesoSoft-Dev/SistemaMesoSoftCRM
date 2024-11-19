function validarFormulario2() {
    const nombres = document.getElementById("txtNombres").value;
    const apellidos = document.getElementById("txtApellidos").value;
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;
    const fechaNacimiento = document.getElementById("txtFechaNacimiento").value;
    const genero = document.getElementById("ddlSexo").value;
    const email = document.getElementById("ddlComEmail").value;
    const whatsapp = document.getElementById("dllComWhatsapp").value;
    const tipoContacto = document.getElementById("ddlTipoContacto").value;
    const origen = document.getElementById("txtOrigen").value;

    if (nombres.trim() === "") {
        alert("Por favor, ingrese los nombres.");
        return false;
    }

    if (apellidos.trim() === "") {
        alert("Por favor, ingrese los apellidos.");
        return false;
    }

    if (correo.trim() === "") {
        alert("Por favor, ingrese el correo electrónico.");
        return false;
    }

    if (telefono.trim() === "") {
        alert("Por favor, ingrese el teléfono.");
        return false;
    }

    if (fechaNacimiento.trim() === "") {
        alert("Por favor, ingrese la fecha de nacimiento.");
        return false;
    }

    if (genero === "") {
        alert("Por favor, seleccione el género.");
        return false;
    }

    if (email === "") {
        alert("Por favor, seleccione si desea recibir comunicaciones por email.");
        return false;
    }

    if (whatsapp === "") {
        alert("Por favor, seleccione si desea recibir comunicaciones por WhatsApp.");
        return false;
    }

    if (tipoContacto === "") {
        alert("Por favor, seleccione el tipo de contacto.");
        return false;
    }

    if (origen.trim() === "") {
        alert("Por favor, ingrese el origen.");
        return false;
    }
    return true;
}


function crearContacto() {
    if (validarFormulario2() == false) {
        return;
    }

    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    const contactoElement = document.createElement("div");
    contactoElement.classList.add("contacto", "d-flex", "justify-content-between", "align-items-center", "px-4", "border-bottom");

    // Asignar el contenido al div
    contactoElement.innerHTML = `
        <p>${input_val}</p>
    `;

    // Agregar el div al contenedor de contactos
    document.getElementById("contenidoContactos").appendChild(contactoElement);

    // Limpiar los campos del formulario (si es necesario)
    limpiarCampos();

}