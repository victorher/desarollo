<%@page import="java.text.DecimalFormat"%>
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
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Styles/js/modificar.js"></script>   <!--modificar -->
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script>
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
        
        <div class="p-4 container-cards mt-5">
            <div class="table">
                <form action="" enctype="multipart/form-data" id="frm">
                    <table class="table-responsive table-hover table-borderless table-sm frm" id="tabla">
                        <thead>
                            <tr class="btn-danger">
                                <th width="40%">Titulo</th>
                                <th width="25%">Texto</th>
                                <th width="2%">Tamano</th>
                                <th width="2%">Color</th>
                                <th width="10%">Precio</th>
                                <th width="40%">Observaciones</th>
                                <th width="10%">Imagen</th>
                                <th width="5%">Cargar</th>
                                <th width="2%">--</th>
                                <!--<th scope="col">Eliminar</th>-->
                            </tr>
                        </thead>
                        <tbody class="arl">
                            <%  ArrayList<Disenogetset> listas = new ArrayList();
                                Disenogetset con = new Disenogetset(); //convas hago referencia al constructor vasio
                                GestionDiseno Cons = new GestionDiseno();
                                listas = Cons.ConsultarDisenos();

                                for(int i=0; i<listas.size(); i++){

                                    con = listas.get(i); %>
                                <tr>
                                    <input type="hidden" 
                                        class="input-group-text table text-center border-0 iddis" 
                                        value="<%=con.getIDDiseno()%>" 
                                        name="iddis">
                                    <td width="40%">
                                        <input  
                                            size="35"
                                            class="input-group-text table text-center border-0 nudeta" 
                                            value="<%=con.getNumDetalle()%>" 
                                            name="numdetalle">
                                    </td>
                                    <td width="25%">
                                        <input 
                                            size="35"
                                            class="input-group-text border-0 tedis" 
                                            value="<%=con.getTexDiseno()%>" 
                                            name="texdiseno">
                                    </td>
                                    <td width="2%">
                                        <select name="tamdiseno" id="tamdiseno" class="border-0 input-group-text tadis">
                                            <option value="<%=con.getTamDiseno()%>"><%=con.getTamDiseno()%></option>
                                            <option value="10 cm X 10 cm">10 cm X 10 cm</option>
                                            <option value="12 cm X 12 cm">12 cm X 12 cm</option>
                                            <option value="15 cm X 15 cm">15 cm X 15 cm</option>
                                            <option value="20 cm X 20 cm">20 cm X 20 cm</option>
                                            <option value="30 cm X 30 cm">30 cm X 30 cm</option>
                                        </select>
                                    </td>
                                    <td width="2%">
                                        <select name="coldiseno" id="coldiseno" class="border-0 input-group-text codis">
                                            <option value="<%=con.getColDiseno()%>"><%=con.getColDiseno()%></option>
                                            <option value="Rojo">Rojo</option>
                                            <option value="Caoba">Caoba</option>
                                            <option value="Azul">Azul</option>
                                            <option value="Azul y Blanco">Azul y Blanco</option>
                                            <option value="Verde y Amarillo">Verde y Amarillo</option>
                                            <option value="Negro y Morado">Negro y Morado</option>
                                            <option value="Morado y Azul">Morado y Azul</option>
                                            <option value="Frutos rojos">Frutos rojos</option>
                                        </select>
                                    </td>
                                    <td width="10%">
                                        <input type="text" 
                                            size="8"
                                            class="input-group-text table text-center border-0 text-warning predis" 
                                            value="<%= con.getPreDiseno()%>" 
                                            name="prediseno">
                                    </td>
                                    <td width="40%">
                                        <input 
                                            size="30"
                                            class="input-group-text border-0 obdis" 
                                            value="<%=con.getObserDiseno()%>" 
                                            name="obsdiseno">
                                    </td>
                                    <td width="10%">
                                        <img src="img/<%=con.getImagen()%>" 
                                            class="img-thumbnail img-fluid">
                                    </td>
                                    <td width="5%">
                                            <input type="file"  
                                                id="file"
                                                accept="image/*" 
                                                title="Ingresa una imagen" 
                                                value="Guardar" 
                                                name="imgdiseno" 
                                                class="imgdis">
                                                <!--class="fileinput-new border-0 imgdis">-->
                                            <button
                                                type="button"
                                                value="Cargar"
                                                class="bta"
                                                onclick="document.getElementById('file').click()">
                                                <i class="fa fa-upload" aria-hidden="true"></i>
                                            </button>
                                    </td>
                                    <td width="2">
                                        <div class="text-center">
                                            <input type="hidden" name="iddiseno" value="<%=con.getIDDiseno()%>">
                                            <div class="text-center">
                                                <button type="button" name="ActualizaDis" class="img-fluid img-thumbnail btn-success btnmod" id="btnmod">
                                                    <i class="fa fa-wrench" aria-hidden="true"></i>
                                                </button>
                                            </div>
<!--                                            <div class="text-center">
                                                <button type="submit" name="EliminaDiseno" class="img-fluid img-thumbnail btn-danger" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                            </div>-->
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
    </body>
</html>
