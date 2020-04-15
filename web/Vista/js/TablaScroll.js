$(document).ready(function () {
//    alert('hola');
    $('#vertical').DataTable({
    "scrollY": "50vh",
    "scrollCollapse": true
    });
    $('.dataTables_length').addClass('bs-select');
});

$(document).ready( function () {
    //alert('hola');
    $('#tablemode').DataTable({
        language:{
            processing: "Procesando...",
            search: "Buscar: ",
            lengthMenu: "Mostrar _MENU_ registros",
            info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            infoEmpty: "Mostrando registros del 0 al 0 de un total de 0 registros",
            infoFiltered: "(Filtrado de un total de _MAX_ registros)",
            infoPostFix: "",
            loadingRecords: "Cargando",
            zeroRecords: "No se encontraron resultados",
            emptyTable: "No hay datos disponibles en la tabla",  
            paginate:{
                first:      "Premero",
                previous:   "Anterior",
                next:       "Siguiente",
                last:       "Anterior"
            },
            aria:{
                sortAscending: ": Activar para ordenar la columna de manera ascendente",
                sortDescending: ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
    
} );

