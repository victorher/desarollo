<%@page import="Modelo.GestionProveedores"%>
<%@page import="Modelo.Proveedoresgetset"%>
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
        <meta charset="UTF-8">
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
        <script src="Vista/js/ActualizaProveedor.js" type="text/javascript"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="Styles/main.js"></script>
    </head>
    <style>
        #caja{
            display: none;
            width: 100%;
            padding: 0;
            margin: 0;
        }
    </style>
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
                    <a class="pl-0" href="#"><img id="MDB-logo" src="Vista/img/LOGO-010.png" alt="VAH Logo"></a>
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
                        <input class="btn btn-entre mr-sm-2" type="submit" name="btn" value="Cerrar Sesion">
                    </form>
                </div>
            </div>
        </nav>
        <script type="text/javascript">
            function Eliminar(){
                var Respuesta = confirm("Desea eliminar este registro?");
                if(Respuesta==true){
                    return true;
                }else{
                    return false;
                }
            }
        </script>
        <section>
            <div class="p-4 container-cards" id="res">
                <div class="table">
                    <form action="ActualizaProveedor" method="POST">
                        <table class="table-responsive table-hover table-borderless table-sm">
                            <thead>
                                <tr style="background: linear-gradient(-90deg, #8E2DE2, #4A00E0);">
                                    <!--<th class="text-center">Codigo</th>-->
                                    <th class="text-center">Nombre</th>
                                    <th class="text-center">Apellidos</th>
                                    <th class="text-center">Direccion</th>
                                    <th class="text-center">Telefono</th>
                                    <th class="text-center">Correo</th>
                                    <th class="text-center">Categoria</th>
                                    <th class="text-center">Estado</th>
                                    <th class="text-center">--</th>
                                    <!--<th scope="col" class="text-center">Eliminar</th>-->
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<Proveedoresgetset> listas = new ArrayList();
                                    Proveedoresgetset con = new Proveedoresgetset(); //convas hago referencia al constructor vasio
                                    GestionProveedores Cons = new GestionProveedores();

                                    listas = Cons.ConsultarProveedores();

                                    for(int i=0; i<listas.size(); i++){

                                        con = listas.get(i);

                                %>

                                <tr>
                                    <!--<td>-->
                            <input type="hidden" class="input-group-text border-0 text-center table proveedorID" value="<%=con.getProveedorID()%>" name="proveedorID">
                                    <!--</td>-->
                                    <td>
                                        <input size="9" 
                                            class="border-0 input-group-text nombre" 
                                            value="<%=con.getNombrePro()%>" 
                                            name="nombre">
                                    </td>
                                    <td>
                                        <input size="9" 
                                            class="border-0 input-group-text apellido" 
                                            value="<%=con.getApellidoPro()%>" 
                                            name="apellido">
                                    </td>
                                    <td>
                                        <input size="20" 
                                            class="border-0 input-group-text direccion" 
                                            value="<%=con.getDireccionPro()%>" 
                                            name="direccion">
                                    </td>
                                    <td>
                                        <input size="8" 
                                            class="border-0 input-group-text telefono" 
                                            value="<%=con.getTelefonoPro()%>" 
                                            name="telefono">
                                    </td>
                                    <td>
                                        <input size="24" 
                                            class="border-0 input-group-text correo" 
                                            value="<%=con.getCorreoPro()%>" 
                                            name="correo">
                                    </td>
                                    <td>
                                        <select name="categoria" id="categoria" class="border-0 input-group-text categoria">
                                            <option value="<%=con.getCategoriaPro()%>"><%=con.getCategoriaPro()%></option>
                                            <option value="Posillos">Posillos</option>
                                            <option value="Porcelanas">Porcelanas</option>
                                            <option value="Flores">Flores</option>
                                            <option value="Termos">Termos</option>
                                            <option value="Cajas">Cajas</option>
                                            <option value="Chocolates">Chocolates</option>
                                            <option value="Dulces">Dulces</option>
                                        </select>
                                    </td>
                                    <td>                                    
                                        <select name="estado" id="estado" class="border-0 input-group-text estado">
                                            <option value="<%=con.getEstadoPro()%>"><%=con.getEstadoPro()%></option>
                                            <option value="Activo">Activo</option>
                                            <option value="Inactivo">Inactivo</option>
                                        </select>
                                    </td>
                                    <td>
                                        <!--<input type="hidden" name="" value="">-->
                                        <div class="text-center">
                                            <button type="submit" name="ActualizaPro" class="btn-success img-thumbnail img-fluid btnmod">
                                                <i class="fa fa-wrench" aria-hidden="true"></i>
                                            </button>
                                        </div>
<!--                                        <div class="text-center">
                                            <button type="submit" name="EliminaPro" class="btn-danger img-thumbnail img-fluid" onclick="return Eliminar()">
                                                <i class="fa fa-trash-o" aria-hidden="true"></i>
                                            </button>
                                        </div>-->
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </form>
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
         
    </body>
</html>