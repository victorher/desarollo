$(document).ready(function(){
    $('.btnmod').on('click', function(){
        var btn = $('.btnmod').index(this);
//        alert('hola');
        var idart = $('.idcat').eq(btn),
            nombre = $('.artno').eq(btn),
            cat = $('.descr').eq(btn);
            
            
//            Declarar variablas
        var id = idart.val(),
            nom = nombre.val(),
            cate = cat.val();
//        alert(id +" "+ nom +" "+ cate);
//        Mostrar datos
        $.ajax({
            url: 'ActualizarCatProveedor',
            data: {
                id: id,
                nombre: nom,
                descripcion: cate
            },
            success: function (res) {
                console.log(res);
            }
        });
        
    });
});


