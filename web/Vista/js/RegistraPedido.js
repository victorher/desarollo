$(document).ready(function (){
//    alert('Hola');

    $('.btnEnviar').on('click', function (){
        var doc = $('.documento').val();
        var est = $('.estado').val();
//        var fIni = $('.dateini').val();
//        var fFin = $('.datefin').val();
        var dir = $('.direccion').val();
        var tip = $('.tipo').val();
        var art = $('.articulo').val();
        var dis = $('.diseno').val();
        var des = $('.descripcion').val();
        var can = $('.cantidad').val();
        var pre = $('.precio').val();
        
//        alert("Documento: "+doc+"\n Estado: "+est+"\n Direccion: "+dir+"\n Tipo: "+tip+"\n IDArticulo: "+art+"\n IDDiseno: "+dis+"\n Descripcion: "+des+"\n Cantidad: "+can+"\n Precio: "+pre);
        
        $.ajax({
            type: 'POST',
            url: "ServletPedidoRegistra",
            data: {
                documento: doc,
                estado: est,
//                fepedido: fIni,
//                feentrega: fFin,
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
