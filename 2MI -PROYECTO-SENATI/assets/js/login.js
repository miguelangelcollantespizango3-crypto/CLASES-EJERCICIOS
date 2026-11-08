JavaScript
document.addEventListener("DOMContentLoaded", () => {
    const formLogin = document.getElementById("formLogin");
    const correoInput = document.getElementById("correo");
    const claveInput = document.getElementById("contrasena");
    const errorMensaje = document.getElementById("error");

    if (formLogin) {
        formLogin.addEventListener("submit", (e) => {
            e.preventDefault();

            const correo = correoInput.value.trim();
            const clave = claveInput.value.trim();

            if (correo === "" || clave === "") {
                errorMensaje.textContent = "Por favor, complete todos los campos.";
                return;
            }

            errorMensaje.textContent = "";
            window.location.href = "dashboard.html";
        });
    }
});