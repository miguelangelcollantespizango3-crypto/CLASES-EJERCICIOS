document.addEventListener("DOMContentLoaded", () => {
    const scannerCard = document.querySelector(".scanner-card");

    if (scannerCard) {
        scannerCard.style.cursor = "pointer";

        scannerCard.addEventListener("click", () => {
            // Evitamos múltiples clics seguidos si ya está escaneando
            if (scannerCard.classList.contains("scanning")) return;

            // Activamos la animación del láser
            scannerCard.classList.add("scanning");

            // Simulamos el tiempo que tarda la cámara en escanear (2 segundos)
            setTimeout(() => {
                scannerCard.classList.remove("scanning");
                
                // Mostramos el aviso de éxito después del escaneo
                alert("¡Escaneo facial exitoso! Asistencia registrada correctamente para JAMES GOSLING.");
            }, 2000);
        });
    }
});