$(document).ready(function(){
//    alert('Si ingresa a modificar');
    
    $('.btnmod').on('click', function(){
        var btn = $('.btnmod').index(this);
//        alert(btn);
        //asignacion de nombres
       var con = $('.id').eq(btn);
       var nom = $('.estado').eq(btn);
       
       var  id = con.val();
       var  name = nom.val();
       
//        alert("ID: "+id+"\n Estado: "+name);
       
       $.ajax({
            type: 'POST',
            url: 'ServletActualizaEstadoPedido',
            data:{
                cod: id,
                estado: name
            },
            success: function (res) {
                $('#res').html(res);
                console.log(res);
//                alert('Se incerto correctamente');
            }
       });
    });
});



