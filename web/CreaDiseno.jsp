<%@page import="Modelo.disenoGestiona"%>
<%@page import="Modelo.disenoEtiqueta_gs"%>
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
                            <a class="dropdown-item" href="CreaDiseno.jsp">Diseños</a>
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
        <section class="contenedor">
            <div class="cuerpo">
                <div class="formularioActualizar" id="formularioActualizar">
                    <h2>Registrar un nuevo diseño</h2>
                    <form action="ServletDiseno" enctype="multipart/form-data" method="POST">
                        <div class="formularioGrupo">
                            <input type="text" id="titulo" name="numdetalle" required="">
                            <span class="barra"></span>
                            <label>Titulo Producto</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="text" id="texto" name="texdiseno" required="">
                            <span class="barra"></span>
                            <label>Texto del diseño</label>
                        </div>
                        <div class="formularioGrupo">
                            <select id="tamdis" name="tamdiseno" required="">
                                <option value=""></option>
                                <option value="10 cm X 10 cm">10 cm X 10 cm</option>
                                <option value="12 cm X 12 cm">12 cm X 12 cm</option>
                                <option value="15 cm X 15 cm">15 cm X 15 cm</option>
                                <option value="20 cm X 20 cm">20 cm X 20 cm</option>
                                <option value="30 cm X 30 cm">30 cm X 30 cm</option>
                            </select>
                            <span class="barra"></span>
                            <label>Tamaño del diseño</label>
                        </div>
                        <div class="formularioGrupo">
                            <select id="coldis" name="coldiseno" required="">
                                <option value=""></option>
                                <option value="Rojo">Rojo</option>
                                <option value="Caoba">Caoba</option>
                                <option value="Azul">Azul</option>
                                <option value="Azul y Blanco">Azul y Blanco</option>
                                <option value="Verde y Amarillo">Verde y Amarillo</option>
                                <option value="Negro y Morado">Negro y Morado</option>
                                <option value="Morado y Azul">Morado y Azul</option>
                                <option value="Frutos rojos">Frutos rojos</option>
                            </select>
                            <span class="barra"></span>
                            <label>Color del diseño</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="number" id="predis" name="prediseno" min="0" required="">
                            <span class="barra"></span>
                            <label>Precio del diseño</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="file" id="img" name="imgdiseno" accept="image/*">
                        </div>
                        <div class="formularioGrupo1">
                            <input type="text" id="obs" name="obsdiseno" required="">
                            <span class="barra"></span>
                            <label>Oservacion del diseño</label>
                        </div>
                        <button type="submit" name="CargaDis">Registrar <i class="fa fa-sign-in ml-1"></i></button>
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
