$(document).ready(function (){
    cargar();
});

function cargar() {
    $.ajax({
        url: "ServletConsultaProveedorAjax",
        success: function (result) {
            $('#res').html(result);
        }
    })
}


