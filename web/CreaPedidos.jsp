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
        <%
            ArrayList<Articulo_gs> lista = new ArrayList<>();
            Articulo_gs arti = new Articulo_gs();
            ArticuloSelect opti = new ArticuloSelect();
            lista = opti.listaArticulo();
        %>
        <div class="container">
            <form action="ServletPedidos" method="POST">
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="documento"><code>*</code> Documento</label>
                        <input type="text" class="form-control" id="documento" name="documento" value="<%=docu%>"readonly="readonly">
                    </div>
                    <div class="form-group col-md-3">
                        <!--<label for="estado"><code>*</code> Estado</label>-->
                        <input type="hidden" class="form-control" id="estado" name="estado" value="Pedido" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="dateini"><code>*</code> Fecha Pedido</label>
                        <input type="date" class="form-control" id="dateini" name="fepedido" min="">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="detefin"><code>*</code> Fecha Entrega</label>
                        <input type="date" class="form-control" id="datefin" name="feentrega">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="direccion"><code>*</code> Direccion Entrega</label>
                        <input type="text" class="form-control" id="direccion" name="direntrega" value="<%=direcc%>">
                    </div>
                    <div class="form-group col-md-2">
                        <!--<label for="tipo"><code>*</code> Tipo</label>-->
                        <input type="hidden" class="form-control" id="tipo" name="tipo" value="Distribucion" readonly="readonly">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="articulo"><code>*</code> Nombre Articulo</label>
                        <select class="form-control" id="articulo" name="arti">
                            <option value="">Seleccionar</option>
                            <%
                                for(int i = 0; i < lista.size(); i++){
                                    arti = lista.get(i);
                            %>
                            <option value="<%=arti.getId()%>"><%=arti.getNombre()%><% } %></option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" name="CargaPed">Registrar</button>
            </form>
        </div>
        <div class="container">
            <footer class="page-footer font-small blue fixed-bottom">
                <div class="footer-copyright text-center py-3">© 2020 Copyright:
                    <a href="https://mdbootstrap.com/education/bootstrap/"> EntreSueños.com</a>
                </div>
            </footer>
        </div>
        <Script>
            (function (){
                fecha = new Date();
                var dia = fecha.getDate();
                var dia2 = fecha.getDate()+6;
                var mes = fecha.getMonth()+1;
                var year = fecha.getFullYear();
                if(dia<10){
                    dia='0'+dia;
                }
                if(dia2<10){
                    dia='0'+dia;
                }
                if(mes<10){
                    mes = '0'+mes;
                }
                var f = year+"-"+mes+"-"+dia;
                var f2 = year+"-"+mes+"-"+dia2;
//                alert(f);
                var da = document.getElementsByTagName('input');
                da[3].value = f;
                da[4].value = f2;
            }());
        </Script>
    </body>
</html>
