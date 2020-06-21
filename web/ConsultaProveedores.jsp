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
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <title>Entre Suenos</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/principal.js" type="text/javascript"></script>
        <script src="Vista/js/ActualizaProveedor.js" type="text/javascript"></script>
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
                if(Respuesta==true){
                    return true;
                }else{
                    return false;
                }
            }
        </script>
        <section class="contenedorTabla">
            <div class="consultarEmpleado" id="res">
                <h2>Registro proveedores</h2>
                <div class="tabla" style="height: 400px">
                    <form action="ActualizaProveedor" method="POST">
                        <table id="mytable">
                            <thead>
                                <tr>
                                    <!--<th>Codigo</th>-->
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Direccion</th>
                                    <th>Telefono</th>
                                    <th>Correo</th>
                                    <th>Categoria</th>
                                    <th>Estado</th>
                                    <th>Opciones</th>
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
                                        <input class="table proveedorID"
                                               type="hidden"
                                            value="<%=con.getProveedorID()%>" 
                                            name="proveedorID">
                                        </tActivod>
                                    <td>
                                        <input class="nombre" 
                                            value="<%=con.getNombrePro()%>" 
                                            name="nombre">
                                    </td>
                                    <td>
                                        <input class="apellido" 
                                            value="<%=con.getApellidoPro()%>" 
                                            name="apellido">
                                    </td>
                                    <td>
                                        <input class="direccion" 
                                            value="<%=con.getDireccionPro()%>" 
                                            name="direccion">
                                    </td>
                                    <td>
                                        <input class="telefono" 
                                            value="<%=con.getTelefonoPro()%>" 
                                            name="telefono">
                                    </td>
                                    <td>
                                        <input class="correo" 
                                            value="<%=con.getCorreoPro()%>" 
                                            name="correo">
                                    </td>
                                    <td>
                                        <select id="categoria" name="categoria"  required="" class="categoria" >
                                            <option value="<%=con.getCategoriaPro()%>"><%=con.getCategoriaPro()%></option>
                                            <option value="Flores">Flores</option>
                                            <option value="Cajas">Cajas</option>
                                            <option value="Posillos">Posillos</option>
                                            <option value="Porcelas">Porcelas</option>
                                            <option value="Dulces">Dulces</option>
                                            <option value="Chocolates">Chocolates</option>
                                            <option value="Botellones">Botellones</option>
                                            <option value="Confiteria">Confiteria</option>
                                            <option value="Bombas">Bombas</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="estado" name="estado"  required="" class="estado" >
                                            <option value="<%=con.getEstadoPro()%>"><%=con.getEstadoPro()%></option>
                                            <option value="Inactivo">Inactivo</option>
                                            <option value="Activo">Activo</option>
                                </select>
                                    </td>
                                    <td>
                                        <div class="opciones">
                                            <input type="hidden" name="" value="">
                                            <button type="submit" name="ActualizaPro" class="btnmod" title="Actualizar"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                            <input type="hidden" name="" value="" >
                                            <button type="submit" name="EliminaPro" onclick="return Eliminar()" title="Eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </section>
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
