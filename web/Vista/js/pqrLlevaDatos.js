$(document).ready(function (){
//   alert('hola'); 

    $('.btn-cargaDato').on('click', function (){
//        alert('ingresa');
        var pqr = $('.pqr').val();
        var nom = $('.nombre').val();
        var ema = $('.email').val();
        var mens = $('.mensaje').val();
        
//        alert(pqr+"\n"+nom+"\n"+ema+"\n"+mens);

        $.ajax({
            type: 'POST',
            url: "ServletCargaPQR",
            data:{
                tipo: pqr,
                nombre: nom,
                email: ema,
                mensaje: mens
            }
        });
    });
});
