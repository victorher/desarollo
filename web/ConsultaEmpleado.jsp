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
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/principal.js" type="text/javascript"></script>
        <script src="Vista/js/filtro.js"></script>
        <script src="Vista/js/Eliminar.js"></script>
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
            
            if (roll.equals("Administrador")) {
        %>
        
        <header>
            <nav>
                <section class="nav">
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a><%=roll%></a>
                        <a><%=nom+" "+ape%></a>
                        <a href="PQR.jsp">PQR</a>
                        <div id="cunta"></div>
                    </div>
                    <div class="enlaces_header">
                        <div class="uno">
                            <a href="#">
                                Consultar
                            </a>
                        </div>
                        <div class="uno_uno">
                            <a class="dropdown-item" href="ConsultaEmpleado.jsp">Empleado</a>
                            <a class="dropdown-item" href="ConsultaCliente.jsp">Cliente</a>
                            <a class="dropdown-item" href="ConsultaProveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="#">Pedidos</a>
                            <a class="dropdown-item" href="ConsultaDiseno.jsp">Diseños</a>
                            <a class="dropdown-item" href="ConsultaArtProveedor.jsp">Categoria Articulos</a>
                        </div>
                        <div class="dos">
                            <a href="#">
                                Registrar
                            </a>
                        </div>
                        <div class="dos_uno">
                            <a class="dropdown-item" href="CreaEmpleado.jsp">Empleado</a>
                            <a class="dropdown-item" href="CreaCliente.jsp">Cliente</a>
                            <a class="dropdown-item" href="CreaPreveedores.jsp">Proveedores</a>
                            <a class="dropdown-item" href="CreaPedidos.jsp">Pedidos</a>
                            <a class="dropdown-item" href="CreaDiseno.jsp">Diseños</a>
                            <a class="dropdown-item" href="CreaArtProveedor.jsp">Categoria Articulos</a>
                        </div>
                        <form action="CerrarSesion" method="POST">
                            <button type="submit" name="btn">Cerrar Sesion</button>
                        </form>
                    </div>
                    <div class="hamburguer">
                        <i class="fas fa-bars"></i>
                    </div>
                </section>
            </nav>
        </header>
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
        <section id="slider"  class="bg-entre cuerpo">
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
        <% } %>
        <footer>
            <div class="footer_logo">
                <img src="Vista/img/LOGO-01.png">
            </div>
            <div class="footer_redes">
                <h4>Redes Sociales</h4>
                <div>
                    <i class="fab fa-facebook-f"></i>
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-whatsapp"></i>
                </div>
            </div>
        </footer>
    </body>
</html>
