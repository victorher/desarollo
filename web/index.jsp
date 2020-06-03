<%-- 
    Document   : index
    Created on : 28/04/2020, 02:59:03 PM
    Author     : PC1
--%>

<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/Suenos.png">
        <title>Entre Sueños</title>
        <!-- MDB icon -->
        <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="MBD/css/bootstrap.min.css">
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="MBD/css/mdb.min.css">
        <!-- Your custom styles (optional) -->
        <link rel="stylesheet" href="MBD/css/style.css">
        <!-- jQuery -->
        <script type="text/javascript" src="MBD/js/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="MBD/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="MBD/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="MBD/js/mdb.min.js"></script>
        <!-- Your custom scripts (optional) -->
        <script type="text/javascript"></script>
    </head>
    <body>
        <!--Navbar -->
        <nav class="mb-1 navbar navbar-expand-lg  nav" color-on-scroll="300">
            <div class="container">
                <a class="navbar-brand text-secondary" href="index.jsp">
                    <img src="img/Suenos.png" width="40" height="30" class="d-inline-block align-top"> Entre Sueños</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
                  aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                      <a class="nav-link text-secondary" href="index.jsp">Inicio
                        <span class="sr-only">(current)</span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link text-secondary" href="#">Nosotros</a>
                    </li>
<!--                    <li class="nav-item">
                      <a class="nav-link text-secondary" href="#">Pricing</a>
                    </li>-->
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle text-secondary" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">Categorias
                      </a>
                      <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
                        <a class="dropdown-item" href="#">Desayunos</a>
                        <a class="dropdown-item" href="#">15 Años</a>
                        <a class="dropdown-item" href="#">Arreglos de mesa</a>
                      </div>
                    </li>
                  </ul>
                  <ul class="navbar-nav ml-auto nav-flex-icons">
                    <li class="nav-item">
                      <a class="nav-link waves-effect waves-light">
                        <i class="fab fa-instagram"></i>
                      </a>
                    </li>  
                    <li class="nav-item">
                      <a class="nav-link waves-effect waves-light">
                        <i class="fab fa-twitter"></i>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link waves-effect waves-light">
                        <i class="fab fa-google-plus-g"></i>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link waves-effect waves-light" data-toggle="modal" data-target="#modalLRForm1">
                        <i class="fas fa-user"></i>
                      </a>

                    </li>
                  </ul>
                </div>
            </div>    
        </nav>
        <!--/.Navbar -->
        
        <!--Modal: Login / Register Form-->
        <div class="modal fade" id="modalLRForm1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-body l">
                        <ul class="nav md-pills nav-justified pills-info" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link border border-info border-rounded active" data-toggle="tab" href="#panel7" role="tab" aria-selected="true"><i class="fas fa-user mr-1"></i>
                                Login</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link border border-info border-rounded show" data-toggle="tab" href="#panel8" role="tab" aria-selected="false"><i class="fas fa-user-plus mr-1"></i>
                                Register</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <!--Panel 7-->
                            <div class="tab-pane fade in show active" id="panel7" role="tabpanel">
                                <form action="ServletLogin" method="POST" class="register-form">
                                    <!--Body-->
                                    <div class="modal-body mb-1">
                                      <div class="md-form form-sm mb-5">
                                        <i class="fas fa-envelope prefix"></i>
                                        <input type="number" id="modalLRInput10 usu" class="form-control form-control-sm validate usu" name="usu">
                                        <label data-error="wrong" data-success="right" for="modalLRInput10">Documento</label>
                                      </div>

                                      <div class="md-form form-sm mb-4">
                                        <i class="fas fa-lock prefix"></i>
                                        <input type="password" id="modalLRInput11 con" class="form-control form-control-sm validate con" name="con">
                                        <label data-error="wrong" data-success="right" for="modalLRInput11">Contraseña</label>
                                      </div>
                                      <div class="text-center mt-2">
                                        <button class="btn btnn text-light" name="btnlogin">Iniciar Sesion <i class="fas fa-sign-in ml-1"></i></button>
                                      </div>
                                    </div>
                                    <!--Footer-->
                                    <div class="modal-footer">
                                      <div class="options text-center text-md-right mt-1">
                                        <p>Not a member? <a href="#" class="blue-text">Sign Up</a></p>
                                        <p>Forgot <a href="#" class="blue-text">Password?</a></p>
                                      </div>
                                      <button type="button" class="btn btn-outline-info waves-effect ml-auto"  data-dismiss="modal">Close</button>
                                    </div>
                                </form>    
                            </div>
                            <!--/.Panel 7-->

                            <!--Panel 8-->
                            <div class="tab-pane fade" id="panel8" role="tabpanel">
                                <form action="ServletGestionUsu" method="POST">
                                    <!--Body-->
                                    <div class="modal-body">
                                      <div class="form-row">
                                          <div class="md-form form-sm col-md-6">
                                            <i class="far fa-address-card prefix"></i>
                                            <input type="number" id="modalLRInput12 documento" class="form-control form-control-sm validate documento" name="documento">
                                            <label data-error="wrong" data-success="right" for="modalLRInput12">Documento</label>
                                          </div>

                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-ad prefix"></i>
                                            <input type="text" id="modalLRInput13 nombre" class="form-control form-control-sm validate nombre" name="nombre">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Nombre</label>
                                          </div>
                                      </div>
                                      <div class="form-row">
                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-ad prefix"></i>
                                            <input type="text" id="modalLRInput13 apellido" class="form-control form-control-sm validate apellido" name="apellido">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Apellido</label>
                                          </div>

                                          <div class="form-group form-sm col-md-6"> 
                                              <i class="fas fa-venus-mars fa-2x"></i>
                                                  <label for="genero">Genero</label>
                                                      <select name="sexo" id="sexo" class="form-control sexo">
                                                          <option value="0">Seleccion</option>
                                                          <option value="Masculino">Masculino</option>
                                                          <option value="Femenino">Femenino</option>
                                                      </select>  
                                          </div>  
                                      </div>
                                      <div class="form-row">   
                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-envelope prefix"></i>
                                            <input type="email" id="modalLRInput13 correo" class="form-control form-control-sm validate correo" name="correo">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Correo</label>
                                          </div>

                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-mobile-alt prefix"></i>
                                            <input type="text" id="modalLRInput13 telefono" class="form-control form-control-sm validate telefono" name="telefono">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Telefono</label>
                                          </div>
                                      </div>
                                      <div class="form-row">    
                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-map-marker prefix"></i>
                                            <input type="text" id="modalLRInput13 direccion" class="form-control form-control-sm validate direccion" name="direccion">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Direccion</label>
                                          </div>

                                          <div class="md-form form-sm col-md-6">
                                            <i class="fas fa-lock prefix"></i>
                                            <input type="password" id="modalLRInput13 contra" class="form-control form-control-sm validate contra" name="contra">
                                            <label data-error="wrong" data-success="right" for="modalLRInput13">Contraseña</label>
                                          </div>  
                                      </div>

                                      <div class="md-form form-sm mb-5">
                                          <input class="form-control estado" id="inputEmail4 estado" name="estado" value="1" readonly="readonly" type="hidden">
                                          <input type="hidden" class="form-control rol" id="inputEmail4 rol" name="rol" value="Cliente" readonly="readonly">
                                      </div>    

                                      <div class="text-center form-sm mt-2">
                                          <button class="btn btnn text-light" type="submit" name="CargaCli">Registrarse<i class="fas fa-sign-in ml-1"></i></button>
                                      </div>

                                    </div>
                                    <!--Footer-->
                                    <!--<div class="modal-footer">
                                      <div class="options text-right">
                                        <p class="pt-1">Already have an account? <a href="#" class="blue-text">Log In</a></p>
                                      </div>
                                      <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                                    </div>-->
                                  </form>
                            </div>
                            
                            <!--/.Panel 8-->
                          </div>
                    </div>
                </div>
            </div> 
        </div>
        <%
            ArrayList<Disenogetset> List = new ArrayList<Disenogetset>();
            Disenogetset Dgs = new Disenogetset();
            GestionDiseno Dis = new GestionDiseno();

            List=Dis.ConsultarDisenos();
        %>
        <div class="container border rounded-lg cont view overlay mt-3">
            <img src="img/Entreseunos.png">
            <a>
                <div class="mask rgba-white-slight"></div>
            </a>
        </div>
        
        <div class="container">
            <div class="col-12 divisor"></div> 
            <div class="row">
                <% for(int i=0; i<List.size(); i++){
                   Dgs=List.get(i);
                %>
              
                <div class="col-md-3 mb-4">
                   
                        <div class="card view overlay">
                            <img 
                                src="img/<%=Dgs.getImagen()%>" 
                                class="card-img-top img-fluid img-thumbnail" 
                                alt="...">
                            <a>
                                <div class="mask rgba-white-slight"></div>
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">$ <%=Dgs.getPreDiseno()%>.00</h5>
                                <!--<p class="card-text"><%=Dgs.getObserDiseno()%></p>-->
                                <a href="#" class="btn btn-lg btn-secondary">Comprar</a>
                            </div>
                        </div>
                </div>    
                
                <% } %>
            </div>
        </div>
        
       
        
      
    </body>
</html>
