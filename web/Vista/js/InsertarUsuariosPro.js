$(document).ready(function () {
    //alert ("hola");
   
    $('.btncarga').on('click', function (){
        
       var nom = $('.nombre').val();
       var ape = $('.apellido').val();
       var dir = $('.direccion').val();
       var tel = $('.telefono').val();
       var corr = $('.correo').val();
       var cat = $('.categoria').val();
       var est = $('.estado').val();
       
       $.ajax({
            type: 'post',   
            url:'ServletIncertaProAjax',
           data:{ //es un arreglo
               nombre: nom,
               apellido: ape,
               direccion: dir,
               telefono: tel,
               correo: corr,
               categoria: cat,
               estado: est
           },
            success: function (result) {
                $('#res').html(result);
            }
       });
    });
});

