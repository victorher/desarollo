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
    var label = document.getElementById('label');
    var label1 = document.getElementById('label1');
    var label2 = document.getElementById('label2');
    var label3 = document.getElementById('label3');
    var label4 = document.getElementById('label4');
    var label5 = document.getElementById('label5');
    var label6 = document.getElementById('label6');
    var label7 = document.getElementById('label7');
    
    btnAbrirPopup.addEventListener('click', function(){
        overley.classList.add('active');
        popup.classList.add('active');
        FormularioIniciar.classList.add('active');
        formularioRegistar.classList.remove('active');
    });
    btnCerrarPopup.addEventListener('click', function(){
        overley.classList.remove('active');
        popup.classList.remove('active');
    });
    btnFormularioIniciar.addEventListener('click', function() {
        formularioRegistar.classList.remove('active');
        FormularioIniciar.classList.add('active');
        popup.style.overflow = "hidden";
        label.style.transition = "none";
        label1.style.transition = "none";
        label2.style.transition = "none";
        label3.style.transition = "none";
        label4.style.transition = "none";
        label5.style.transition = "none";
        label6.style.transition = "none";
        label7.style.transition = "none";
    });
    btnFormularioRegistrar.addEventListener('click', function() {
        FormularioIniciar.classList.remove('active');
        formularioRegistar.classList.add('active');
        popup.style.overflow = "auto";
    });
});
