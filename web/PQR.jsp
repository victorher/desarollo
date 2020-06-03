<%-- 
    Document   : PQR
    Created on : 2/06/2020, 07:24:39 PM
    Author     : VICTORH
--%>
<%
    try {
        response.setHeader("Pragma", "no-cache");
        response.addHeader("Cache-control", "must-revalidate");
        response.addHeader("Cache-control", "no-cache");
        response.addHeader("Cache-control", "no-store");
    if(session.getAttribute("Documento")==null){
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    } catch (Exception e) {
       request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
        <link rel="stylesheet" href="Styles/Est.css">
        <link rel="stylesheet" href="Vista/css/StylesU.css">
    </head>
    <body>
        <%
            String nom, ape, gen, docu, cont, roll, direcc;
            HttpSession obsjes = request.getSession();
            nom = (String) obsjes.getAttribute("Nombre");
            ape = (String) obsjes.getAttribute("Apellido");
            gen = (String) obsjes.getAttribute("Genero");
            docu = (String) obsjes.getAttribute("Documento");
            cont = (String) obsjes.getAttribute("Contrasena");
            roll = (String) obsjes.getAttribute("Rol");
            direcc = (String) obsjes.getAttribute("Direccion");
        %>
        <!--<script type="text/javascript">alert('Bienvenido al sistema');</script>-->
        <nav class="navbar navbar-expand-lg col-gra b-inf">
            <div class="container">
                <div class="text-center">
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="MDB Logo"></a>
                </div>
                <a class="navbar-brand" href="#">INICIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
<!--                        <li class="nav-item active">
                            <a class="nav-link" href="#">Nosotros <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Consultar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="ConsultaEmpleado.jsp">Empleado</a>
                                <a class="dropdown-item" href="ConsultaCliente.jsp">Cliente</a>
                                <a class="dropdown-item" href="ConsultaProveedores.jsp">Proveedores</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Pedidos</a>
                                <a class="dropdown-item" href="ConsultaDiseno.jsp">Diseños</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="ConsultaArtProveedor.jsp">Categoria Articulos</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registrar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="CreaEmpleado.jsp">Empleado</a>
                                <a class="dropdown-item" href="CreaCliente.jsp">Cliente</a>
                                <a class="dropdown-item" href="CreaPreveedores.jsp">Proveedores</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="CreaPedidos.jsp">Pedidos</a>
                                <a class="dropdown-item" href="CreaDiseno.jsp">Diseños</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="CreaArtProveedor.jsp">Categoria Articulos</a>
                            </div>
                        </li>-->
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=roll%></a>
                        </li>
                    </ul>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre form-control mr-sm-2" type="submit" name="btn">
                            <i class="fa fa-power-off" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </body>
    
    <div class="container mt-4 p-4">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <%%>
                            <form class="task-form" acction="" method="POST">
                                <%%>
                                <div class="form-group">
                                    <input type="hidden" id="id" placeholder="Id" class="id form-control" name="id" value="<%%>">
                                </div>
                                <div class="form-group">
                                     <textarea id="queja" cols="20" rows="3" class="form-control queja" placeholder="<%%>"></textarea>
                                </div>
                                <div class="form-group">
                                     <textarea id="respuesta" cols="20" rows="6" class="form-control respuesta" name="respuesta" placeholder="Respuesta"></textarea>
                                </div>
                                <button type="submit" name="actualizaP" class="btn btn-success carga btn-block text-center">
                                    Registrar
                                </button>
                                <%%>
                            </form>
                        <%%>
                            <form class="task-form">
                                <div class="form-group">
                                    <input type="hidden" id="id" placeholder="Id" class="id form-control">
                                </div>
                                <div class="form-group">
                                     <textarea id="queja" cols="20" rows="3" class="form-control queja" placeholder="Queja"></textarea>
                                </div>
                                <div class="form-group">
                                     <textarea id="respuesta" cols="20" rows="6" class="form-control respuesta" placeholder="Respuesta"></textarea>
                                </div>
                                <button class="btn btn-success carga btn-block text-center">
                                    Registrar
                                </button>
                            </form>
                        <%%>
                    </div>
                </div>
            </div>
            <div class="col-md-7 mt-4">
                <table class="table table-bordered table-sm">
                    <thead>
                        <tr>
                            <td class="text-center"><b>F_Reclamo</b></td>
                            <td class="text-center"><b>Queja</b></td>
                            <td class="text-center"><b>Opc</b></td>
                        </tr>
                    </thead>
                    <tbody class="tareas" id="tareas">
                        <%%>
                        <tr>
                            <td><%%></td>
                            <td><%%></td>
                            <td>
                                <form acction="" method="POST">
                                    <input type="hidden" name="id" value="<%%>">
                                    <button type="submit" name="modifica" class="img-thumbnail btn-success btn-block">
                                        <i class="fa fa-wrench" aria-hidden="true"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</html>