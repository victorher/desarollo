<%@page import="Modelo.pqrGetSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.prrMovimientos"%>
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
        <link rel="stylesheet" href="Styles/css/bootstrap.min.css">
        <link href="Styles/css/principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@100;300;400;700&display=swap" rel="stylesheet">
        <script src="Styles/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/60cc7e3bb5.js"></script>
        <script src="Styles/js/jquery-3.4.1.min.js"></script>
        <script src="Vista/js/Consulta_JSON_PQR.js" type="text/javascript"></script>
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
            
            if (roll.equalsIgnoreCase("Administrador")) {
        %>
        <!--<script type="text/javascript">alert('Bienvenido al sistema');</script>-->
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
    <div class="container mt-4 p-4">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <% if(request.getParameter("modifica")!=null){ %>
                        <form class="task-form" acction="" id="frm">
                                <%  
                                    String co;
                                    co = request.getParameter("id");
//                                    JOptionPane.showMessageDialog(null, co);
                                    ArrayList<pqrGetSet> lista = new ArrayList<>();
                                    pqrGetSet pqr = new pqrGetSet(co);
                                    prrMovimientos cons = new prrMovimientos();
                                    lista = cons.ConsultaPQRUni(pqr);
                                    for(int i = 0; i < lista.size();i++){
                                    pqr = lista.get(i);
                                %>
                                <div class="form-group">
                                    <input type="hidden" id="id" placeholder="Id" class="form-control id" name="id" value="<%=pqr.getId() %>">
                                </div>
                                <div class="form-group">
                                     <textarea id="queja" cols="20" rows="3" class="form-control" placeholder="<%=pqr.getMensaje() %>"></textarea>
                                </div>
                                <div class="form-group">
                                     <textarea id="respuesta" cols="20" rows="6" class="form-control mensaje" name="mensaje" placeholder="Respuesta"></textarea>
                                </div>
                                <button type="submit" name="actualizaP" class="btn btn-success carga btn-block text-center">
                                    Registrar
                                </button>
                                <% } %>
                            </form>
                        <% }else { %>
                            <form class="task-form">
                                <div class="form-group">
                                    <input type="hidden" id="id" placeholder="Id" class="form-control">
                                </div>
                                <div class="form-group">
                                     <textarea id="queja" cols="20" rows="3" class="form-control" placeholder="Queja"></textarea>
                                </div>
                                <div class="form-group">
                                     <textarea id="respuesta" cols="20" rows="6" class="form-control" placeholder="Respuesta"></textarea>
                                </div>
                                <button class="btn btn-success btn-block text-center">
                                    Registrar
                                </button>
                            </form>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="col-md-7 mt-4">
                <table class="table table-bordered table-sm" id="contenedor">

                </table>
            </div>
        </div>
    </div>
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
