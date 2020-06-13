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
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Vista/js/pqrLlevaDatos.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
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
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fa fa-cart-arrow-down" aria-hidden="true"></i> (1)
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" title="Cliente" aria-disabled="true"><%=nom%> <%=ape%></a>
                        </li>
                    </ul>
                    <br>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre form-control mr-sm-2" title="Actualizar" type="button" data-toggle="modal" data-target="#register">
                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                        </button>
                    </form>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <button class="btn btn-outline-invert form-control mr-sm-2" title="Cerrar Sesion" name="btn" type="submit">
                            <i class="fa fa-power-off" aria-hidden="true"></i>
                        </button>
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
                                <select name="" id="" class="form-control tipo">
                                    <option value="Petición">Petición</option>
                                    <option value="Queja">Queja</option>
                                    <option value="Reclamo">Reclamo</option>
                                    <option value="Sujerencia">Sujerencia</option>
                                    <option value="Felicitacion">Felicitacion</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control nombre" placeholder="Nombre" title="No colocar numeros en este campo"  required="">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control email" title="Ingrese un correo electronico" placeholder="Email" required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control mensaje" title="Dejanos saber tus comentarios" placeholder="Mensaje" pattern="[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{1,5}" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-secondary btn-cargaDato">Enviar Comentario</button>
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
