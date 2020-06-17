<%@page import="Modelo.GestionDiseno"%>
<%@page import="Modelo.Disenogetset"%>
<%@page import="Modelo.Disenogetset"%>
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
<html lang="es">
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
    </head>

    <body>
        <%
            String nom, ape, gen, docu, cont, roll, direcc;
            HttpSession obsjes = request.getSession();
            nom = (String) obsjes.getAttribute("Nombre");
            ape = (String) obsjes.getAttribute("Apellido");
            gen = (String) obsjes.getAttribute("Genero");
            docu = (String) obsjes.getAttribute("Documento");
            cont = (String) obsjes.getAttribute("Contrasena");
            roll = (String) obsjes.getAttribute("Rol");
            direcc = (String) obsjes.getAttribute("Direccion");
        %>
        <header>
            <nav>
                <section class="nav">
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a class="quitar"><%=roll%></a>
                        <a class="quitar"><%=nom+" "+ape%></a>
                        <a class="nav-link" href="Disenos.jsp">
                            <i class="fa fa-cart-arrow-down" aria-hidden="true"></i> (1)
                        </a>
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
        <!--Actualizar-->
        <div class="contenedor">
            <div class="overley" id="overley">
                <!--Content-->
                <div class="popup" id="popup">
                    <div>
                        <a href="#" id="btnCerrar" class="btnCerrar">
                            <i class="fa fa-times" aria-hidden="true"></i>
                        </a>
                    </div>
                    <div class="formularioActualizar" id="formularioActualizar">
                        <h2>Actualizar mis datos personales</h2>
                        <form action="ActualizarCliente" method="POST">
                            
                            <%
                                String co = docu;
                                //co = request.getParameter("cod");
//                                                        JOptionPane.showMessageDialog(null, co);
                                ArrayList<ConUsuCliente> listas = new ArrayList();
                                ConUsuCliente con = new ConUsuCliente(co); //convas hago referencia al constructor vasio
                                GestionCliente Cons = new GestionCliente();

                                listas = Cons.ConsulClienteUni(con);

                                for(int i = 0; i < listas.size(); i++){

                                    con = listas.get(i);

                            %>

                            <div class="formularioGrupo">
                                <input type="text" class="doc" id="documento" value="<%=con.getDocumento()%>" name="documento" required>
                                <span class="barra"></span>
                                <label>Documento</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" class="nom" id="nombre" value="<%=con.getNombre()%>" name="nombre" required>
                                <span class="barra"></span>
                                <label>Nombre</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" class="apell" id="apellido" value="<%=con.getApellido()%>" name="apellido" required>
                                <span class="barra"></span>
                                <label>Apellido</label>
                            </div>
                            <div class="formularioGrupo">
                                <select name="sexo" id="genero" class="gen">
                                    <option value="<%=con.getGenero()%>"><%=con.getGenero()%></option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <label for="genero">Genero</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="email" class="mail" id="mail" value="<%=con.getCorreo()%>" name="correo" required>
                                <span class="barra"></span>
                                <label>Correo</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" class="form-control tel" id="telefono" value="<%=con.getTelefono()%>" name="telefono" required>
                                <span class="barra"></span>
                                <label>Telefono</label>
                            </div>
                            <div class="formularioGrupo">
                                <input type="text" class="dir" id="direc" value="<%=con.getDireccion()%>" name="direccion" required>
                                <span class="barra"></span>
                                <label>Direccion</label>
                            </div>

                            <div class="formularioGrupo">
                                <input type="text" class="pass" id="pass" value="<%=con.getClave()%>" name="contra" required>
                                <label>Contraseña</label>
                            </div>
                            <input  id="est" name="estado" value="<%=con.getEstado()%>" type="hidden">
                            <input type="hidden" class="roll" id="roll" name="rol" value="<%=con.getRol()%>">
                            <% } %>
                            <button type="submit" class="btnmod" name="ActualizaCli">Actualizar
                                <i class="fa fa-sign-in ml-1"></i>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <section class="tarjetas">
            <div class="contenedor1">
                <h2 class="titulo">Nuestros productos</h2>
                <div class="contenedor_articulo">
                    <%
                        ArrayList<Disenogetset> listasD = new ArrayList<>();
                        Disenogetset dis = new Disenogetset();
                        GestionDiseno muestra = new GestionDiseno();
                        listasD = muestra.ConsultarDisenos();
                        for(int i = 0; i < listasD.size(); i++){
                            dis = listasD.get(i); %>
                    <div class="articulo">
                        <img src="img/<%= dis.getImagen() %>"/>
                        <h3><%= dis.getNumDetalle()%></h3>
                        <h5>$ <%= dis.getPreDiseno() %>.00</h5>
                        <p class="card-text"><%= dis.getObserDiseno()%></p>
                        <form action="" method="post">
                            <button name="enviar" type="submit">Agregar al carrito</button>
                        </form>
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
