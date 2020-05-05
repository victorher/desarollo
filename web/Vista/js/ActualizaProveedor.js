$(document).ready(function(){
//    alert('Si ingresa a modificar');
    
    $('.btnmod').on('click', function(){
        var btn = $('.btnmod').index(this);
//        alert(btn);
        //asignacion de nombres
       var con = $('.proveedorID').eq(btn);
       var nom = $('.nombre').eq(btn);
       var ape = $('.apellido').eq(btn);
       var dir = $('.direccion').eq(btn);
       var tel = $('.telefono').eq(btn);
       var cor = $('.correo').eq(btn);
       var cat = $('.categoria').eq(btn);
       var est = $('.estado').eq(btn);
       
       var  id = con.val();
       var  name = nom.val();
       var  lastname = ape.val();
       var  address = dir.val();
       var  cell = tel.val();
       var  mail = cor.val();
       var  arc = cat.val();
       var  obs = est.val();
       
//        alert(id+"\n"+name+"\n"+lastname+"\n"+address+"\n"+cell+"\n"+mail+"\n"+arc+"\n"+obs);
       
       $.ajax({
            type: 'POST',
            url: 'ActualizaProveedor',
            data:{
                proveedorID: id,
                nombre: name,
                apellido: lastname,
                direccion: address,
                telefono: cell,
                correo: mail,
                categoria: arc,
                estado: obs
            },
            success: function (res) {
//                $('#res').html(res);
                console.log(res);
//                alert('Se incerto correctamente');
            }
       });
    });
});

