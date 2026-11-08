document.addEventListener("DOMContentLoaded", () => {
    const marcoFoto = document.querySelector(".marco");
    const elementoLaser = document.querySelector(".laser-scanner");
    const statusText = document.querySelector(".status-scanning");

    let escaneando = false;

    function registrarExito() {
        if (statusText) {
            statusText.textContent = "¡Asistencia Registrada con Éxito!";
            statusText.style.color = "#2e7d32";
            statusText.style.fontWeight = "bold";
        }
        alert("¡Verificación biométrica completada! Asistencia registrada correctamente para JAMES GOSLING.");
    }

    if (marcoFoto && elementoLaser) {
        marcoFoto.style.cursor = "pointer";

        // Al hacer clic sobre la foto del joven, se enciende el escaneo
        marcoFoto.addEventListener("click", () => {
            if (escaneando) return;
            escaneando = true;

            // Mostramos el láser y activamos la animación
            elementoLaser.style.display = "block";
            elementoLaser.style.animation = "none";
            void elementoLaser.offsetWidth; // Truco para reiniciar la animación
            elementoLaser.style.animation = "escanear 1.8s ease-in-out forwards";

            if (statusText) {
                statusText.textContent = "Escaneando rostro...";
                statusText.style.color = "#1976d2";
            }

            // Esperamos que termine el escaneo (1.8s) y lanzamos el éxito
            setTimeout(() => {
                registrarExito();
            }, 1900);
        });
    }
});