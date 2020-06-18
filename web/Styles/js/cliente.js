$(document).ready(function(e){
   var ubicacionPrincipal = window.pageYOffset;
    window.addEventListener("scroll", function() {
        var desplazamientoActual = window.pageYOffset;
        if (ubicacionPrincipal >= desplazamientoActual) {
            document.getElementsByTagName("nav")[0].style.top = "0px";
            document.querySelectorAll(".enlaces_header")[0].style.top = "0px";
        }
        else {
            document.getElementsByTagName("nav")[0].style.top = "-100px";
            document.querySelectorAll(".enlaces_header")[0].style.top = "-240px";
        }
        ubicacionPrincipal = desplazamientoActual;
    });
    
    var enlacesHeader = document.querySelectorAll(".enlaces_header")[0];
    var semaforo = true;
    document.querySelectorAll(".hamburguer")[0].addEventListener("click", function() {
        if (semaforo) {
            document.querySelectorAll(".hamburguer")[0].style.color = "#fff";
            semaforo = false;
        }
        else {
            document.querySelectorAll(".hamburguer")[0].style.color = "rgb(153, 48, 180)";
            semaforo = true;
        }
        enlacesHeader.classList.toggle("menuDos");
    });
    
    var btnAbrirPopup = document.getElementById('btnAbrirPopup');
    var btnAbrirCarrito = document.getElementById('carrito');
    var overley = document.getElementById('overley');
    var popup = document.getElementById('popup');
    var carritoModal = document.getElementById('carritoModal');
    var carritoPopup = document.getElementById('carritoPopup');
    var btnCerrarPopup = document.getElementById('btnCerrar');
    var btnCerrarCarrito = document.getElementById('btnCerrarCarrito');
    var formularioActualizar = document.getElementById('formularioActualizar');
    
    btnAbrirPopup.addEventListener('click', function(){
        overley.classList.add('active');
        popup.classList.add('active');
        formularioActualizar.classList.add('active');
        enlacesHeader.classList.toggle("menuDos");
        document.getElementsByTagName("nav")[0].style.top = "-100px";
    });
    btnCerrarPopup.addEventListener('click', function(){
        overley.classList.remove('active');
        popup.classList.remove('active');
        document.getElementsByTagName("nav")[0].style.top = "0px";
        document.querySelectorAll(".hamburguer")[0].style.color = "rgb(153, 48, 180)";
    });
    btnAbrirCarrito.addEventListener('click', function(){
        carritoModal.classList.add('active');
        carritoPopup.classList.add('active');
        document.getElementsByTagName("nav")[0].style.top = "-100px";
    });
    btnCerrarCarrito.addEventListener('click', function(){
        carritoModal.classList.remove('active');
        carritoPopup.classList.remove('active');
        document.getElementsByTagName("nav")[0].style.top = "0px";
    });
});
