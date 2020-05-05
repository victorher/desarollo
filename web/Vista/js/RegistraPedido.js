$(document).ready(function (){
//    alert('Hola');

    $('.btnEnviar').on('click', function (){
        var doc = $('.documento').val();
        var est = $('.estado').val();
        var fIni = $('.dateini').val();
        var fFin = $('.datefin').val();
        var dir = $('.direccion').val();
        var tip = $('.tipo').val();
        var art = $('.articulo').val();
        var dis = $('.diseno').val();
        var des = $('.descripcion').val();
        var can = $('.cantidad').val();
        var pre = $('.precio').val();
        
//        alert(doc+"\n"+est+"\n"+fIni+"\n"+fFin+"\n"+dir+"\n"+tip+"\n"+art+"\n"+dis+"\n"+des+"\n"+can+"\n"+pre);
        
        $.ajax({
            type: 'POST',
            url: "ServletPedidoRegistra",
            data: {
                documento: doc,
                estado: est,
                fepedido: fIni,
                feentrega: fFin,
                direntrega: dir,
                tipo: tip,
                articulo: art,
                diseno: dis,
                descripcion: des,
                cantidad: can,
                precio: pre
            },
            success: function (res) {
                console.log(res);
            }
        });
    });
});


