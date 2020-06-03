$(document).ready(function(e){
    // Animacion en el nav
    var ubicacionPrincipal = window.pageYOffset;
    window.addEventListener("scroll", function() {
        var desplazamientoActual = window.pageYOffset;
        if (ubicacionPrincipal >= desplazamientoActual) {
            document.getElementsByTagName("nav")[0].style.top = "0px";
        }
        else {
            document.getElementsByTagName("nav")[0].style.top = "-100px";
        }
        ubicacionPrincipal = desplazamientoActual;
    });
});
