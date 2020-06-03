<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/index3.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js" crossorigin="anonymous"></script>
        <link href="Styles/css/index3.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
    </head>
    <body>
         <header>
            <nav>
                <section class="contenedor nav">
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                    </div>
                    <div class="enlaces_header">
                        <i class="fas fa-user-alt"></i>
                    </div>
                </section>
            </nav>
            <div class="contenedor">
                <section class="contenido_header">
                    <section class="textos_header">
                        <h1>ENTRE SUEÑOS</h1>
                        <P>Un detalle que sale del corazón, es el tesoro mas valioso</P>
                    </section>
                    <img src="img/imagen_header.jpeg" alt=""/>
                </section>
            </div>
        </header>
        <section class="tarjetas">
            <div class="contenedor1">
                <h2>Algunos de nuestros productos</h2>
                <div class="contenedor_articulo">
                    <div class="articulo">
                        <%
                            ArrayList<Disenogetset> listas = new ArrayList();
                            Disenogetset con = new Disenogetset();
                            GestionDiseno Cons = new GestionDiseno();
                            listas = Cons.ConsultarDisenos();
                            for(int i=0; i<listas.size(); i++){
                                con = listas.get(i);
                        %>
                            <img src="img/<%=con.getImagen()%>">
                            <h3><%=con.getNumDetalle()%></h3>
                            <p><%=con.getTexDiseno()%></p>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
