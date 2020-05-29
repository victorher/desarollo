<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.Clientegetset"%>
<%@page import="Modelo.GestionCliente"%>
<%@page import="Modelo.ConUsuCliente"%>
<%@page import="Modelo.Empleadogetset"%>
<%@page import="Modelo.GestionEmpleados"%>
<%@page import="Modelo.ConUsuEmpleado"%>
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
<html lang="es">
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
                <a class="navbar-brand" href="#"><%=roll%></a>
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
                                <a class="dropdown-item" href="Disenos.jsp">Diseños</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registrar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="CreaPedidos.jsp">Pedidos</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=nom+" "+ape%></a>
                        </li>
                    </ul>
                    <br>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre form-control mr-sm-2" type="button" data-toggle="modal" data-target="#register">Ver Datos</button>
                    </form>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <button class="btn btn-outline-invert form-control mr-sm-2" name="btn" type="submit">Cerrar Sesion</button>
                    </form>
                    
                </div> 
            </div>
        </nav>
        
     
        <section class="page-header section-dark bg-light-grey">
            <div class="container position-relative">
                <h1 class="mb-5 text-center font-weight-bold">Bienvenido a Entre sueños</h1>
                
            </div>
        </section>
        
        <!--Actualizar-->
        <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog cascading-modal" role="document">
                <!--Content-->
                <div class="modal-content bg-light-grey">
                    <div class="modal-header">
                        <h5 class="modal-title">Actualizar</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    
                    <!--Modal cascading tabs-->
                    <div class="modal-con-tabs">
                        <!--Panel-->
                        <div class="container">
                            <div class="tab-pane fade in show active" id="pane" role="tabpanel">
                                <form action="ActualizarCliente" method="POST">
                                    <!--Body-->
                                    <div class="modal-body mb-1">
                                        <%
                                            String co = docu;
                                            //co = request.getParameter("cod");
//                                                        JOptionPane.showMessageDialog(null, co);
                                            ArrayList<ConUsuCliente> listas = new ArrayList();
                                            ConUsuCliente con = new ConUsuCliente(co); //convas hago referencia al constructor vasio
                                            GestionCliente Cons = new GestionCliente();

                                            listas = Cons.ConsulClienteUni(con);

                                            for(int i = 0; i < listas.size(); i++){

                                                con = listas.get(i);

                                        %>

                                        <div class="md-form form-sm mb-2">
                                            <label for="documento"><code>*</code> Documento</label>
                                            <input type="text" class="form-control doc" id="documento" value="<%=con.getDocumento()%>" name="documento" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="nombre"><code>*</code> Nombre</label>
                                            <input type="text" class="form-control nom" id="nombre" value="<%=con.getNombre()%>" name="nombre" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="apellido"><code>*</code> Apellido</label>
                                            <input type="text" class="form-control apell" id="apellido" value="<%=con.getApellido()%>" name="apellido" required>
                                        </div> 

                                        <div class="form-group form-sm mb-2">       
                                            <label for="genero">Genero</label>
                                            <select name="sexo" id="genero" class="form-control gen">
                                                <option value="<%=con.getGenero()%>"><%=con.getGenero()%></option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </select>  
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="mail"><code>*</code> Correo</label>
                                            <input type="email" class="form-control mail" id="mail" value="<%=con.getCorreo()%>" name="correo" required>
                                        </div> 

                                        <div class="md-form form-sm mb-2">
                                            <label for="telefono"><code>*</code> Telefono</label>
                                            <input type="text" class="form-control tel" id="telefono" value="<%=con.getTelefono()%>" name="telefono" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="direc"><code>*</code> Direccion</label>
                                            <input type="text" class="form-control dir" id="direc" value="<%=con.getDireccion()%>" name="direccion" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="pass"><code>*</code> Contraseña</label>
                                            <input type="text" class="form-control pass" id="pass" value="<%=con.getClave()%>" name="contra" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <!--<label for="formGroupExampleInput">Estado</label>-->
                                            <input class="form-control" id="inputEmail4 est" name="estado" value="<%=con.getEstado()%>" readonly="readonly" type="hidden">
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <!--<label for="formGroupExampleInput">Roll</label>-->
                                            <input type="hidden" class="form-control roll" id="inputEmail4" name="rol" value="<%=con.getRol()%>" readonly="readonly">
                                        </div>
                                        
                                        <% } %>
                                        
                                        <div class="text-center mt-2">
                                            <button type="submit" class="btn btn-outline-entre waves-effect ml-auto btnmod mt-4" name="ActualizaCli">Actualizar
                                                <i class="fa fa-sign-in ml-1"></i>
                                            </button>
                                        </div>

                                    </div>
                                </form>
                                <!--Footer-->
                                <div class="container">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline-entre waves-effect ml-auto" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/.Panel 8-->
                    </div>

                </div>
            </div>
            <!--/.Content-->
        </div>

        <!--<section id="slider">
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-7">
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"></li>
                                <li data-target="#carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (1).jpeg" alt="First slide">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Auto</h3>
                                        <p class="lead d-none d-sm-block">Mercedes</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (2).jpeg" alt="Second slide">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Title</h3>
                                        <p class="lead d-none d-sm-block">lorem</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (3).jpeg" alt="Third slide">
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
                    <div class="col-md-5 mt-4">
                        <div class="card border-0 mb-4">
                            <div class="card-body p-5">
                                <h3><span class="badge badge-secondary bg-dark text-light mb-2">Starter</span></h3>
                                <p class="lead mb-4">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                <h2 class="mb-0">$ 3.500/mes</h2>
                                <p class="lead text-muted mb-4">200 pesos por dia</p>
                                <p class="lead font-weight-bold">Productos mas vendidos</p>
                                <ul class="list-unstyled mb-5">
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-dark mr-2" aria-hidden="true"></i> Mini Box
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-dark mr-2" aria-hidden="true"></i> Matrimonios
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-dark mr-2" aria-hidden="true"></i> Arreglos de mesa
                                    </li>
                                    <li class="text-dark">Conoce mas <i class="fa fa-arrow-right" aria-hidden="true"></i></li>
                                </ul>
                                <a href="#" class="btn btn-secondary">Ingresa Aqui</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <h2 class="text-dark">Historias que se deven contar</h2>
                <p class="lead text-muted">Nos sentimos muy felices que los podamos llenar de detalles</p>
                <div class="row mt-6">
                    <div class="col-md-4">
                        <div class="blog-item position-relative rouded mb-5">
                            <a href="#">
                                <div class="blog-info position-absolute">
                                    <p class="text-gold mb-3"><span class="font-wight-boild">Diseños</span> - Mini Box</p>
                                    <h3>Mejores diseños</h3>
                                </div>
                                <img src="Vista/img/Funk.jpg" class="img-fluid rounded">
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="blog-item position-relative rouded mb-5">
                            <a href="#">
                                <div class="blog-info position-absolute">
                                    <p class="text-gold mb-3"><span class="font-wight-boild">Diseños</span> - Mini Box</p>
                                    <h3 class="text-dark">Mejores diseños</h3>
                                </div>
                                <img src="Vista/img/Pandereta.jpg" class="img-fluid rounded">
                            </a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="blog-item position-relative rouded mb-5">
                            <a href="#">
                                <div class="blog-info position-absolute">
                                    <p class="text-gold mb-3"><span class="font-wight-boild">Diseños</span> - Mini Box</p>
                                    <h3>Mejores diseños</h3>
                                </div>
                                <img src="Vista/img/Pop.jpg" class="img-fluid rounded">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-6">
                    <p class="text-gold">Gracias por visitar nuestra pagina</p>
                    <a href="#" class="text-muted">Ver todos nuestros diseños <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </section>-->
        
        <section>
            <div class="container text-center">
                <h3>Los mejores Diseños</h3>
            </div>
            <hr>
            <div class="container">
                <div class="row">
                    <%
                        ArrayList<Disenogetset> listasD = new ArrayList<>();
                        Disenogetset dis = new Disenogetset();
                        GestionDiseno muestra = new GestionDiseno();
                        listasD = muestra.ConsultarDisenos();
                        for(int i = 0; i < listasD.size(); i++){
                            dis = listasD.get(i); %>
                    <div class="col-md-3">
                        <div class="card">
                            <img 
                            title="Productos con medidas de <%= dis.getTexDiseno() %>"
                            alt="Diseño con color <%= dis.getColDiseno()%>"
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
        <script>
            $(function(){
                $('[data-toggle="popover"]').popover()
            });
        </script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <!--<script src="Styles/js/bootstrap.min.js"></script>-->
        <script src="Styles/js/popper.min.js"></script>
        <script src="Vista/usuario.js"></script>
        <!--<script src="Vista/js/ModificaClienteUni.js"></script>-->
    </body>
</html>
