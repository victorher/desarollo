<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    response.setHeader("Pragma", "no-cache");
    response.addHeader("Cache-control", "must-revalidate");
    response.addHeader("Cache-control", "no-cache");
    response.addHeader("Cache-control", "no-store");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" href="Styles/css/Index.css">
        
        
    </head>
    <body>
        <!--<div class="pos-f-t">
            <div class="container">
                <form action="ServletLogin" method="POST" class="login-form">
                    <h1>Bienvenid@</h1>
                    <div class="txtb">
                        <input type="text" name="usu">
                        <span data-placeholder="Nombre de Usuario"></span>
                    </div>
                    <div class="txtb">
                        <input type="password" name="con">
                        <span data-placeholder="Contraseña"></span>
                    </div>
                    <input type="submit" class="logbtn" value="Ingresar" name="btnlogin">
                    <div class="bottom-text">
                        No tienes cuenta? <a href="#">Ingresa aquí</a>
                    </div>
                </form>
                <script type="text/javascript">
                    $(".txtb input").on("focus",function(){
                       $(this).addClass("focus");
                    });

                    $(".txtb input").on("blur",function(){
                       if($(this).val() == "")
                       $(this).removeClass("focus");
                    });
                </script>
            </div>
        </div>-->
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
                        <li class="nav-item">
                            <a class="nav-link" href="#"></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Hogar
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Desayunos</a>
                                <a class="dropdown-item" href="#">Arreglos</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Obsequios</a>
                            </div>
                        </li>
<!--                        <li class="nav-item">
                            <a class="nav-link disabled" href="#">Disabled</a>
                        </li>-->
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre orm-control mr-sm-2" type="button" data-toggle="modal" data-target="#login">Login</button>
                    </form>
                    <form class="form-inline my-2 my-lg-0">
                        <button class="btn btn-entre orm-control mr-sm-2" type="button" data-toggle="modal" data-target="#register">Resgister</button>
                    </form>
                </div>
            </div>
        </nav>

        <!--Ingresar al sistema-->
        <div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog cascading-modal" role="document">
                <!--Content-->
                <div class="modal-content bg-light-grey">
                    <div class="modal-header">
                        <h5 class="modal-title">Ingresar usuario registrado</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--Modal cascading tabs-->
                    <div class="modal-con-tabs">
                        <!--Panel 7-->
                        <div class="container">
                            <div class="tab-pane fade in show active" id="panel7" role="tabpanel">
                                <form action="ServletLogin" method="POST" class="register-form">
                                    <!--Body-->
                                    <div class="modal-body mb-1">
                                        <div class="input-group md-form form-sm mb-3">
<!--                                            <i class="fa fa-group prefix"></i>-->
                                            <div class="input-group-append">
                                                <span class="input-group-text">
                                                    <i class="fa fa-user" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                            <input type="text" id="modalLRInput10" class="form-control form-control-sm validate" name="usu" placeholder="Usuario">
<!--                                            <label data-error="wrong" data-success="right" for="modalLRInput10">Usuario</label>-->
                                        </div>

                                        <div class="input-group md-form form-sm mb-3">
                                            <div class="input-group-append">
                                                <span class="input-group-text">    
                                                    <i class="fa fa-lock prefix" aria-hidden="true"></i>
                                                </span>
                                            </div>
                                            <input type="password" id="pass" class="form-control form-control-sm validate" name="con" placeholder="Contraseña">
<!--                                            <label data-error="wrong" data-success="right" for="modalLRInput11">Contraseña</label>-->
                                            <div class="input-group-append sp-span">
                                                <span class="input-group-text">    
                                                    <i class="fa fa-eye" aria-hidden="true" id="show"></i>
                                                </span>
                                            </div>
                                        </div>
                                        <div class="text-center mt-2">
                                            <button class="btn btn-entre" name="btnlogin">Ingresar 
                                                    <i class="fa fa-sign-in ml-1"></i>
                                                </button>
                                        </div>
                                    </div>
                                </form>
                                <!--Footer-->
                                <div class="container">
                                    <div class="modal-footer">
                                        <div class="options text-center text-md-right mt-1">
                                            <p>Not a member? <a href="#" class="blue-text bg-orange">Sign Up</a></p>
                                            <p>Forgot <a href="#" class="blue-text bg-orange">Password?</a></p>
                                        </div>
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

        <!--Registrarse-->
        <div class="modal fade" id="register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog cascading-modal" role="document">
                <!--Content-->
                <div class="modal-content bg-light-grey">
                    <div class="modal-header">
                        <h5 class="modal-title">Registrarse</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!--Modal cascading tabs-->
                    <div class="modal-con-tabs">
                        <!--Panel 7-->
                        <div class="container">
                            <div class="tab-pane fade in show active" id="panel7" role="tabpanel">
                                <form action="ServletGestionUsu" method="POST" class="register-form">
                                    <!--Body-->
                                    <div class="modal-body mb-1">

                                        <div class="md-form form-sm mb-2">
                                            <label for="documento"><code>*</code> Documento</label>
                                            <input type="text" class="form-control" id="documento" placeholder="Documento" name="documento" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="nombre"><code>*</code> Nombre</label>
                                            <input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nombre" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="apellido"><code>*</code> Apellido</label>
                                            <input type="text" class="form-control" id="apellido" placeholder="Apellido" name="apellido" required>
                                        </div> 

                                        <div class="form-group form-sm mb-2">       
                                            <label for="genero">Genero</label>
                                            <select name="sexo" id="genero" class="form-control">
                                                <option value="0">Seleccion</option>
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </select>  
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="mail"><code>*</code> Correo</label>
                                            <input type="email" class="form-control" id="mail" placeholder="Correo" name="correo" required>
                                        </div> 

                                        <div class="md-form form-sm mb-2">
                                            <label for="telefono"><code>*</code> Telefono</label>
                                            <input type="text" class="form-control" id="telefono" placeholder="Telefono" name="telefono" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="direc"><code>*</code> Direccion</label>
                                            <input type="text" class="form-control" id="direc" placeholder="Direccion" name="direccion" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <label for="pass"><code>*</code> Contraseña</label>
                                            <input type="text" class="form-control" id="pass" placeholder="Contraseña" name="contra" required>
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <!--<label for="formGroupExampleInput">Estado</label>-->
                                            <input class="form-control" id="inputEmail4" name="estado" value="1" readonly="readonly" type="hidden">
                                        </div>

                                        <div class="md-form form-sm mb-2">
                                            <!--<label for="formGroupExampleInput">Roll</label>-->
                                            <input type="hidden" class="form-control" id="inputEmail4" name="rol" value="Cliente" readonly="readonly">
                                        </div>

                                        <div class="text-center mt-2">
                                            <button type="submit" class="btn btn-outline-entre waves-effect ml-auto" name="CargaCli">Registrar
                                                <i class="fa fa-sign-in ml-1"></i>
                                            </button>
                                        </div>

                                    </div>
                                </form>
                                <!--Footer-->
                                <div class="container">
                                    <div class="modal-footer">
                                        <div class="options text-center text-md-right mt-1">
                                            <p>Not a member? <a href="#" class="blue-text bg-orange">Sign Up</a></p>
                                            <p>Forgot <a href="#" class="blue-text bg-orange">Password?</a></p>
                                        </div>
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

        <section id="slider">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (2).jpeg" alt="Second slide" height="550" width="300">
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (1).jpeg" alt="First slide" height="550" width="300">
                        <div class="carousel-caption">
                            <h3 class="d-block">Auto</h3>
                            <p class="lead d-none d-sm-block">Mercedes</p>
                        </div>
                    </div>


                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM (3).jpeg" alt="Third slide" height="550" width="300">
                        <div class="carousel-caption">
                            <h3 class="d-block">Noche</h3>
                            <p class="lead d-none d-sm-block">Noche</p>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.03 PM.jpeg" alt="Third slide" height="550" width="300">
                        <div class="carousel-caption">
                            <h3 class="d-block">Ruin</h3>
                            <p class="lead d-none d-sm-block">Ruin</p>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.04 PM (1).jpeg" alt="Third slide" height="550" width="300">
                        <div class="carousel-caption">
                            <h3 class="d-block">Tecno</h3>
                            <p class="lead d-none d-sm-block">Tecno</p>
                        </div>
                    </div>

                    <div class="carousel-item">
                        <img class="d-block w-100" src="Vista/img/WhatsApp Image 2020-02-25 at 8.04.04 PM.jpeg" alt="Third slide" height="550" width="300">
                        <div class="carousel-caption">
                            <h3 class="d-block">Theroads</h3>
                            <p class="lead d-none d-sm-block">Theroads</p>
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
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <h2 class="text-light">Entre Sueños</h2>
                        <p class="lead text-muted">Los mejores diseños para tu gusto</p>

                        <div class="mt-6">
                            <a href="#">
                                <img src="Vista/img/WhatsApp Image 2020-02-25 at 8.13.50 PM.jpeg" class="image-fluid" width="540px">
                                <div class="bg-light p-4">
                                    <h4 style="color: black;">Es una prueba</h4>
                                    <p class="text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                </div>
                            </a>
                        </div>
                        <div class="mt-6">
                            <a href="#">
                                <img src="Vista/img/Metalica.jpg" class="image-fluid" width="540px">
                                <div class="bg-light p-4">
                                    <h4 style="color: black;">Es una prueba</h4>
                                    <p class="text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="mt-6">
                            <a href="#">
                                <img src="Vista/img/My chemical romance.jpg" class="image-fluid" width="540px">
                                <div class="bg-light p-4">
                                    <h4 style="color: black;">Es una prueba</h4>
                                    <p class="text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                </div>
                            </a>
                        </div>
                        <div class="mt-6">
                            <a href="#">
                                <img src="Vista/img/One Direction.jpg" class="image-fluid" width="540px">
                                <div class="bg-light p-4">
                                    <h4 style="color: black;">Es una prueba</h4>
                                    <p class="text-muted mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-6">
                    <p class="text-gold">Gracias por visitar nuestra pagina</p>
                    <a href="#" class="text-muted">Ver todos nuestros diseños <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
                </div>
            </div>
        </section>

        <section class="bg-light-grey">
            <div class="container">
                <h2>Creando nuevos diseños</h2>
                <p class="lead text-muted">Los diseños que creamos los hacemos para que te sientes una mejor experiensia</p>

                <div class="row mt-6">
                    <div class="col-md-6">
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
                    <div class="col-md-6">
                        <div class="card bg-dark border-0 mb-4">
                            <div class="card-body p-5">
                                <h3><span class="badge badge-secondary bg-gold text-dark mb-2">Enterprice</span></h3>
                                <p class="lead mb-4 text-light">Lorem ipsum dolor sit amet consectetur adipisicing elit.</p>
                                <h2 class="mb-0 text-light">$ 5.500/mes</h2>
                                <p class="lead text-muted mb-4 text-light">300 pesos por dia</p>
                                <p class="lead font-weight-bold text-light">Productos mas vendidos</p>
                                <ul class="list-unstyled mb-5">
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-gold mr-2" aria-hidden="true"></i> Mini Box
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-gold mr-2" aria-hidden="true"></i> Matrimonios
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="fa fa-check-circle lead text-gold mr-2" aria-hidden="true"></i> Arreglos de mesa
                                    </li>
                                    <li class="text-light">Conoce mas <i class="fa fa-arrow-right" aria-hidden="true"></i></li>
                                </ul>
                                <a href="#" class="btn btn-gold">Ingresa Aqui</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-6 bg-dark p-4 border-0">
                    <div class="row d-flex">
                        <div class="col-md-8">
                            <h3 class="text-light mb-0 d-inline-block">Proximamente</h3>
                            <p class="text-muted mb-0">Son nuevos diseños que te deslumbraran</p>
                        </div>
                        <div class="col-md-4 align-self-center text-lg-right text-left">
                            <a href="" class="btn btn-primary ml-auto d-inline-block my-2">Ingresa</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section>
            <div class="container">
                <h2 class="text-light">Historias que se deven contar</h2>
                <p class="lead text-light">Nos sentimos muy felices que los podamos llenar de detalles</p>
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
                                    <h3>Mejores diseños</h3>
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
                    <a href="#" class="text-light">Ver todos nuestros diseños <i class="fa fa-arrow-right" aria-hidden="true"></i></a>
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
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Numero telefonico">
                            </div>
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
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/js/mostrarpass.js"></script>
    </body>
</html>
