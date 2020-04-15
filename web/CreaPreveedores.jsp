<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="Styles/Est.css">
        <link rel="icon" type="image/png" href="img/Suenos.png">
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script> 
    </head>
    <body>
        <%
            String nom, ape, gen, docu, cont, roll;
            HttpSession obsjes = request.getSession();
            nom = (String) obsjes.getAttribute("Nombre");
            ape = (String) obsjes.getAttribute("Apellido");
            gen = (String) obsjes.getAttribute("Genero");
            docu = (String) obsjes.getAttribute("Documento");
            cont = (String) obsjes.getAttribute("Contrasena");
            roll = (String) obsjes.getAttribute("Rol");
        %>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-transparent " color-on-scroll="300">
                <a class="navbar-brand" href="Principal.jsp">INICIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Nosotros <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Regalos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registrar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Empleado</a>
                                <a class="dropdown-item" href="#">Cliente</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=roll%></a>
                        </li>
                    </ul>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <input class="btn btn-danger mr-sm-2" type="submit" name="btn" value="Cerrar Sesion">
                    </form>
                </div>
            </nav>
        </div>
        <div class="container">
            <form action="ServletProveedor" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="exampleFormControlSelect1">Nombre <code>*</code></label>
                        <input type="text" class="form-control" id="inputAddress" name="nombre" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="formGroupExampleInput">Apellido <code>*</code></label>
                        <input type="text" class="form-control" id="inputAddress" name="apellido">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="formGroupExampleInput">Direccion <code>*</code></label>
                        <input type="text" class="form-control" id="inputEmail4" name="direccion" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="formGroupExampleInput">Telefono <code>*</code></label>
                        <input type="text" class="form-control" id="inputEmail4" name="telefono" required>
                    </div>
                    <div class="form-group col-md-5">
                        <label for="formGroupExampleInput">Correo <code>*</code></label>
                        <input type="text" class="form-control" id="inputEmail4" name="correo" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="formGroupExampleInput">Categoria <code>*</code></label>
                        <input type="text" class="form-control" id="inputEmail4" name="categoria" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="formGroupExampleInput">Estado <code>*</code></label>
                        <input type="text" class="form-control" id="inputEmail4" name="estado" value="Activo" readonly="readonly">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" name="CargaPro">Registrar</button>
            </form>
        </div>
        <div class="container">
            <footer class="page-footer font-small blue fixed-bottom">
                <div class="footer-copyright text-center py-3">© 2020 Copyright:
                    <a href="https://mdbootstrap.com/education/bootstrap/"> EntreSueños.com</a>
                </div>
            </footer>
        </div>
    </body>
</html>
