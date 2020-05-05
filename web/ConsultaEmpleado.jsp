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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <title>Entre Sueños</title>
        <!--<link rel="shortcut icon" href="#" />-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <!--<link rel="stylesheet" href="Styles/Est.css">-->
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
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
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card container">
                            <h3 class="py-2">Empleados registrados</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, assumenda, iusto, nisi cumque voluptate sed deleniti quis facere aliquid nihil tempora dolore quo voluptatum esse veniam molestias eum sit debitis.</p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card container">
                            <h3 class="py-2">Empleados registrados</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias, assumenda, iusto, nisi cumque voluptate sed deleniti quis facere aliquid nihil tempora dolore quo voluptatum esse veniam molestias eum sit debitis.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%  
            String co;
            co = request.getParameter("cod");
            ArrayList<Usuariogetset> listaUsu = new ArrayList<>();
            Usuariogetset emple = new Usuariogetset(co);
            Usuario usu = new Usuario();
            listaUsu = usu.ConsulUniUsuario(emple);
            ////////////////////////////////////////////////////////
            ArrayList<Empleadogetset> listaEmp = new ArrayList<>();
            Empleadogetset unoemp = new Empleadogetset(co);
            GestionEmpleados emp = new GestionEmpleados();
            listaEmp = emp.ConsulUniEmpleado(unoemp);
        %>
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
        <section id="slider">
            <div class="container">
                <% if(request.getParameter("modifica")!=null){ %>
                    <form action="ServletGestionUsu" method="POST">
                        <% for(int i = 0; i < listaUsu.size();i++){
                            emple = listaUsu.get(i);
                        %>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="documento">Documento <code>*</code></label>
                                    <input type="text" class="form-control" id="documento" readonly="readonly" value="<%=emple.getDocumento()%>" name="documento" required>
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="pass">Contraseña <code>*</code></label>
                                    <input type="text" class="form-control" id="pass" value="<%=emple.getClave()%>" name="contra" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-1">
                                    <label for="estado">Estado</label>
                                    <input type="hidden" class="form-control" id="estado" name="estado" value="<%=emple.getEstado()%>" readonly="readonly">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="rol">Roll</label>
                                    <input type="text" class="form-control" id="rol" name="rol" value="<%=emple.getRoll()%>" readonly="readonly">
                                </div>  
                            </div>
                        <% } %>
                        <% for(int a = 0; a < listaEmp.size();a ++){
                            unoemp = listaEmp.get(a);
                        %>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="mail">Correo <code>*</code></label>
                                    <input type="text" class="form-control" id="mail" value="<%=unoemp.getCorreo()%>" name="correo" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="cell">Telefono <code>*</code></label>
                                    <input type="text" class="form-control" id="cell" value="<%=unoemp.getTelefono()%>" name="telefono" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="adress">Direccion <code>*</code></label>
                                    <input type="text" class="form-control" id="adress" value="<%=unoemp.getDireecion()%>" name="direccion" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="nombre">Nombre <code>*</code></label>
                                    <input type="text" class="form-control" id="nombre" value="<%=unoemp.getNombre()%>" name="nombre" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="apellido">Apellido <code>*</code></label>
                                    <input type="text" class="form-control" id="apellido" value="<%=unoemp.getApellido()%>" name="apellido" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="genero">Sexo</label>
                                    <select name="sexo" id="genero" class="form-control">
                                        <option value="<%=unoemp.getGenero()%>"><%=unoemp.getGenero() %></option>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary" name="ActualizaEmp">Actualizar</button>
                        <% } %>
                    </form>
                <% } %>
            </div>
        </section>
        <section id="slider"  class="bg-entre">
            <div class="container">
                <div class="row mb-2">
                    <div class="col-md-2">
                        <form action="ServletPdfEmpl" class="form-inline my-2">
                            <div class="form-group">
                                <input class="btn btn-success" type="submit" name="btnpdf" value="Exportar">
                            </div>
                        </form>
                    </div>
                    <div class="col-md-2 offset-md-8">
                        <input type="text" class="form-control pull-right" id="search" placeholder="&#x1F50D; Buscar">
                    </div>
                </div>
                <div class="row dataTables_length table-responsive text-nowrap vertical-table">
                    <table class="table table-striped table-bordered table-hover table-sm" id="mytable" cellspacing="0" width="100%">
                        <thead>
                            <tr class="btn-info">
                                <th scope="col">Nombre</th>
                                <th scope="col">Apellido</th>
                                <th scope="col">Documento</th>
                                <th scope="col">Roll</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Genero</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Clave</th>
                                <!--<th scope="col">Estado</th>-->
                                <th scope="col">Opciones</th>
                                <!--<th scope="col">Eliminar</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<ConUsuEmpleado> listas = new ArrayList();
                                ConUsuEmpleado con = new ConUsuEmpleado(); //convas hago referencia al constructor vasio
                                GestionEmpleados Cons = new GestionEmpleados();

                                listas = Cons.ConsultaEmpleado();

                                for(int i=0; i<listas.size(); i++){

                                    con = listas.get(i);

                            %>

                            <tr>
                                <td scope="row"><%=con.getNombre()%></td>
                                <td><%=con.getApellido()%></td>
                                <td><%=con.getDocumento()%></td>
                                <td><%=con.getRol()%></td>
                                <td><%=con.getTelefono()%></td>
                                <td><%=con.getGenero()%></td>
                                <td><%=con.getDireccion()%></td>
                                <td><%=con.getCorreo()%></td>
                                <td><%=con.getClave()%></td>
<!--                                <td></td>-->
                                <td class="text-center">
                                    <div class="text-center">
                                        <form action="" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="modifica" value="ACTUALIZAR" class="rounded-circle float-right img-fluid"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                            </div>
                                        </form>
    <!--                                </td>
                                    <td>-->
                                        <form action="ServletGestionUsu" method="POST">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="EliminaUsuario" value="ELIMINAR" class="btn-danger rounded-circle float-right img-fluid" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                            </div>
                                        </form>
                                    </div>
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
        <script src="https://ajax.goog&#x1F50Dleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Vista/js/filtro.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <!--<script type="text/javascript" charse t="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>-->
        <script src="Styles/main.js"></script>
        <!--<script src="Vista/js/TablaScroll.js"></script>-->
        <script src="Vista/js/Eliminar.js"></script>
    </body>
</html>