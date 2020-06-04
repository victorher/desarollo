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
    
    var btnAbrirPopup = document.getElementById('btnAbrirPopup');
    var overley = document.getElementById('overley');
    var popup = document.getElementById('popup');
    var btnCerrarPopup = document.getElementById('btnCerrar');
    var btnFormularioIniciar = document.getElementById('iniciar');
    var btnFormularioRegistrar = document.getElementById('registrar');
    var FormularioIniciar = document.getElementById('FormularioIniciar');
    var formularioRegistar = document.getElementById('formularioRegistar');
    
    btnAbrirPopup.addEventListener('click', function(){
        overley.classList.add('active');
        popup.classList.add('active');
    });
    btnCerrarPopup.addEventListener('click', function(){
        overley.classList.remove('active');
        popup.classList.remove('active');
    });
    btnFormularioIniciar.addEventListener('click', function() {
        FormularioIniciar.classList.add('active');
    });
});
