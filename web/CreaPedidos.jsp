<%@page import="Modelo.DisenoSelect"%>
<%@page import="Modelo.Diseno_gs"%>
<%@page import="Modelo.ArticuloSelect"%>
<%@page import="Modelo.Articulo_gs"%>
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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <title>Entre Sueños</title>
        <link href="Vista/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link href="Vista/css/StylesU.css" rel="stylesheet" type="text/css"/>
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
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="VAH Logo"></a>
                </div>
                <a class="navbar-brand" href="<%=roll%>.jsp">INICIO</a>
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
        <%
            ArrayList<Articulo_gs> lista = new ArrayList<>();
            Articulo_gs arti = new Articulo_gs();
            ArticuloSelect opti = new ArticuloSelect();
            lista = opti.listaArticulo();
        %>
        <%
            ArrayList<Diseno_gs> arra = new ArrayList<>();
            Diseno_gs dise = new Diseno_gs();
            DisenoSelect sele = new DisenoSelect();
            arra = sele.SelectDiseno();
        %>
        <section>
            <!--Registra un pedido-->
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <form action="" method="POST">
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="documento"><code>*</code> Documento</label>
                                    <input type="text" class="form-control documento" id="documento" name="documento" value="<%=docu%>" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <!--<label for="estado"><code>*</code> Estado</label>-->
                                    <input type="hidden" class="form-control estado" id="estado" name="estado" value="Pedido" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="dateini"><code>*</code> Fecha Pedido</label>
                                    <input type="date" class="form-control dateini" id="dateini" name="fepedido" min="">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="detefin"><code>*</code> Fecha Entrega</label>
                                    <input type="date" class="form-control datefin" id="datefin" name="feentrega">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="direccion"><code>*</code> Direccion Entrega</label>
                                    <input type="text" class="form-control direccion" id="direccion" name="direntrega" value="<%=direcc%>">
                                </div>
                                <div class="form-group col-md-10">
                                    <!--<label for="tipo"><code>*</code> Tipo</label>-->
                                    <input type="hidden" class="form-control tipo" id="tipo" name="tipo" value="Distribucion" readonly="readonly">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="articulo"><code>*</code> Nombre Articulo</label>
                                    <select class="form-control articulo" id="articulo" name="articulo">
                                        <option value="">Seleccionar</option>
                                        <%
                                            for(int i = 0; i < lista.size(); i++){
                                                arti = lista.get(i);
                                        %>
                                        <option value="<%=arti.getId()%>"><%=arti.getNombre()%><% } %></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="diseno"><code>*</code> Nombre del diseño</label>
                                    <select name="diseno" id="diseno" class="form-control diseno">
                                        <option value="">Seleccionar</option>
                                        <% for(int a = 0; a < arra.size(); a++){ 
                                            dise = arra.get(a);
                                        %>
                                            <option value="<%=dise.getCod() %>"><%=dise.getNombre()%><% } %></option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="descripcion"><code>*</code> Descripcion</label>
                                    <input type="text" class="form-control descripcion" id="descripcion" name="descripcion" min="">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="cantidad"><code>*</code> Cantidad</label>
                                    <input type="text" class="form-control cantidad" id="cantidad" name="cantidad">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-10">
                                    <label for="precio"><code>*</code> Precio</label>
                                    <input type="text" class="form-control precio" id="precio" name="precio">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-entre btnEnviar" name="CargaPed">Registrar</button>
                        </form>
                    </div>
                    <div class="col-md-6 mt-5">
                        <h3 class="mb-4 text-center">Los mejores diseños</h3>
                        <div id="carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel" data-slide-to="1"></li>
                                <li data-target="#carousel" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="Vista/img/img-1.jpg" alt="First slide">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Paseos</h3>
                                        <p class="lead d-none d-sm-block">Lo mejor</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/img-2.jpg" alt="Second slide">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Title</h3>
                                        <p class="lead d-none d-sm-block">lorem</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img class="d-block w-100" src="Vista/img/img-3.jpg" alt="Third slide">
                                    <div class="carousel-caption">
                                        <h3 class="d-block">Noche</h3>
                                        <p class="lead d-none d-sm-block">Desayunos</p>
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
        <script src="Vista/js/RegistraPedido.js" type="text/javascript"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script> 
        <Script>
            (function (){
                fecha = new Date();
                
                var dia = fecha.getDate();
                var finmes = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
                var ultimo = finmes[fecha.getMonth()]; //console.log(ultimo);
                var dia2 = fecha.getDate() + 6;
                var mes = fecha.getMonth()+1;
                var mes2 = fecha.getMonth()+1;
                var year = fecha.getFullYear();
                if(ultimo === 30){
                    if(dia2 === 31){dia2 = 1; mes2 = mes2 + 1;}
                    if(dia2 === 32){dia2 = 2; mes2 = mes2 + 1;}
                    if(dia2 === 33){dia2 = 3; mes2 = mes2 + 1;}
                    if(dia2 === 34){dia2 = 4; mes2 = mes2 + 1;}
                    if(dia2 === 35){dia2 = 5; mes2 = mes2 + 1;}
                    if(dia2 === 36){dia2 = 6; mes2 = mes2 + 1;}
                }
                if(ultimo === 31){
                    if(dia2 === 32){dia2 = 1; mes2 = mes2 + 1;}
                    if(dia2 === 33){dia2 = 2; mes2 = mes2 + 1;}
                    if(dia2 === 34){dia2 = 3; mes2 = mes2 + 1;}
                    if(dia2 === 35){dia2 = 4; mes2 = mes2 + 1;}
                    if(dia2 === 36){dia2 = 5; mes2 = mes2 + 1;}
                    if(dia2 === 37){dia2 = 6; mes2 = mes2 + 1;}
                }
                if(dia<10){
                    dia='0'+dia;
                }
                if(dia2<10){
                    dia2='0'+dia2;
                }
                if(mes<10){
                    mes = '0'+mes;
                }
                if(mes2<10){
                    mes2 = '0'+mes2;
                }
                var f = year+"-"+mes+"-"+dia; //console.log(f);
                var f2 = year+"-"+mes2+"-"+dia2;
//                var f2 = (f + 6);
//                alert(f2);
                var da = document.getElementsByTagName('input');
                da[3].value = f;
                da[4].value = f2;
            }());
        </Script>
    </body>
</html>
