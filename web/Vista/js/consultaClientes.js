$(document).ready(function (){
    cargar();
});

function cargar() {
    $.ajax({
        url: "ServletConsultaCliente",
        success: function (result) {
            $('#res').html(result);
        }
    });
}


