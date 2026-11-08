//EVENTOS EN JAVASCRIPT


let botonSi = document.getElementById("btnYes")
//console.log(botonSi)
//alert(botonSi)
//======El evento escucha (click) =======
botonSi.addEventListener("click", function(){
    alert("Usted presiono el Si/YES")
})



let botonSi = document.getElementById("btnYes")
let botonNo = document.getElementById("btnNo")
let botonCancel = document.getElementById("btnCancel")


botonSi.addEventListener("click", function(){
    botonSi.style.backgroundColor = "Yellow"
    botonSi.innerText = "Si"
})


botonNo.addEventListener("click", function(){
    botonNo.style.backgroundColor = "Red"
})   



botonCancel.addEventListener("click", function(){
    botonCancel.style.backgroundColor = "Blue"
})

