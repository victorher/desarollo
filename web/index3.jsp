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
        <script src="Styles/js/index3_1.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js" crossorigin="anonymous"></script>
        <link href="Styles/css/index3_2.css" rel="stylesheet" type="text/css"/>
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
                        <a id="btnAbrirPopup"><i class="fas fa-user-alt"></i></a>
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
                <h2 class="titulo">Algunos de nuestros productos</h2>
                <div class="contenedor_articulo">
                        <%
                            ArrayList<Disenogetset> listas = new ArrayList();
                            Disenogetset con = new Disenogetset();
                            GestionDiseno Cons = new GestionDiseno();
                            listas = Cons.ConsultarDisenos();
                            for(int i=0; i<listas.size(); i++){
                                con = listas.get(i);
                        %>
                        <div class="articulo">
                            <img src="img/<%=con.getImagen()%>">
                            <h3><%=con.getNumDetalle()%></h3>
                            <p><%=con.getTexDiseno()%></p>
                        </div>
                        <% } %>
                </div>
            </div>
        </section>
        <section>
            <div class="contenedor">
                <h2 class="titulo_pqr">PETICIONES QUEJAS O RECLAMOS</h2>
                <h4 class="subtitulo_pqr">
                    En este espacio puedes enviarnos tus peticiones, quejas, reclamos, sugerencias y felicitaciones
                </h4>
                <div class="cuerpo_pqr">
                    <form action="">
                        <div class="contenedor_input">
                            <input type="text" name="" placeholder="Nombre">
                            <input type="email" name="" placeholder="Email">
                            <select>
                                <option value="">Selecciona el tipo de pqr que deseas colocar</option>
                                <option value="peticion">Peticion</option>
                                <option value="queja">Queja</option>
                                <option value="reclamo">Reclamo</option>
                                <option value="sugerencia">sugerencia</option>
                                <option value="felicitacion">Felicitacion</option>
                            </select>
                        </div>
                        <div class="contenedor_textarea">
                            <textarea name="" cols="30" rows="10" placeholder="ingrese su mensaje..."></textarea>
                        </div>
                        <div class="contenedor_boton">
                            <input type="button" value="enviar">
                        </div>
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
        <div class="contenedor">
            <div class="overley" id="overley">
                <div class="popup" id="popup">
                    <a href="#" id="btnCerrar" class="btnCerrar"><i class="far fa-times"></i></a>
                    <div class="botones">
                        <a id="iniciar" >Iniciar Sesion</a>
                        <a id="registrar" >Registrarse</a>
                    </div>
                    <div class="formularioIniciar" id="FormularioIniciar">
                        <h2>Iniciar Sesion</h2>
                        <form>
                            <input type="text" placeholder="Digita tu numero de cedula">
                            <input type="password" placeholder="Digita tu clave">
                        </form>
                    </div>
                    <div class="formularioRegistar" id="formularioRegistar">
                        <h2>Registrar Sesion</h2>
                        <form>
                            <input type="text" placeholder="Nombre">
                            <input type="text" placeholder="Apellido">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
