/* global fetch */

$(document).ready(function(){
    //alert("hola");
    
//    $('.btnmod').on('click',function(){
//       var btn = $('.btnmod').index(this);
//        //alert(btn);
//        //asignacion de nombres
//       var iddis = $('.iddis').eq(btn);
//       var nudeta = $('.nudeta').eq(btn);
//       var tedis = $('.tedis').eq(btn);
//       var tadis = $('.tadis').eq(btn);
//       var codis = $('.codis').eq(btn);
//       var predis = $('.predis').eq(btn);
//       var obdis = $('.obdis').eq(btn);
//       var imgdis = $('.imgdis').eq(btn);
//       //declarar variables
//       var  id = iddis.val();
//       var  num = nudeta.val();
//       var  ted = tedis.val();
//       var  tad = tadis.val();
//       var  col = codis.val();
//       var  pre = predis.val();
//       var  obs = obdis.val();
//       var  img = imgdis.val();
//       //mostrar los datos
//        //alert(id+"\n"+num+"\n"+ted+"\n"+tad+"\n"+col+"\n"+pre+"\n"+obs+"\n"+img);
//       $.ajax({
//           type: 'POST',
//           url:'ServletDisenoActualiza',
//           data:{ //es un arreglo
//               iddiseno: id,
//               numdetalle: num,
//               texdiseno: ted,
//               tamdiseno: tad,
//               coldiseno: col,
//               prediseno: pre,
//               obsdiseno: obs,
//               imgdiseno: img
//           },
//            success: function (res) {
//                console.log(res);
//            }
//       });
//       
//    });

   $('.btnmod').on('click',function(e){
//        e.preventDefault();
//        var a = $('.btnmod').index(this);
//        console.log(a);
        var data = new FormData(document.getElementById('frm'));
//        data.append('op', 'envia');
//        console.log(data.get('iddis'));
//        console.log(data.get('numdetalle'));
//        console.log(data.get('texdiseno'));
//        console.log(data.get('tamdiseno'));
//        console.log(data.get('coldiseno'));
//        console.log(data.get('prediseno'));
//        console.log(data.get('obsdiseno'));
//        console.log(data.get('imgdiseno'));
        fetch('ServletDisenoActualiza',
        {
            method: "POST",
            body: data
        })
        .then(datos=>datos.json())
        .then(datos=>{
//            console.log(datos);
            if(datos){
                alert('La imagen se cargo correctamente');
            }
            else{
                alert('Los datos no se cargaron');
            }
        })
        .catch (function(err) {
            console.log(err+" "+'No hay datos');
        });
    });
});
