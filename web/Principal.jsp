<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Usuariogetset"%>
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
                        <li class="nav-item active">
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
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=roll%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="PQR.jsp" tabindex="-1" aria-disabled="true">PQR (1)</a>
                        </li>
                    </ul>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <input class="btn btn-entre form-control mr-sm-2" type="submit" name="btn" value="Cerrar Sesion">
                    </form>
                </div>
            </div>
        </nav>
        <section class="bg-light-grey">
            <h1 id="h">Pagina del administrador</h1>
            <div class="text-center">
                <label class="alert"><%=gen%> </label>
                <label class="alert"><%=docu%> </label>
                <label class="alert"><%=cont%> </label>
                <label class="alert"><%=roll%> </label>
            </div>
        </section>
        <section>
            <div class="uno" id="uno">
                <label><%=nom+" "+ape%> </label>
            </div>
            <%
                ArrayList<Usuariogetset> us = new ArrayList<>();
                Usuariogetset re = new Usuariogetset();
                Usuario reu = new Usuario();
                us = reu.ConsultarUsu();
                for(int i = 0; i < us.size(); i++){
                    re = us.get(i);

            %>
                <div class="dos" id="dos">
                    <label><%=re.getDocumento() %> </label>
                </div>
                <div class="tres" id="tres">
                    <table class="table-responsive-md">
                        <thead>
                            <tr>
                                <th scope="col">Contraseña</th>
                                <th scope="col">Rol</th>
                                <th scope="col">Estado</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><%=re.getClave() %></td>
                                <td><%=re.getRoll()%></td>
                                <td><%=re.getEstado()%></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            <% }%>
        </section>
        <section id="slider">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Vista/img/cieAzul.jpg" alt="Second slide">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/monEver.jpg" alt="First slide">
                        <div class="carousel-caption">
                            <h3 class="d-block">Auto</h3>
                            <p class="lead d-none d-sm-block">Mercedes</p>
                        </div>
                    </div>


                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/monSnow.jpg" alt="Third slide">
                        <div class="carousel-caption">
                            <h3 class="d-block">Noche</h3>
                            <p class="lead d-none d-sm-block">Noche</p>
                        </div>
                    </div>

                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
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
        <script src="Vista/js/filtro.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
        <script src="Styles/main.js"></script>
        <script src="Vista/js/TablaScroll.js"></script>
    </body>
</html>
