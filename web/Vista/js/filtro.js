$(document).ready(function(){
//    alert("Ingreso al metodo de filtrar automaticamente");
    var nombre;
//    $('.btn').on('click', function (){
    $('.txt').on('keyup', function (){  // evento al momento de precionar una tecla
//    $('.txt').on('change', function (){  // genra el evento cuando se esta por fuera del objeto principal
        nombre = $('#txt').val();
        note();
    });
    function note(){
        $.ajax({
            url: "Filtrar",
            data: {
                datnom: nombre
            },
             success: function (result) {
    //                $("#res").html("<strong>" + result + "</strong> degrees");
                 $("#res").html(result);
            }
        });
    }
});

$(document).ready(function(){
    $("#search").keyup(function(){
        _this = this;
        // Mostar el tr que corresponda el resto se oculta
        $.each($("#mytable tbody tr"), function() {
            if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) === -1)
                $(this).hide();
            else
                $(this).show();
        });
    });
});
