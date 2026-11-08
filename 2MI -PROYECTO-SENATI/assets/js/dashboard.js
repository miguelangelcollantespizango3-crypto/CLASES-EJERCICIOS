document.addEventListener("DOMContentLoaded", () => {
    const btnMenu = document.getElementById("btnMenu");
    const menu = document.getElementById("menu");

    if (btnMenu && menu) {
        btnMenu.addEventListener("click", (e) => {
            e.stopPropagation();
            menu.classList.toggle("activo");
        });

        document.addEventListener("click", (e) => {
            if (!menu.contains(e.target) && !btnMenu.contains(e.target)) {
                menu.classList.remove("activo");
            }
        });
    }
});