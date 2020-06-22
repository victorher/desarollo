<%@page import="Modelo.GestionEmpleados"%>
<%@page import="Modelo.AdministradorGetSet"%>
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
        <link rel="icon" type="image/png" href="Vista/img/Suenos.png">
        <title>Entre Sueños</title>
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="Styles/js/principal.js" type="text/javascript"></script>
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
        <!--<script type="text/javascript">alert('Bienvenido al sistema');</script>-->
        <header>
            <nav>
                <section class="nav">
                    <div class="logo">
                        <img src="Vista/img/LOGO-01.png" alt=""/>
                        <a><%=roll%></a>
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
        <section class="contenedor">
            <div class="cuerpo">
            <div class="formularioActualizar" id="formularioActualizar">
                <h2>Mis datos personales</h2>
                <form action="ActualizarCliente" method="POST" class="frm">

                    <%
                        String co = docu;
                        //co = request.getParameter("cod");
//                                                        JOptionPane.showMessageDialog(null, co);
                        ArrayList<AdministradorGetSet> listas = new ArrayList();
                        AdministradorGetSet con = new AdministradorGetSet(co); //convas hago referencia al constructor vasio
                        GestionEmpleados Cons = new GestionEmpleados();

                        listas = Cons.ConsultarAdministrador(con);

                        for(int i = 0; i < listas.size(); i++){

                            con = listas.get(i);

                    %>

                    <div class="formularioGrupo">
                        <input type="text" class="doc" id="documento" value="<%=con.getDocumento()%>" name="documento" readonly="" required>
                        <span class="barra"></span>
                        <label class="docu">Documento</label>
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
                        <span class="barra"></span>
                        <label>Contraseña</label>
                    </div>
                    <input  id="est" name="estado" value="<%=con.getEstado()%>" type="hidden">
                    <input type="hidden" class="roll" id="roll" name="rol" value="<%=con.getRol()%>">
                    <% } %>
                    <button type="submit" class="btnmod" name="">Actualizar
                        <i class="fa fa-sign-in ml-1"></i>
                    </button>
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
    </body>
</html>
