// ===== Datos de ejemplo (como en el diseño de Figma) =====
// Para que la tabla quede vacía, deja la lista así: []
const colaboradores = [
  { nombre: "Jorge Luis Real", entrada: "25-09-2026 12:30:33", salida: "25-09-2026 18:30:33" }
];

const FILAS_MINIMAS = 3; // la tabla siempre muestra al menos 3 filas

// La fecha y la hora se muestran en dos líneas: "25-09-2026" y "12:30:33"
function enDosLineas(texto) {
  return texto.replace(" ", "<br>");
}

// ===== Llenar la tabla =====
const tabla = document.getElementById("tabla");

for (let i = 0; i < Math.max(FILAS_MINIMAS, colaboradores.length); i++) {
  const c = colaboradores[i];

  if (c) {
    tabla.innerHTML +=
      '<tr class="con-datos"><td>' + c.nombre + "</td><td>" + enDosLineas(c.entrada) +
      "</td><td>" + enDosLineas(c.salida) + "</td></tr>";
  } else {
    tabla.innerHTML += "<tr><td></td><td></td><td></td></tr>"; // fila vacía
  }
}