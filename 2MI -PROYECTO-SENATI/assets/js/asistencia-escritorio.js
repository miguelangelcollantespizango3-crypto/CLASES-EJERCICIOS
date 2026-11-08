document.addEventListener("DOMContentLoaded", () => {
    const marcoFoto = document.querySelector(".marco");
    const elementoLaser = document.querySelector(".laser-scanner");

    let escaneando = false;

    function registrarExito() {
        alert("¡Verificación biométrica completada! Asistencia registrada correctamente para JAMES GOSLING.");
    }

    if (marcoFoto && elementoLaser) {
        marcoFoto.style.cursor = "pointer";

        marcoFoto.addEventListener("click", () => {
            if (escaneando) return;
            escaneando = true;

            elementoLaser.style.display = "block";
            elementoLaser.style.animation = "none";
            void elementoLaser.offsetWidth; 
            elementoLaser.style.animation = "escanear 1.8s ease-in-out forwards";

            setTimeout(() => {
                registrarExito();
            }, 1900);
        });
    }
});