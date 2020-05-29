<%@page import="Modelo.disenoGestiona"%>
<%@page import="Modelo.disenoEtiqueta_gs"%>
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
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
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
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="MDB Logo"></a>
                </div>
                <a class="navbar-brand" href="Principal.jsp">INICIO</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars" aria-hidden="true"></i>
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
                                <a class="dropdown-item" href="#">Diseños</a>
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
            </div>
        </nav>
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <form action="ServletDiseno" enctype="multipart/form-data" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="titulo"><code>*</code> Titulo Producto</label>
                                    <input type="text" class="form-control" id="titulo" name="numdetalle" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="texto"><code>*</code> Texto del diseño</label>
                                    <input type="text" class="form-control" id="texto" name="texdiseno" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="tamdis"><code>*</code> Tamaño del diseño</label>
                                    <!--<input type="text" class="form-control" id="tamdis" name="tamdiseno" required>-->
                                    <select class="form-control" id="tamdis" name="tamdiseno">
                                        <option value="">Seleccionar</option>
                                        <option value="10 X 10">10 X 10</option>
                                        <option value="12 X 12">12 X 12</option>
                                        <option value="15 X 15">15 X 15</option>
                                        <option value="20 X 20">20 X 20</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="coldis">Color del diseño <code>*</code></label>
                                    <!--<input type="text" class="form-control" id="coldis" name="coldiseno" required>-->
                                    <select class="form-control" id="coldis" name="coldiseno">
                                        <option value="Rojo">Rojo</option>
                                        <option value="Caoba">Caoba</option>
                                        <option value="Azul">Azul</option>
                                        <option value="Frutos rojos">Frutos rojos</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="predis"><code>*</code> Precio del diseño</label>
                                    <input type="number" class="form-control" id="predis" name="prediseno" min="0" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="img"><code>*</code> Ingresa una imagen</label>
                                    <input type="file" id="img" name="imgdiseno" accept="image/*" class="btn btn-dark">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="obs"><code>*</code> Oservacion del diseño</label>
                                    <input type="text" class="form-control" id="obs" name="obsdiseno" required>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-entre" name="CargaDis" value="Registrar">
                        </form>
                    </div>
                    <div class="col-md-5">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"></li>
                                <li data-target="#carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="Vista/img/com-1.jpg" alt="First slide" width="250" height="500">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Comida</h3>
                                        <p class="lead d-none d-sm-block">Puesta</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/com-2.jpg" alt="Second slide" width="250" height="500">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Title</h3>
                                        <p class="lead d-none d-sm-block">lorem</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/com-3.jpg" alt="Third slide" width="250" height="500">
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
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <h3>Registrar nuevos diseños</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, dicta, harum porro velit similique cumque a aliquid veniam voluptatem! Veritatis sunt minus sint quidem eligendi itaque vitae earum atque sit?</p>
                <div class="row">
                    <%
                        ArrayList<disenoEtiqueta_gs> lista = new ArrayList<>();
                        disenoEtiqueta_gs imag = new disenoEtiqueta_gs();
                        disenoGestiona mues = new disenoGestiona();
                        lista = mues.MuestraImagen();
                        for(int i = 0; i < lista.size(); i++){
                            imag = lista.get(i);
                    %>
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <div class="card-header">
                                <h2 class="text-center"><%= imag.getImagen()%></h2>
                            </div>
                            <div class="card-body text-center">
                                <img src="img/<%= imag.getImagen() %>" width="200" height="180">
                            </div>
                            <div class="card-footer">
                                <div class="text-center">
                                    <label for="">$ <%=imag.getPrecio() %>.00</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
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
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script> 
    </body>
</html>
