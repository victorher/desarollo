/* global fetch */

$(document).ready(function(){
//   console.log('hola'); 
   $('.btn-cargaDato').on('click', function (e){
       e.preventDefault();
       console.log('ingresos al formulario');
       var data = new FormData(document.getElementById('frm'));
//       data.append('op', 'enviar');
       console.log(data);
       console.log(data.get('nombre'));
       console.log(data.get('email'));
       console.log(data.get('tipo')); 
       console.log(data.get('mensaje'));
       fetch('ServletCargaPQR',
       {
           method: 'POST',
           body: data
       })
       .then(datos=>datos.json())
       .then(datos=>{
           console.log(datos);
           if(datos){console.log('PQR registrada');}
           else{console.log('No fue exitoso el registro');};
       })
       .catch(function (){
          console.log('Error'); 
       });
   });
});
