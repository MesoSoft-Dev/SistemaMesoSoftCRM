function validarFormulario() {
    const nombres = document.getElementById("txtNombres").value;
    const apellidos = document.getElementById("txtApellidos").value;
    const correo = document.getElementById("txtCorreo").value;
    const telefono = document.getElementById("txtTelefono").value;
    const genero = document.getElementById("ddlGenero").value;
    const tipoContacto = document.getElementById("ddlContacto").value;


    if (nombres.trim() === "") {
        return false;
    }

    if (apellidos.trim() === "") {
        return false;

        if (correo.trim() === "") {
            return false;
        }

        if (telefono.trim() === "") {
            return false;
        }

        if (genero === "") {
            return false;
        }

        if (tipoContacto === "") {
            return false;
        }
        return true;
    }
}

function crearContacto() {
    const nombre = document.getElementById("txtNombres").value;
    const apellido = document.getElementById("txtApellidos").value;
    const input_val = `${nombre} ${apellido}`.trim();

    const contactoID = generateUniqueId();
}