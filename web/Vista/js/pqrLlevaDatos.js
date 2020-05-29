$(document).ready(function (){
//   alert('hola'); 

    $('.btn-cargaDato').on('click', function (){
//        alert('ingresa');
        var nom = $('.nombre').val();
        var ema = $('.email').val();
        var mens = $('.mensaje').val();
        
//        alert(nom+" "+ema+" "+mens);

        $.ajax({
            type: 'POST',
            url: "",
            data:{
                nombre: nom,
                email: ema,
                mensaje: mens
            }
        });
    });
});
