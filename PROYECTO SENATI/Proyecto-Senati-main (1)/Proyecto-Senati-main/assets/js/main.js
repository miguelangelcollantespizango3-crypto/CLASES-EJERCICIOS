const btn  = document.getElementById("btn-menu");
const menu = document.getElementById("menu");

btn.addEventListener("click", () => {
  const abierto = menu.classList.toggle("open");
  btn.classList.toggle("active", abierto);
  btn.setAttribute("aria-expanded", abierto);
  btn.setAttribute("aria-label", abierto ? "Cerrar menú" : "Abrir menú");
});