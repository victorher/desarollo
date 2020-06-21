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
        <title>Entre Sueños</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
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
            
            if (roll.equalsIgnoreCase("Administrador")) {
        %>
        <header>
            <nav>
                <section class="nav">
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a href="Principal.jsp"><%=roll%></a>
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
        <!--Metodo para mostrar todos los clientes al momento de ingresar a la pagina-->    
        <section class="contenedorTabla">
            <div class="consultarEmpleado">
                <h2>Registro clientes</h2>
                <div class="input">
                    <form action="ServletPDF" class="form-inline my-2">
                        <button type="submit" name="btnpdf" value="Exportar">Exportar pdf Empleados</button>
                    </form>
                    <div class="formularioGrupo">
                        <input type="text" id="search" required="">
                        <span class="barra"></span>
                        <label>&#x1F50D; Buscar por numero de cedula</label>
                    </div>
                </div>
                <div class="tabla">
                    <table id="mytable">
                        <thead>
                            <tr class="btn-info">
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Documento</th>
                                <th>Telefono</th>
                                <th>Genero</th>
                                <th>Direccion</th>
                                <th>Correo</th>
                                <th>Opciones</th>
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
                                <td><%=con.getNombre()%></td>
                                <td><%=con.getApellido()%></td>
                                <td><%=con.getDocumento()%></td>
                                <td><%=con.getTelefono()%></td>
                                <td><%=con.getGenero()%></td>
                                <td><%=con.getDireccion()%></td>
                                <td><%=con.getCorreo()%></td>
                                <td>
                                    <div class="opciones">
                                        <form action="" method="POST">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <button type="submit" name="modifica" value="ACTUALIZAR" title="Actualizar"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                        </form>
                                        <form action="ServletGestionUsu" method="POST" class="mx-2">
                                            <input type="hidden" name="cod" value="<%=con.getDocumento()%>">
                                            <button type="submit" name="EliminaUsuario" value="ELIMINAR" onclick="return Eliminar()" title="Eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
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
        <% if(request.getParameter("modifica")!=null){ %>
        <section class="contenedor">
            <div class="cuerpo">
                <div class="formularioActualizar" id="formularioActualizar">
                    <% for(int a = 0; a < listaEmp.size();a ++){
                        unoemp = listaEmp.get(a);
                    %>
                    <h2>Actualizar los datos de <%=unoemp.getNombre()%></h2>
                    <% } %>
                    <form action="ServletGestionUsu" method="POST">
                        <% for(int i = 0; i < listaUsu.size();i++){
                            emple = listaUsu.get(i);
                        %>
                            <div class="formularioGrupo">
                                <input type="text" id="inputAddress" value="<%=emple.getDocumento()%>" name="documento" required="" readonly="">
                                <span class="barra"></span>
                                <label class="docu">Documento</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="inputEmail4" value="<%=emple.getClave()%>" name="contra" required="" readonly="">
                                <span class="barra"></span>
                                <label class="docu">Contraseña</label>
                            </div>
                            <div class="formularioGrupo">
                                <select id="estado" name="estado"  required="">
                                    <option value="<%=emple.getEstado()%>">
                                        <%
                                            String selectEstado = emple.getEstado();
                                            if (selectEstado.equalsIgnoreCase("0")) {
                                        %>
                                        Inactivo
                                        <% } %>
                                        <%
                                            if (selectEstado.equalsIgnoreCase("1")) {
                                        %>
                                        Activo
                                        <% } %>
                                    </option>
                                    <option value="0">Inactivo</option>
                                    <option value="1">Activo</option>
                                </select>
                                <span class="barra"></span>
                                <label>Estado</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="rol" name="rol" value="<%=emple.getRoll()%>" required="" readonly="">
                                <span class="barra"></span>
                                <label class="docu">Roll</label>
                            </div>
                        <% } %>
                        <% for(int a = 0; a < listaEmp.size();a ++){
                            unoemp = listaEmp.get(a);
                        %>
                            <div class="formularioGrupo">
                                <input type="text" id="mail" value="<%=unoemp.getCorreo()%>" name="correo" required="">
                                <span class="barra"></span>
                                <label>Correo</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="cell" value="<%=unoemp.getTelefono()%>" name="telefono" required="">
                                <span class="barra"></span>
                                <label>Telefono</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="adress" value="<%=unoemp.getDireecion()%>" name="direccion" required="">
                                <span class="barra"></span>
                                <label>Direccion</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="nombre" value="<%=unoemp.getNombre()%>" name="nombre" required="">
                                <span class="barra"></span>
                                <label>Nombre</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" id="apellido" value="<%=unoemp.getApellido()%>" name="apellido" required="">
                                <span class="barra"></span>
                                <label>Apellido</label>
                            </div>
                            <div class="formularioGrupo">
                                <select name="sexo" id="genero" class="form-control">
                                    <option value="<%=unoemp.getGenero()%>"><%=unoemp.getGenero() %></option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <span class="barra"></span>    
                                <label for="genero">Sexo</label>
                            </div>
                        <% } %>
                        <button type="submit" name="ActualizaCli">Actualizar <i class="fa fa-sign-in ml-1"></i></button>
                    </form>
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
        <% } %>
    </body>
</html>
