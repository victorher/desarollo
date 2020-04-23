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
        <link rel="icon" type="image/png" href="img/Suenos.png">
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="Styles/Est.css">
        <link rel="stylesheet" href="Vista/css/StylesU.css">
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
        <nav class="navbar navbar-expand-lg col-gra b-inf">
            <div class="container">
                <div class="text-center">
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="VAH Logo"></a>
                </div>
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
                        <input class="btn btn-entre mr-sm-2" type="submit" name="btn" value="Cerrar Sesion">
                    </form>
                </div>
            </div>
        </nav>
        
        <section>
            <div class="container">
            <form action="" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="exampleFormControlSelect1">Nombre <code>*</code></label>
                        <input type="text" class="form-control nombre" id="inputAddress" name="nombre" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="formGroupExampleInput">Apellido <code>*</code></label>
                        <input type="text" class="form-control apellido" id="inputAddress" name="apellido">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="formGroupExampleInput">Direccion <code>*</code></label>
                        <input type="text" class="form-control direccion" id="inputEmail4" name="direccion" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="formGroupExampleInput">Telefono <code>*</code></label>
                        <input type="text" class="form-control telefono" id="inputEmail4" name="telefono" required>
                    </div>
                    <div class="form-group col-md-5">
                        <label for="formGroupExampleInput">Correo <code>*</code></label>
                        <input type="text" class="form-control correo" id="inputEmail4" name="correo" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="formGroupExampleInput">Categoria <code>*</code></label>
                        <input type="text" class="form-control categoria" id="inputEmail4" name="categoria" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="formGroupExampleInput">Estado <code>*</code></label>
                        <input type="text" class="form-control estado" id="inputEmail4" name="estado" value="Activo" readonly="readonly">
                    </div>
                </div>
                <button type="submit" class="btn btn-entre btncarga" name="CargaPro">Registrar</button>
            </form>
        </div>
        </section>
                        
        <section>
            <div id="res"></div>
        </section>
        
        <section class="ff">
            
        </section>
        <footer class="bg-dark text-light py-2">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ul class="list-inline">
                            <li class="list-inline-item lead mx-2"><i class="fa fa-instagram" aria-hidden="true"></i></li>
                            <li class="list-inline-item lead mx-2"><i class="fa fa-facebook-official" aria-hidden="true"></i></li>
                            <li class="list-inline-item lead mx-2"><i class="fa fa-twitter" aria-hidden="true"></i></li>
                            <li class="list-inline-item lead mx-2"><i class="fa fa-youtube-play" aria-hidden="true"></i></li>
                        </ul>
                    </div>
                    <div class="col-md-6 text-sm-right">
                        <small>Entre sueños</small>
                    </div>
                </div>
            </div>
        </footer>
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Vista/js/ConsultaProveedor.js" type="text/javascript"></script>
        <script src="Vista/js/InsertarUsuariosPro.js" type="text/javascript"></script>
        <script src="Vista/js/ActualizaProveedor.js" type="text/javascript"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script> 
    </body>
</html>
