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
            document.querySelectorAll(".enlaces_header")[0].style.top = "-100%";
        }
        ubicacionPrincipal = desplazamientoActual;
    });
    
    var enlacesHeader = document.querySelectorAll(".enlaces_header")[0];
    var semaforo = true;
    document.querySelectorAll(".hamburguer")[0].addEventListener("click", function() {
        if (semaforo) {
            document.querySelectorAll(".hamburguer")[0].style.color = "#fff";
            $('.uno_uno').hide();
            $('.dos_uno').hide();
            semaforo = false;
        }
        else {
            document.querySelectorAll(".hamburguer")[0].style.color = "rgb(153, 48, 180)";
            semaforo = true;
        }
        enlacesHeader.classList.toggle("menuDos");
    });
    
    $('.uno_uno').hide();
    $('.dos_uno').hide();
    $('.uno').on('click', function() {
        $('.dos_uno').hide();
        $('.uno_uno').slideToggle(300);
    });
    $('.dos').on('click', function() {
        $('.uno_uno').hide();
        $('.dos_uno').slideToggle(300);
    });
    
    ContadorJson();
});

function ContadorJson(){
    $.ajax({
        url: "ServletContadorPQR_JSON",
        dataType: 'json',
        success: function (resul) {
            var contenido = document.getElementById('cunta');
            contenido.innerHTML='';
            var datos = resul.length;
            if(datos>0){
                for(var dat of resul){
                contenido.innerHTML=`
                <div>
                    (${dat.id}) 
                </div>`;
                };
            }
        }
    });
};


