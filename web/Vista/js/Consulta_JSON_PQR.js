$(document).ready(function (){
//    alert('ingreso al funtion');
    $('.carga').on('click',function (){
        incertar();
    });
//    $('.consulta').on('click',function (){
       cargarJson(); 
//    });
});

//function incertar(){
////    alert('incertar');
//    var nom = $('.nombre').val(),
//        des = $('.descripcion').val();
//        $.ajax({
//            type: 'POST',
//            url: "incertataArtProveedor",
//            data: {nombre:nom, descripcion:des},
//            success: function (res) {
//                if(res) {alert('datos guardados'); cargarJson(); }
//                else {alert('no se guardaron los datos');}
////            console.log(res);
//        }
//        });
//};

function cargarJson(){
//    alert('ingresa');
    $.ajax({
        url: "ServletConsultaPQR_JSON",
        dataType: 'json',
        success: function (resul) {
            var contenido = document.getElementById('contenedor');
            contenido.innerHTML='';
            var datos = resul.length;
            if(datos>0){
                contenido.innerHTML=`
                <thead>
                    <tr class="btn-success">
                        <th scope="col" class="text-center">Nombre</th>
                        <th scope="col" class="text-center">Descripcion</th>
                    </tr>
                </thead>`;
                for(var dat of resul){
                    contenido.innerHTML+=`
                        <tbody>
                            <tr>
                                <td class="text-center">
                                    <input 
                                        size="15" 
                                        type="text" 
                                        class="input-group-text text-center border-0 artno" 
                                        value="${dat.Nom}" 
                                        name="nombre">
                                </td>
                                <td class="text-center">
                                    <input 
                                        size="70" 
                                        type="text" 
                                        class="input-group-text text-center border-0 descr" 
                                        value="${dat.Cat}" 
                                        name="descripcion">
                                </td>
                            </tr>
                        </tbody>`;
                };
            }
        }
    });
};


