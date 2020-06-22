<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entre sueños</title>
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <link href="Styles/css/index3.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="Styles/js/index3.js" type="text/javascript"></script>
        <!--<script src="Vista/js/llevaPQRdatosFETCH.js" type="text/javascript"></script>-->
        <script src="Vista/js/pqrLlevaDatos.js" type="text/javascript"></script>
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
                    <form action="" id="frm" method="POST" class="fra">
                        <div class="contenedor_input">
                            <div class="grupo">
                                <input class="nombre_pqr nombre" type="text" name="nombre" required="" id="nombre"><span class="barra"></span>
                                <label>Nombre</label>
                            </div>
                            <div class="grupo">
                                <input class="email_pqr email" type="email" name="email" required="" id="email"><span class="barra"></span>
                                <label>Email</label>
                            </div>
                            <select class="select_pqr tipo" id="tipo" name="tipo">
                                <option value="">Selecciona el tipo de pqr que deseas colocar</option>
                                <option value="Petición">Petición</option>
                                <option value="Queja">Queja</option>
                                <option value="Reclamo">Reclamo</option>
                                <option value="Sugerencia">sugerencia</option>
                                <option value="Felicitacion">Felicitacion</option>
                            </select>
                        </div>
                        <div class="contenedor_textarea">
                            <textarea name="mensaje" cols="30" rows="10" placeholder="ingrese su mensaje..." class="mensaje" id="mensaje"></textarea><span class="barraTex"></span>
                        </div>
                        <div class="contenedor_boton">
                            <input type="button" value="enviar" class="btn-cargaDato" name="btn-cargaDato" id="btn-cargaDato">
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
                    <div class="contenedeorBtnCerrar">
                    <a href="#" id="btnCerrar" class="btnCerrar">
                        <i class="fa fa-times" aria-hidden="true"></i>
                    </a>
                    </div>
                    <div class="botones">
                        <a id="iniciar" >Iniciar Sesion</a>
                        <a id="registrar" >Registrarse</a>
                    </div>
                    <div class="formularioIniciar" id="FormularioIniciar">
                        <h2>Iniciar Sesion</h2>
                        <form action="ServletLogin" method="POST">
                            <div class="formularioGrupo">
                                <input type="text" name="usu" required=""><span class="barra"></span>
                                <label>Digita tu numero de cedula</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="password" name="con" required=""><span class="barra"></span>
                                <label>Digita tu clave</label>
                            </div>
                            <button name="btnlogin">Iniciar</button>
                        </form>
                    </div>
                    <div class="formularioRegistar" id="formularioRegistar">
                        <h2>Registrar usuario</h2>
                        <form action="ServletGestionUsu" method="POST" class="">
                            <div class="registrarGrupo">
                                <input type="text" name="documento" required="">
                                <span class="barra"></span>
                                <label id="label">Documento</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="text" name="nombre" required="">
                                <span class="barra"></span>
                                <label id="label1">Nombre</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="text" name="apellido" required="">
                                <span class="barra"></span>
                                <label id="label2">Apellido</label>
                            </div>
                            <div class="registrarGrupo">
                                <select name="sexo" required="">
                                    <option value=""></option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label id="label3">Genero</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="email" name="correo" required="">
                                <span class="barra"></span>
                                <label id="label4">Correo</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="text" name="telefono" required="">
                                <span class="barra"></span>
                                <label id="label5">Telefono</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="text" name="direccion" required="">
                                <span class="barra"></span>
                                <label id="label6">Direccion</label>
                            </div>
                            <div class="registrarGrupo">
                                <input type="password" name="contra" required="">
                                <span class="barra"></span>
                                <label id="label7">Contraseña</label>
                            </div>
                            <input type="hidden" name="estado" value="1">
                            <input type="hidden" name="rol" value="Cliente">
                            <button type="submit" name="CargaCli">Registrar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
