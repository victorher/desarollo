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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Entre Sueños</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link href="Styles/css/cliente.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/cliente.js" type="text/javascript"></script>
        <script src="Vista/js/Carritojs.js" type="text/javascript"></script>
        <script src="Vista/js/RegistraPedido.js" type="text/javascript"></script>
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
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a href="Cliente.jsp"><%=roll%></a>
                        <a class="quitar"><%=nom+" "+ape%></a>
                    </div>
                    <div class="enlaces_header">
                        <div class="uno">
                            <a id="btnAbrirPopup">Datos personales</a>
                        </div>
                        <form action="CerrarSesion" method="POST">
                            <button name="btn" type="submit">Cerrar sesion</button>
                        </form>
                    </div>
                    <div class="hamburguer">
                        <i class="fas fa-bars"></i>
                    </div>
                </section>
            </nav>
        </header>
        
        <section class="tarjetas">
            <div class="contenedor1">
                <h2 class="titulo">Pendientes por entrega</h2>
                <%
                                ArrayList<PedidoUnogetset> con = new ArrayList();
                                PedidoUnogetset pre = new PedidoUnogetset(docu); //convas hago referencia al constructor vasio
                                GestionPedidos a = new GestionPedidos();
                                con = a.ConsultaPrecio(pre);
                                for(int i=0; i<con.size(); i++){
                                    pre = con.get(i);
                                %>
                                <h2 class="titulo"><%=pre.getDocumento() %></h2>
                                <% } %>
                <br>
                <br>
                <div class="contenedor_articulo">
                            <%
                                
                                ArrayList<PedidoUnogetset> listas = new ArrayList();
                                PedidoUnogetset Pgs = new PedidoUnogetset(docu); //convas hago referencia al constructor vasio
                                GestionPedidos Gp = new GestionPedidos();

                                listas = Gp.ConsultaPedidoUni(Pgs);

                                for(int i=0; i<listas.size(); i++){

                                    Pgs = listas.get(i);

                            %>

                            <div class="articulo">
                        <img src="img/<%= Pgs.getImagen() %>"/>
                        <h3><%= Pgs.getTitulo()%></h3>
                        <h5>$ <%= Pgs.getPrecio()%>.00</h5>
                        <p class="card-text"><%= Pgs.getEstado()%> pendiente entrega</p>
                    </div>
                    <% } %>
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
