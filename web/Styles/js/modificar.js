$(document).ready(function(){
    //alert("hola");
    
    $('.btnmod').on('click',function(){
       var btn = $('.btnmod').index(this);
        //alert(btn);
        //asignacion de nombres
       var iddis = $('.iddis').eq(btn);
       var nudeta = $('.nudeta').eq(btn);
       var tedis = $('.tedis').eq(btn);
       var tadis = $('.tadis').eq(btn);
       var codis = $('.codis').eq(btn);
       var predis = $('.predis').eq(btn);
       var obdis = $('.obdis').eq(btn);
       var imgdis = $('.imgdis').eq(btn);
       //declarar variables
       var  id = iddis.val();
       var  num = nudeta.val();
       var  ted = tedis.val();
       var  tad = tadis.val();
       var  col = codis.val();
       var  pre = predis.val();
       var  obs = obdis.val();
       var  img = 'Digite';
       //mostrar los datos
        //alert(id+"\n"+num+"\n"+ted+"\n"+tad+"\n"+col+"\n"+pre+"\n"+obs+"\n"+img);
       $.ajax({
           url:'ServletDisenoActualiza',
           data:{ //es un arreglo
               iddiseno: id,
               numdetalle: num,
               texdiseno: ted,
               tamdiseno: tad,
               coldiseno: col,
               prediseno: pre,
               obsdiseno: obs,
               imgdiseno: img
           },
            success: function (res) {
                console.log(res);
            }
       });
       
    });
});


