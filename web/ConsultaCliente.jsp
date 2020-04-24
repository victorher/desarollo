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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <link rel="icon" type="image/png" href="img/Suenos.png"> 
        <title>Entre Sueños</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
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
        <section class="page-header section-dark bg-light-grey">
            <div class="container">
                <h2 class="mb-3 form-inline">Filtrar por documento</h2>
                <form action="" method="POST" class="form-inline my-2 my-lg-0 mb-2">
                    <div class="form-group">
                        <input type="search" id="txt" name="bus" placeholder="&#x1F50D; Buscar" class="form-control mr-sm-2 txt pull-right">
                        <input type="submit" id="btn" name="env" value="&#128204; Mostrar" class="btn btn-default">
                    </div>
                </form>
                
                <form action="ServletPDF" class="form-inline my-2 my-lg-0 mb-2">
                    <div class="form-group">
                        <input class="form-control btn btn-success" type="submit" name="btnpdf" value="Cargar en pdf">
                    </div>
                </form>
                
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
        <section id="slider">
            <div class="container">
                <% if(request.getParameter("modifica")!=null){ %>
                    <form action="ServletGestionUsu" method="POST">
                        <% for(int i = 0; i < listaUsu.size();i++){
                            emple = listaUsu.get(i);
                        %>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="exampleFormControlSelect1">Documento <code>*</code></label>
                                    <input type="text" class="form-control" id="inputAddress" readonly="readonly" value="<%=emple.getDocumento()%>" name="documento" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="formGroupExampleInput">Contraseña <code>*</code></label>
                                    <input type="text" class="form-control" id="inputEmail4" value="<%=emple.getClave()%>" name="contra" required>
                                </div>
                                <div class="form-group col-md-1">
                                    <!--<label for="estado">Estado</label>-->
                                    <input type="hidden" class="form-control" id="estado" name="estado" value="<%=emple.getEstado()%>" readonly="readonly">
                                </div>
                                <div class="form-group col-md-3">
                                    <!--<label for="rol">Roll</label>-->
                                    <input type="hidden" class="form-control" id="rol" name="rol" value="<%=emple.getRoll()%>" readonly="readonly">
                                </div>  
                            </div>
                        <% } %>
                        <% for(int a = 0; a < listaEmp.size();a ++){
                            unoemp = listaEmp.get(a);
                        %>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="email">Correo <code>*</code></label>
                                    <input type="text" class="form-control" id="email" value="<%=unoemp.getCorreo()%>" name="correo" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="cell">Telefono <code>*</code></label>
                                    <input type="text" class="form-control" id="cell" value="<%=unoemp.getTelefono()%>" name="telefono" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="formGroupExampleInput">Direccion <code>*</code></label>
                                    <input type="text" class="form-control" id="inputEmail4" value="<%=unoemp.getDireecion()%>" name="direccion" required>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="formGroupExampleInput">Nombre <code>*</code></label>
                                    <input type="text" class="form-control" id="inputAddress" value="<%=unoemp.getNombre()%>" name="nombre" required>
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="formGroupExampleInput">Apellido <code>*</code></label>
                                    <input type="text" class="form-control" id="inputEmail4" value="<%=unoemp.getApellido()%>" name="apellido" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="formGroupExampleInput">Sexo</label>
                                    <select name="sexo" id="" class="form-control">
                                        <option value="<%=unoemp.getGenero()%>"><%=unoemp.getGenero() %></option>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary" name="ActualizaCli">Actualizar</button>
                        <% } %>
                    </form>
                <% } %>
            </div>
        </section>
            
        <!--Metodo para mostrar todos los clientes al momento de ingresar a la pagina-->    
        <section id="sniper" class="bg-entre">
            <div class="container">
                <div class="dataTables_length table-responsive text-nowrap vertical-table">
                    <table id="tablemode" class="table table-striped table-bordered table-hover table-sm" cellspacing="0" width="100%">
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
                                ArrayList<ConUsuCliente> listas = new ArrayList();
                                ConUsuCliente con = new ConUsuCliente(); //convas hago referencia al constructor vasio
                                GestionCliente Cons = new GestionCliente();

                                listas = Cons.ConsultaCliente();

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
                                <!--<td></td>-->
                                <td class="text-center">
                                    <div class="text-center">
                                        <form action="" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="modifica" value="ACTUALIZAR" class="btn-success float-right img-fluid"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                            </div>
                                        </form>
                                    <!--</td>-->
                                    <!--<td>-->
                                        <form action="ServletGestionUsu" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="EliminaUsuario" value="ELIMINAR" class="btn-danger float-right img-fluid" onclick="return Eliminar()"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                            </div>
                                        </form>
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
                        
        <!--En este mostramos los datos filtrados-->
        <% if(request.getParameter("env")!=null){ %>
            <section id="sniper" class="bg-entre">
                <div class="container">
                    <div class="dataTables_length table-responsive text-nowrap vertical-table">
                        <table class="table table-striped table-bordered table-hover table-sm" cellspacing="0" width="100%">
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
                                    <th scope="col">Estado</th>
                                    <th scope="col">Actualizar</th>
                                    <th scope="col">Eliminar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String doc = request.getParameter("bus");
                                    //JOptionPane.showMessageDialog(null, doc);
                                    ArrayList<ConUsuCliente> lista = new ArrayList(); //metodo getset
                                    ConUsuCliente fil = new ConUsuCliente(doc); //convas hago referencia al constructor vasio
                                    GestionCliente filrt = new GestionCliente();

                                    lista = filrt.FiltraCliente(fil);

                                    for(int i=0; i<lista.size(); i++){

                                        fil = lista.get(i);

                                %>

                                <tr>
                                    <td scope="row"><%=fil.getNombre()%></td>
                                    <td><%=fil.getApellido()%></td>
                                    <td><%=fil.getDocumento()%></td>
                                    <td><%=fil.getRol()%></td>
                                    <td><%=fil.getTelefono()%></td>
                                    <td><%=fil.getGenero()%></td>
                                    <td><%=fil.getDireccion()%></td>
                                    <td><%=fil.getCorreo()%></td>
                                    <td><%=fil.getClave()%></td>
                                    <td><%=fil.getEstado()%></td>
                                    <td>
                                        <form action="" method="POST">
                                            <input type="hidden" name="cod" value="<%=fil.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="modifica" value="ACTUALIZAR" class="float-right img-fluid">
                                                    <i class="fa fa-wrench" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="ServletGestionUsu" method="POST">
                                            <input type="hidden" name="cod" value="<%=fil.getDocumento()%>">
                                            <div class="text-center">
                                                <button type="submit" name="EliminaUsuario" value="ELIMINAR" class="float-right img-fluid" onclick="return Eliminar()">
                                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                                                </button>
                                            </div>
                                        </form>
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
        <% } %>
        <section>
            <div class="container">
            <table class="table" id="res">
                <div id="res"></div>
            </table>
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
        <script src="Vista/js/consultaClientes.js"></script>
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="Styles/js/popper.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
        <script src="Styles/main.js"></script>
        <script src="Vista/js/TablaScroll.js"></script>
    </body>
</html>