<%-- 
    Document   : Disenos
    Created on : 19/05/2020, 07:37:37 PM
    Author     : VICTORH
--%>

<%@page import="Modelo.GestionDiseno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Disenogetset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Entre Sueños</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Oswald:500|Roboto+Condensed:300,400&display=swap" rel="stylesheet">
        <!-- Bootstrap CSS -->
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">-->
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="Vista/css/StylesU.css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
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
        <nav class="navbar navbar-expand-lg col-gra b-inf">
            <div class="container">
                <div class="text-center">
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="MDB Logo"></a>
                </div>
                <a class="navbar-brand" href="<%=roll%>.jsp"><%=roll%></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Eventos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Consultar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Empleados</a>
                                <a class="dropdown-item" href="#">Clientes</a>
                                <a class="dropdown-item" href="#">Proveedor</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Diseño</a>
                                <a class="dropdown-item" href="Disenos.jsp">Diseños</a>
                                <a class="dropdown-item" href="#">Categorias de articulos</a>
                                <a class="dropdown-item" href="#">Articulos</a>
                                <a class="dropdown-item" href="#">Pedidos</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registrar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Empleados</a>
                                <a class="dropdown-item" href="#">Clientes</a>
                                <a class="dropdown-item" href="#">Proveedores</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Diseños</a>
                                <a class="dropdown-item" href="#">Categorias de articulos</a>
                                <a class="dropdown-item" href="#">Articulos</a>
                                <a class="dropdown-item" href="CreaPedidos.jsp">Pedidos</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=docu%></a>
                        </li>
                    </ul>
                    <br>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <button class="btn btn-outline-invert form-control mr-sm-2" name="btn" type="submit">Cerrar Sesion</button>
                    </form>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre form-control mr-sm-2" type="button" data-toggle="modal" data-target="#register">Actualizar</button>
                    </form>
                </div> 
            </div>
        </nav>
        <section>
            <div class="container text-center">
                <h3>Los mejores Diseños</h3>
            </div>
            <hr>
            <div class="container">
                <div class="row">
                    <%
                        ArrayList<Disenogetset> listas = new ArrayList<>();
                        Disenogetset dis = new Disenogetset();
                        GestionDiseno muestra = new GestionDiseno();
                        listas = muestra.ConsultarDisenos();
                        for(int i = 0; i < listas.size(); i++){
                            dis = listas.get(i); %>
                    <div class="col-md-3 mb-3">
                        <div class="card">
                            <img 
                            title="Productos con medidas de <%= dis.getTexDiseno() %>"
                            alt="Diseño con color <%= dis.getColDiseno() %>"
                            class="card-img-top"
                            src="img/<%= dis.getImagen() %>"
                            data-toggle="popover"
                            data-trigger="hover"
                            data-content="<%= dis.getNumDetalle() %> <%= dis.getObserDiseno() %>"
                            />
                            <div class="card-body">
                                <spam><b><%= dis.getNumDetalle()%></b></spam>
                                <h5 class="card-title"><b>$ <%= dis.getPreDiseno() %>.00</b></h5>
                                <p class="card-text"><%= dis.getTamDiseno() %></p>
                                <form action="" method="post">
                                    <button class="btn btn-entre"
                                    name="enviar"
                                    value="Agregar"
                                    type="submit"
                                    >
                                        Agregar al carrito
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </section>
        <section class="bg-light-grey">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="blog-item position-relative rounded mb-5">
                            <a href="#">
                                <div class="blog-info position-absolute">
                                    <p class="text-gold mb-3"><span class="font-wight-boild">Diseños</span> - Mini Box</p>
                                    <h3><i class="fa fa-map-marker" aria-hidden="true"></i> Direccion del lugar</h3>
                                </div>
                                <img src="Vista/img/celular.jpg" class="img-fluid rounded">
                            </a>
                        </div>
                        <h6 class="mt-6">Contactanos</h6>
                        <p>Carrera 7 frente al parque principal <b>entresueños@netmail.com</b></p>
                    </div>
                    <div class="col-md-7 offset-md-1">
                        <h2>Dejanos tus sugerencias</h2>
                        <p class="lead text-muted">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus delectus quas veniam voluptate consequatur doloribus, quidem quia corrupti molestias debitis saepe iure! Reiciendis non ipsa quod repellendus illo dolorem beatae?</p>
                        <form action="" class="mt-6">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nombre">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" placeholder="Email">
                            </div>
<!--                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Numero telefonico">
                            </div>-->
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Mensaje"></textarea>
                            </div>
                            <button type="submit" class="btn btn-secondary">Enviar Comentario</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <footer class="bg-dark text-light py-4">
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
        <script>
            $(function(){
                $('[data-toggle="popover"]').popover()
            });
        </script>
    </body>
</html>
