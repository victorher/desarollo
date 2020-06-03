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
//            console.log(resul);
            var contenido = document.getElementById('contenedor');
            contenido.innerHTML='';
            var datos = resul.length;
            if(datos>0){
                contenido.innerHTML=`
                <thead>
                    <tr class="btn-success">
                        <td scope="col" class="text-center"><b>F_Reclamo</b></td>
                        <td scope="col" class="text-center"><b>Queja</b></td>
                        <td scope="col" class="text-center"><b>Opc</b></td>
                    </tr>
                </thead>`;
                for(var dat of resul){
                contenido.innerHTML+=`
                <tbody>
                    <tr>
                        <td>${dat.Mensaje}</td>
                        <td>${dat.FechaRegistro}</td>
                        <td>
                            <form acction="" method="POST">
                                <input type="hidden" name="id" value="${dat.id}">
                                <button type="submit" name="modifica" class="img-thumbnail btn-success btn-block">
                                    <i class="fa fa-wrench" aria-hidden="true"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                </tbody>`;
                };
            }
        }
    });
};


