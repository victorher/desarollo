<%-- 
    Document   : ConsultaPedido
    Created on : 21/06/2020, 09:19:51 PM
    Author     : amico
--%>

<%@page import="Modelo.PedidoUnogetset"%>
<%@page import="Modelo.GestionPedidos"%>
<%@page import="Modelo.Pedidosgetset"%>
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
        <title>Entre Sueños</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Vista/js/ActualizarEstadoPedido.js" type="text/javascript"></script>
        <script src="Styles/js/principal.js" type="text/javascript"></script>
        <script src="Vista/js/filtro.js"></script>
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
        <header>
            <nav>
                <section class="nav">
                    <div class="logo" style="width: 45%">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a><%=roll%></a>
                        <a><%=nom+" "+ape%></a>
                    </div>
                    <div class="enlaces_header">
                        <div class="uno">
                            <a href="#">
                                Consultar
                            </a>
                        </div>
                        <div class="uno_uno">
                            <a href="ConsultaCliente.jsp">Cliente</a>
                            <a href="ConsultaProveedores.jsp">Proveedores</a>
                            <a href="ConsultaPedidoEmpleado.jsp">Pedidos</a>
                            <a href="ConsultaDiseno.jsp">Diseños</a>
                        </div>
                        <div class="dos">
                            <a href="#">
                                Registrar
                            </a>
                        </div>
                        <div class="dos_uno">
                            <a href="CreaPreveedores.jsp">Proveedores</a>
                            <a href="CreaDiseno.jsp">Diseños</a>
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
        
        <section class="contenedorTabla">
            <div class="consultarEmpleado">
                <h2>Tus Pedidos</h2>
                <div class="tabla" id="res">
                    <table id="mytable">
                        <thead>
                            <tr>
                                <th>Imagen</th>
                                <th>Documento</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Direccion</th>
                                <th>Titulo</th>
                                <th>Fecha Pedido</th>
                                <th>Fecha Entrga</th>
                                <th>Precio</th>
                                <th>Opcs</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                
                                ArrayList<PedidoUnogetset> listas = new ArrayList();
                                PedidoUnogetset Pgs = new PedidoUnogetset(); //convas hago referencia al constructor vasio
                                GestionPedidos Gp = new GestionPedidos();

                                listas = Gp.ConsultaPedidoPendietes();

                                for(int i=0; i<listas.size(); i++){

                                    Pgs = listas.get(i);

                            %>

                            <tr>
                                
                                <td><img src="img/<%=Pgs.getImagen()%>"></td>
                                <td><%=Pgs.getDocumento()%></td>
                                <td><%=Pgs.getNombre()%></td>
                                <td><%=Pgs.getApellido()%></td>
                                <td><%=Pgs.getDireccion()%></td>
                                <td><%=Pgs.getTitulo() %></td>
                                <td><%=Pgs.getFechaped()%> </td>
                                <td><%=Pgs.getFechaEnt()%></td>
                                <td><%=Pgs.getPrecio()%></td>
                                <td>
                                    <div class="opciones">
                                        <form action="" method="POST">
                                            <input 
                                                type="hidden" 
                                                class="id"
                                                name="cod" 
                                                value="<%=Pgs.getPedidoID() %>">
                                            <input 
                                                type="hidden" 
                                                class="estado"
                                                name="estado" 
                                                value="Entregado">
                                            <button 
                                                type="submit" 
                                                name="" 
                                                class="btnmod"
                                                value="ACTUALIZAR" 
                                                title="Actualizar">
                                                <i class="fa fa-wrench" aria-hidden="true"></i>
                                            </button>
                                        </form>
<!--                                        <form action="ServletGestionUsu" method="POST">
                                            <input type="hidden" name="cod" value="">
                                            <button type="submit" name="" value="ELIMINAR" onclick="return Eliminar()" title="Eliminar"><i class="fa fa-trash-o" aria-hidden="true"></i></button>
                                        </form>-->
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
