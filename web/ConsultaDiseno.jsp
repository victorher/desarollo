<%@page import="javax.swing.JOptionPane"%>
<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<%
    try {
         response.setHeader("Pragma", "no-cache");
         response.addHeader("Cache-control", "must-revalidate");
         response.addHeader("Cache-control", "no-cache");
         response.addHeader("Cache-control", "no-store");
         if(session.getAttribute("Documento") == null){
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
                                <a class="dropdown-item" href="#">Pedidos</a>
                                <a class="dropdown-item" href="#">Disenos</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"><%=roll%></a>
                        </li>
                    </ul>
                    <form action="CerrarSesion" method="POST" class="form-inline my-2 my-lg-0">
                        <input class="btn btn-entre form-control mr-sm-2" type="submit" name="btn" value="Cerrar Sesion">
                    </form>
                </div>
            </div>
        </nav>
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
        
        <div class="container container-cards mt-5">
            <div class="table">
                <form action="" enctype="multipart/form-data" method="POST">
                    <table class="table-responsive table-hover table-borderless table-sm">
                        <thead>
                            <tr class="btn-danger">
                                <th scope="col">Codigo</th>
                                <th scope="col">Numero</th>
                                <th scope="col">Texto</th>
                                <th scope="col">Tamano</th>
                                <th scope="col">Color</th>
                                <th scope="col">Precio</th>
                                <th scope="col">Observaciones</th>
                                <th scope="col">Imagen</th>
                                <!--<th scope="col">ModImagen</th>-->
                                <th scope="col">Actualizar</th>
                                <th scope="col">Eliminar</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  ArrayList<Disenogetset> listas = new ArrayList();
                                Disenogetset con = new Disenogetset(); //convas hago referencia al constructor vasio
                                GestionDiseno Cons = new GestionDiseno();

                                listas = Cons.ConsultarDisenos();

                                for(int i=0; i<listas.size(); i++){

                                    con = listas.get(i); %>
                                <tr>
                                    <td><input type="text" class="input-group-text table text-center border-0 iddis" value="<%=con.getIDDiseno()%>"></td>
                                    <td><input type="text" class="input-group-text table text-center border-0 nudeta" value="<%=con.getNumDetalle()%>" name="numdetalle"></td>
                                    <td><input type="text" class="input-group-text border-0 tedis" value="<%=con.getTexDiseno()%>" name="texdiseno"></td>
                                    <td><input type="text" class="input-group-text border-0 tadis" value="<%=con.getTamDiseno()%>" name="tamdiseno"></td>
                                    <td><input type="text" class="input-group-text border-0 codis" value="<%=con.getColDiseno()%>" name="coldiseno"></td>
                                    <td><input type="text" class="input-group-text table text-center border-0 text-warning predis" value="<%=con.getPreDiseno()%>" name="prediseno"></td>
                                    <td><input type="text" class="input-group-text border-0 obdis" value="<%=con.getObserDiseno()%>" name="obsdiseno"></td>
                                    <td><img src="img/<%=con.getImagen()%>" class="img-thumbnail img-fluid"></td>
                                    <!--<td><input type="file"  accept="image/*" value="" name="imgdiseno" class="img-thumbnail img-fluid border-0 imgdis"></td>-->
                                    <td>
                                        <input type="hidden" name="iddiseno" value="<%=con.getIDDiseno()%>">
                                        <div class="text-center">
                                            <button type="button" name="ActualizaDis" class="img-fluid btn-success btnmod"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                        </div>
                                    </td>
                                    <td>
                                        <input type="hidden" name="cod" value="<%=con.getIDDiseno()%>">
                                        <div class="text-center">
                                            <button type="submit" name="EliminaDiseno" class="img-fluid btn-danger" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>        
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
        <script src="Styles/js/modificar.js"></script>   <!--modificar -->
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script>
    </body>
</html>