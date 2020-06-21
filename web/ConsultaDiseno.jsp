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
        <title>Entre Suenos</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/principal.js" type="text/javascript"></script>
        <script src="Styles/js/modificar.js"></script>   <!--modificar -->
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
        <section class="contenedorTabla">
            <div class="consultarEmpleado">
                <h2>Registro diseños</h2>
                <div class="tabla" style="height: 400px">
                    <form action="" enctype="multipart/form-data" id="frm">
                        <table id="tabla">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Texto</th>
                                    <th>Tamano</th>
                                    <th>Color</th>
                                    <th>Precio</th>
                                    <th>Observaciones</th>
                                    <th>Imagen</th>
                                    <th>Cargar Imagen</th>
                                    <th>Opciones</th>
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
                                        <input type="hidden" class="input-group-text table text-center border-0 iddis" value="<%=con.getIDDiseno()%>" name="iddis">
                                        <td><input type="text" class="table nudeta" value="<%=con.getNumDetalle()%>" name="numdetalle"></td>
                                        <td><textarea type="text" class="tedis" value="<%=con.getTexDiseno()%>" name="texdiseno"><%=con.getTexDiseno()%></textarea></td>
                                        <td><input type="text" class="tadis" value="<%=con.getTamDiseno()%>" name="tamdiseno"></td>
                                        <td><input type="text" class="codis" value="<%=con.getColDiseno()%>" name="coldiseno"></td>
                                        <td><input type="text" class="table predis" value="<%=con.getPreDiseno()%>" name="prediseno"></td>
                                        <td><textarea type="text" class="obdis" value="<%=con.getObserDiseno()%>" name="obsdiseno"><%=con.getObserDiseno()%></textarea></td>
                                        <td><img src="img/<%=con.getImagen()%>"></td>
                                        <td><input type="file"  accept="image/*" title="Ingresa una imagen" value="Guardar" name="imgdiseno" class="imgdis"></td>
                                        <td>
                                            <div class="opciones">
                                                <input type="hidden" name="iddiseno" value="<%=con.getIDDiseno()%>">
                                                <button type="button" name="ActualizaDis" class="btnmod" id="btnmod" title="Actualizar"><i class="fa fa-wrench" aria-hidden="true"></i></button>
                                                <button type="submit" name="EliminaDiseno" onclick="return Eliminar()" title="Eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
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
