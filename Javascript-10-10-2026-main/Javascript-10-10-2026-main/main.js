// LLAMAMOS A LOS INPUT (DOM)
const inputEmail = document.querySelector("#email");
const inputPass = document.getElementById("password");
const formulario = document.querySelector("form");

// Creamos el evento de enviar (submit)
formulario.addEventListener("submit", function (e) {
    // Prevenimos que la página se recargue inmediatamente
    e.preventDefault();

    // Obtener los valores de los inputs
    const correo = inputEmail.value.trim();
    const clave = inputPass.value.trim();

    // Validación 1: comprobar si los campos están vacíos
    if (correo === '' || clave === '') {
        alert("Error: Debes completar todos los campos.");
        return;
    }

    // Validación 2: la clave debe ser de al menos 9 dígitos o caracteres
    if (clave.length < 9) {
        alert("Error: La contraseña debe tener al menos 9 dígitos.");
        return;
    }

    // Datos predeterminados
    const userEmail = "admin@gmail.com";
    const userPass = "123456789";

    // VALIDACIÓN DE CREDENCIALES
    if (correo === userEmail && clave === userPass) {
        // Redirección correcta
        window.location.href = "https://www.tiktok.com";
    } else {
        alert("Error: El usuario o contraseña es incorrecta.");
    }
});

console.log(inputEmail, inputPass);