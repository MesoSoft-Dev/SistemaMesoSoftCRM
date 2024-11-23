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
      
    }
}

function despliegueContacto(contacto) {
    const contactoId = `contacto-${contactoCounter++}`;
    const contactoElement = document.createElement("div");
    contactoElement.classList.add("Contacto", "w-100", "d-flex", "align-items-center", "pb-2", "pt-1", "ps-2", "pe-5", "mb-3");
    contactoElement.id = contactoId;

    contactoElement.setAttribute("data-fecha-nacimiento", contacto.fechaNacimiento || "");
    contactoElement.setAttribute("data-sexo", contacto.sexo || "");
    contactoElement.setAttribute("data-com-email", contacto.comEmail || "");
    contactoElement.setAttribute("data-com-whatsapp", contacto.comWhatsapp || "");
    contactoElement.setAttribute("data-tipo-contacto", contacto.tipoContacto || "");
    contactoElement.setAttribute("data-origen", contacto.origen || "");

    // Agregar datos como atributos data-*
   

    contactoElement.innerHTML = `
        <div class="dropdown">
            <button class="btn m-0 p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-three-dots-vertical"></i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#EditarContactoform" onclick="cargarEditar('${contactoId}')">Editar</a></li>
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

let contactoIdActual = null;    
function cargarEditar(contactoId) {
    const contactoElement = document.getElementById(contactoId);
   
    if (!contactoElement) {
        alert("No se encontró el contacto.");
        return;
    }
    contactoIdActual = contactoId;

    const txtEditarNombres = document.getElementById("txtEditarNombres");
    const txtEditarApellidos = document.getElementById("txtEditarApellidos");
    const txtEditarCorreo = document.getElementById("txtEditarCorreo");
    const txtEditarTelefono = document.getElementById("txtEditarTelefono");

    const txtEditarFechaNacimiento = document.getElementById("txtEditarFechaNacimiento");
    const ddlEditarSexo = document.getElementById("ddlEditarSexo");
    const ddlEditarComEmail = document.getElementById("ddlEditarComEmail");
    const ddlEditarComWhatsapp = document.getElementById("ddlEditarComWhatsapp");
    const ddlEditarTipoContacto = document.getElementById("ddlEditarTipoContacto");
    const txtEditarOrigen = document.getElementById("txtEditarOrigen");

    const editarContactoId = contactoId;



    if (!editarContactoId) {
  
        return;
    } 


    const datos = contactoElement.querySelectorAll("p");
    const nombreCompleto = datos[0].innerText.split(" ");
    const nombre = nombreCompleto[0];
    const apellido = nombreCompleto.slice(1).join(" ");
    const telefono = datos[1].innerText;
    const correo = datos[2].innerText;

    txtEditarNombres.value = nombre;
    txtEditarApellidos.value = apellido;
    txtEditarCorreo.value = correo;
    txtEditarTelefono.value = telefono;

    txtEditarFechaNacimiento.value = contactoElement.getAttribute("data-fecha-nacimiento");
    ddlEditarSexo.value = contactoElement.getAttribute("data-sexo");
    ddlEditarComEmail.value = contactoElement.getAttribute("data-com-email");
    ddlEditarComWhatsapp.value = contactoElement.getAttribute("data-com-whatsapp");
    ddlEditarTipoContacto.value = contactoElement.getAttribute("data-tipo-contacto");
    txtEditarOrigen.value = contactoElement.getAttribute("data-origen");

    


    
   
}

function editar() {
    
    if (!contactoIdActual) {
       
        return;
    }

    const contactoElement = document.getElementById(contactoIdActual);

    if (!contactoElement) {
        alert("No se encontró el contacto.");
        return;
    }

    const nombre = document.getElementById("txtEditarNombres").value;
    const apellido = document.getElementById("txtEditarApellidos").value;
    const correo = document.getElementById("txtEditarCorreo").value;
    const telefono = document.getElementById("txtEditarTelefono").value;

    const nuevoContenido = `
        <div class="dropdown">
            <button class="btn m-0 p-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="bi bi-three-dots-vertical"></i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#EditarContactoform" onclick="cargarEditar('${contactoIdActual}')">Editar</a></li>
                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#ModalAdvertencia" onclick="cargarEliminar(this)">Eliminar</a></li>
            </ul>
        </div>
        <div class="d-flex flex-grow-1 justify-content-between align-items-center ps-3">
            <p class="col-2 mb-0">${nombre} ${apellido}</p>
            <p class="col-2 mb-0">${telefono}</p>
            <p class="col-3 mb-0">${correo}</p>
            <p class="col-2 mb-0">${new Date().toLocaleDateString()}</p> <!-- Fecha de creación actual -->
            <p class="col-2 mb-0">${new Date().toLocaleDateString()}</p> <!-- Última actividad actual -->
        </div>
    `;

    // Reemplazar el contenido del contacto
    contactoElement.innerHTML = nuevoContenido;

   

    contactoIdActual = null;

    // Ocultar el modal
   // $('#EditarContactoform').modal('hide');
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

    const fechaNacimiento = document.getElementById("txtFechaNacimiento").value;
    const sexo = document.getElementById("ddlSexo").value;
    const comEmail = document.getElementById("ddlComEmail").value;
    const comWhatsapp = document.getElementById("dllComWhatsapp").value;
    const tipoContacto = document.getElementById("ddlTipoContacto").value;
    const origen = document.getElementById("txtOrigen").value;


    const contacto = {
        nombre: nombre,
        apellido: apellido,
        correo: correo,
        telefono: telefono,
        fechaCreacion: new Date().toLocaleDateString(),
        fechaOtro: new Date(2024, 11, 19).toLocaleDateString(),

        fechaNacimiento: fechaNacimiento,
        sexo: sexo,
        comEmail: comEmail,
        comWhatsapp: comWhatsapp,
        tipoContacto: tipoContacto,
        origen: origen,
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
