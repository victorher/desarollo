$(document).ready(function (){
//    alert('ingreso al funtion');
       cargarJson(); 
       
       ContadorJson();
       
    $('.carga').on('click',function (){
        ActualizarPQR();
    });
});

function ActualizarPQR(){
//    alert('incertar');
    var id = $('.id').val();
    var mensaje = $('.respuesta').val();
//        alert(id+"\n"+mensaje);
    $.ajax({
        type: "POST",
        url: "ServletActulizaPQR_AJAX",
        data: {
            id: id, 
            mensaje: mensaje
        },
        success: function (res) {
            if(res) {
                alert('datos guardados'); 
                cargarJson(); 
            }
            else {
                alert('no se guardaron los datos');
            }
//          console.log(res);
        }
    });
};

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
                        <td scope="col" class="text-center"><b>Tipo_PQR</b></td>
                        <td scope="col" class="text-center"><b>Mensaje</b></td>
                        <td scope="col" class="text-center"><b>Opc</b></td>
                    </tr>
                </thead>`;
                for(var dat of resul){
                contenido.innerHTML+=`
                <tbody>
                    <tr>
                        <td>${dat.Nombre}</td>
                        <td>${dat.TipoPQR}</td>
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

function ContadorJson(){
//    alert('ingresa');
    $.ajax({
        url: "ServletContadorPQR_JSON",
        dataType: 'json',
        success: function (resul) {
//            console.log(resul);
            var contenido = document.getElementById('cunta');
            contenido.innerHTML='';
            var datos = resul.length;
            if(datos>0){
//                contenido.innerHTML=
                for(var dat of resul){
                contenido.innerHTML=`
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Administrador    
                        <spam style="color: red;">(${dat.id})</spam> 
                    </a> 
                </li>`;
                };
            }
        }
    });
};


