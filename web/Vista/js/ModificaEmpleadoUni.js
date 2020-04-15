$(document).ready(function(){
//    alert("Cliente Unico");
    $('.btnmod').on('click',function(){
       var btn = $('.btnmod').index(this);
//        alert(btn);
//        asignacion de nombres
       var doc = $('.doc').eq(btn);
       var nom = $('.nom').eq(btn);
       var apell = $('.apell').eq(btn);
       var gen = $('.gen').eq(btn);
       var mail = $('.mail').eq(btn);
       var tel = $('.tel').eq(btn);
       var dir = $('.dir').eq(btn);
       var pass = $('.pass').eq(btn);
       var est = $('.est').eq(btn);
       var roll = $('.roll').eq(btn);
       
//       declarar variables
       var  documento = doc.val();
       var  nombre = nom.val();
       var  apellido = apell.val();
       var  genero = gen.val();
       var  correo = mail.val();
       var  telefono = tel.val();
       var  direccion = dir.val();
       var  contrasena = pass.val();
       var  estado = est.val();
       var  roles = roll.val();
       
//       mostrar los datos
        alert(documento+"\n"+nombre+"\n"+apellido+"\n"+genero+"\n"+correo+"\n"+telefono+"\n"+direccion);
       $.ajax({
           url:'ActualizarCliente',
           data:{ //es un arreglo
               documento: documento,
               nombre: nombre,
               apellido: apellido,
               sexo: genero,
               correo: correo,
               telefono: telefono,
               direccion: direccion,
               contra: contrasena,
               estado: estado,
               rol: roles
           },
            success: function (res) {
                console.log(res);
            }
       });
       
    });
});

