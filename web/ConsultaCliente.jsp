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
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="img/Suenos.png"> 
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
        <link rel="stylesheet" href="Vista/css/StylesU.css">
        <script src="Styles/js/jquery-3.3.1.slim.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <!--<script src="Vista/js/consultaClientes.js"></script>-->
        <script src="Vista/js/filtro.js" type="text/javascript"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
        <script src="Styles/main.js"></script>
        <script src="Vista/js/TablaScroll.js"></script>
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
        <section class="page-header section-dark bg-light-grey">
            <div class="container">
                <h2 class="mb-3 form-inline">Generar Reporte Empleados</h2>
                <form action="ServletPDF" class="form-inline">
                    <div class="form-group">
                        <input class="btn btn-success" type="submit" name="btnpdf" value="Cargar en pdf">
                    </div>
                </form>
<!--                <form action="" method="POST" class="form-inline my-2 my-lg-0 mb-2">
                    <div class="form-group">
                        <input type="search" id="txt" name="bus" placeholder="&#x1F50D; Buscar" class="form-control mr-sm-2 txt pull-right">
                        <input type="submit" id="btn" name="env" value="&#128204; Mostrar" class="btn btn-default">
                    </div>
                </form>-->
                
                
            </div>
        </section>
        
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
        <!--Metodo para mostrar los datos de un solo cliente que se quiere modificar-->
        <%  
            String co;
            co = request.getParameter("cod");
            ArrayList<Usuariogetset> listaUsu = new ArrayList<>();
            Usuariogetset emple = new Usuariogetset(co);
            Usuario usu = new Usuario();
            listaUsu = usu.ConsulUniUsuario(emple);
            ////////////////////////////////////////////////////////
            ArrayList<Clientegetset> listaEmp = new ArrayList<>();
            Clientegetset unoemp = new Clientegetset(co);
            GestionCliente emp = new GestionCliente();
            listaEmp = emp.ConsulUniCliente(unoemp);
        %>
        <section id="slider" class="mt-3">
            <div class="p-4">
                <% if(request.getParameter("modifica")!=null){ %>
                    <form action="ServletGestionUsu" method="POST">
                        
                        <div class="form-row">
                            
                            <% for(int i = 0; i < listaUsu.size();i++){
                                emple = listaUsu.get(i);
                            %>
                                <div class="form-group col-md-2">
                                    <label for="doc">Documento</label>
                                    <input type="number" 
                                           class="form-control border-0" 
                                           id="doc" 
                                           readonly="readonly" 
                                           value="<%=emple.getDocumento()%>" 
                                           name="documento"
                                           required>
                                </div> 
                            <% } %>
                            
                            <% for(int a = 0; a < listaEmp.size();a ++){
                                unoemp = listaEmp.get(a);
                            %>

                                <div class="form-group col-md-3">
                                    <label for="nombre"><code>*</code> Nombre</label>
                                    <input type="text" 
                                           class="form-control border-0" 
                                           id="nombre" 
                                           title="Ingresar solo letras y un espacios entre palabras"
                                           value="<%=unoemp.getNombre()%>" 
                                           name="nombre" 
                                           pattern="[A-Za-z ]{2,254}"
                                           required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="apellido"><code>*</code> Apellido</label>
                                    <input type="text" 
                                           class="form-control border-0" 
                                           id="apellido" 
                                           title="Ingresar solo letras y un espacios entre palabras"
                                           value="<%=unoemp.getApellido()%>" 
                                           name="apellido" 
                                           pattern="[A-Za-z ]{2,254}"
                                           required>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="genero">Genero</label>
                                    <select name="sexo" id="genero" class="form-control border-0">
                                        <option value="<%=unoemp.getGenero()%>"><%=unoemp.getGenero() %></option>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="cell"><code>*</code> Telefono</label>
                                    <input type="text" class="form-control border-0" id="cell" value="<%=unoemp.getTelefono()%>" name="telefono" required>
                                </div>
                            <% } %>
                            
                        </div>
                            
                        <div class="form-row">

                            <% for(int a = 0; a < listaEmp.size();a ++){
                                unoemp = listaEmp.get(a);
                            %>
                                <div class="form-group col-md-3">
                                    <label for="email"><code>*</code> Correo</label>
                                    <input type="email" class="form-control border-0" id="email" value="<%=unoemp.getCorreo()%>" name="correo" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="direecion"><code>*</code> Direccion</label>
                                    <input type="text" class="form-control border-0" id="direccion" value="<%=unoemp.getDireecion()%>" name="direccion" required>
                                </div>
                                
                            <% } %>
                            
                            <% for(int i = 0; i < listaUsu.size();i++){
                                emple = listaUsu.get(i);
                            %>
                                <div class="form-group col-md-2">
                                    <!--<label for="contrasena"><code>*</code> Contraseña</label>-->
                                    <input type="hidden" class="form-control" id="contrasena" value="<%=emple.getClave()%>" name="contra" required readonly="readonly">
                                </div>
                                <div class="form-group col-md-1">
                                    <!--<label for="estado">Estado</label>-->
                                    <input type="hidden" class="form-control" id="estado" name="estado" value="<%=emple.getEstado()%>" readonly="readonly">
                                </div>
                                <div class="form-group col-md-3">
                                    <!--<label for="rol">Roll</label>-->
                                    <input type="hidden" class="form-control" id="rol" name="rol" value="<%=emple.getRoll()%>" readonly="readonly">
                                </div> 
                                
                            <% } %>
                            
                        </div>
                            <button type="submit" class="btn btn-success" name="ActualizaCli">Actualizar</button>
                    </form>
                <% } %>
            </div>
        </section>
            
            
        
                        
        <!--En este mostramos los datos filtrados-->
<!--        <section id="sniper" class="bg-entre">
            <div id="res"></div>
        </section>-->
        
        <!--Metodo para mostrar todos los clientes al momento de ingresar a la pagina-->    
        <section id="slider" class="bg-entre">
            <div class="p-4">
                <div class="dataTables_length table-responsive">
                    <table id="tablemode" class="table table-striped table-bordered table-hover table-sm">
                        <thead>
                            <tr class="btn-info">
                                <th width="5%">Nombre</th>
                                <th width="10%">Apellido</th>
                                <th width="8%">Doc</th>
                                <!--<th scope="col">Roll</th>-->
                                <th width="10%">Telefono</th>
                                <th width="7%">Genero</th>
                                <th width="38%">Direccion</th>
                                <th width="15%">Correo</th>
                                <!--<th scope="col">Clave</th>-->
                                <!--<th scope="col">Estado</th>-->
                                <th width="2%">--</th>
                                <!--<th scope="col">Eliminar</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<ConUsuCliente> listas = new ArrayList();
                                ConUsuCliente con = new ConUsuCliente(); //convas hago referencia al constructor vasio
                                GestionCliente Cons = new GestionCliente();
                                listas = Cons.ConsultaCliente();
                                for(int i=0; i<listas.size(); i++){
                                    con = listas.get(i);
                            %>

                            <tr>
                                <td width="5%"><%=con.getNombre()%></td>
                                <td width="10%"><%=con.getApellido()%></td>
                                <td width="8%"><%=con.getDocumento()%></td>
                                <!--<td><></td>-->
                                <td width="10%"><%=con.getTelefono()%></td>
                                <td width="7%"><%=con.getGenero()%></td>
                                <td width="38%"><%=con.getDireccion()%></td>
                                <td width="15%"><%=con.getCorreo()%></td>
                                <!--<td><></td>-->
                                <!--<td></td>-->
                                <td width="2%" class="text-center">
                                    <div class="text-center">
                                        <form action="" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="modifica" value="ACTUALIZAR" class="btn-success img-thumbnail float-right img-fluid"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                            </div>
                                        </form>
                                    <!--</td>-->
                                    <!--<td>-->
<!--                                        <form action="ServletGestionUsu" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="EliminaUsuario" value="ELIMINAR" class="btn-danger img-thumbnail float-right img-fluid" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                            </div>
                                        </form>-->
                                    </div>
                                </td>
                            </td>
                            </tr>

                            <%
                               }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>        
        </section>
        
<!--        <section>
            <div class="container">
            <table class="table" id="res">
                <div id="res"></div>
            </table>
            </div>
        </section>-->
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