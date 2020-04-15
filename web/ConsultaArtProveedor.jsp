<%@page import="Modelo.GestionArtCategoria"%>
<%@page import="Modelo.CatArticulogetset"%>
<%@page import="javax.swing.JOptionPane"%>
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
        <title>Entre Suenos</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
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
                                <a class="dropdown-item" href="#">Diseños</a>
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
                                <a class="dropdown-item" href="#">Pedidos</a>
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
                </div> 
            </div>
        </nav>
        <div class="container">
        </div>
        <script type="text/javascript">
            function Eliminar(){
                var Respuesta = confirm("Desea eliminar este registro?");
                if(Respuesta===true){
                    return true;
                }else{
                    return false;
                }
            }
        </script>
        </div><br><br>
        <div class="container container-cards mt-2">
            <div class="table">
                <!--ServletCatArticulo-->
                <form action="" method="POST">
                    <table class="table-responsive table-hover table-borderless table-sm">
                        <thead>
                            <tr class="btn-success">
                                <th scope="col" class="text-center">Codigo</th>
                                <th scope="col" class="text-center">Nombre</th>
                                <th scope="col" class="text-center">Descripcion</th>
                                <th scope="col">Actualizar</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<CatArticulogetset> listas = new ArrayList();
                                CatArticulogetset con = new CatArticulogetset(); //convas hago referencia al constructor vasio
                                GestionArtCategoria Cons = new GestionArtCategoria();

                                listas = Cons.ConsultarCatArticulo();

                                for(int i=0; i<listas.size(); i++){

                                    con = listas.get(i);
                            %>

                            <tr>
                                <td class="text-center"><input size="5" type="text" class="input-group-text text-center border-0 idcat" value="<%=con.getID()%>" name="id"></td>
                                <td class="text-center"><input size="15" type="text" class="input-group-text text-center border-0 artno" value="<%=con.getNom()%>" name="nombre"></td>
                                <td class="text-center"><input size="70" type="text" class="input-group-text text-center border-0 descr" value="<%=con.getCat()%>" name="descripcion"></td>
                                <td>
                                    <input type="hidden" name="proveedorID" value="<%=con.getID()%>">
                                    <div class="text-center">
                                        <button type="submit" name="ActualizaArt" class="btn-success img-fluid btnmod">
                                            <i class="fa fa-wrench" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </td>
                                <td>
                                    <input type="hidden" name="cod" value="<%=con.getID()%>">
                                    <div class="text-center">
                                        <button type="submit" name="EliminaArt" class="btn-danger img-fluid" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>        
        <div class="container">
            <footer class="page-footer font-small blue fixed-bottom">
                <div class="footer-copyright text-center py-3">© 2020 Copyright:
                    <a href="https://mdbootstrap.com/education/bootstrap/"> EntreSuenos.com</a>
                </div>
            </footer>
        </div>
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Vista/js/modificaArtpro.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
    </body>
</html>