$(document).ready(function (){
//    alert('Hola');

    $('.btnEnviar').on('click', function (){
        
        var doc = $(this).parent().find('.tdocumento').val();
        var est = $(this).parent().find('.testado').val();
//        var fIni = $('.dateini').val();
//        var fFin = $('.datefin').val();
        var dir = $(this).parent().find('.tdireccion').val();
        var tip = $(this).parent().find('.ttipo').val();
        var art = $(this).parent().find('.tarticulo').val();
        var dis = $(this).parent().find('.tdiseno').val();
        var des = $(this).parent().find('.tdescripcion').val();
        var can = $(this).parent().find('.tcantidad').val();
        var pre = $(this).parent().find('.tprecio').val();
        
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
