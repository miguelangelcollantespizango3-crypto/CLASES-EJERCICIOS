// Elementos del HTML
const formulario = document.getElementById("formLogin");
const correo = document.getElementById("correo");
const clave = document.getElementById("clave");
const error = document.getElementById("error");

// Cuando se presiona "INGRESAR"
formulario.addEventListener("submit", function (e) {
  e.preventDefault(); // evita que la página se recargue

  // Validar que no estén vacíos
  if (correo.value.trim() === "" || clave.value.trim() === "") {
    error.textContent = "Completa todos los campos";
    return;
  }

  // Validar que el correo tenga @
  if (!correo.value.includes("@")) {
    error.textContent = "Ingresa un correo válido";
    return;
  }

  // Todo correcto: ir al dashboard de escritorio
  error.textContent = "";
  window.location.href = "dashboard-escritorio.html";
});