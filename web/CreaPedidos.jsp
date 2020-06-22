<%@page import="Modelo.DisenoSelect"%>
<%@page import="Modelo.Diseno_gs"%>
<%@page import="Modelo.ArticuloSelect"%>
<%@page import="Modelo.Articulo_gs"%>
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
        <script src="Styles/js/principal.js" type="text/javascript"></script>
        <script src="Vista/js/RegistraPedido.js" type="text/javascript"></script>
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
        <%
            ArrayList<Articulo_gs> lista = new ArrayList<>();
            Articulo_gs arti = new Articulo_gs();
            ArticuloSelect opti = new ArticuloSelect();
            lista = opti.listaArticulo();
        %>
        <%
            ArrayList<Diseno_gs> arra = new ArrayList<>();
            Diseno_gs dise = new Diseno_gs();
            DisenoSelect sele = new DisenoSelect();
            arra = sele.SelectDiseno();
        %>
        <section class="contenedor">
            <div class="cuerpo">
                <div class="formularioActualizar" id="formularioActualizar">
                    <h2>Registrar un nuevo pedido</h2>
                    <form action="" method="POST">
                        <div class="formularioGrupo">
                            <input type="text" class="documento" id="documento" name="documento" value="<%=docu%>" required="" readonly="readonly">
                            <span class="barra"></span>
                            <label class="docu">Documento</label>
                        </div>
                        <input type="hidden" class="estado" id="estado" name="estado" value="Pedido">
                        <div class="formularioGrupo">
                            <input type="date" class="dateini" id="dateini" name="fepedido" required="">
                            <span class="barra"></span>
                            <label class="docu">Fecha Pedido</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="date" class="datefin" id="datefin" name="feentrega">
                            <span class="barra"></span>
                            <label>Fecha Entrega</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="text" class="direccion" id="direccion" name="direntrega" value="<%=direcc%>" required="">
                            <span class="barra"></span>
                            <label class="docu">Direccion Entrega</label>
                        </div>
                        <input type="hidden" class="tipo" id="tipo" name="tipo" value="Distribucion">
                        <div class="formularioGrupo">
                            <select class="articulo" id="articulo" name="articulo" required="">
                                <option value=""></option>
                                <%
                                    for(int i = 0; i < lista.size(); i++){
                                        arti = lista.get(i);
                                %>
                                <option value="<%=arti.getId()%>"><%=arti.getNombre()%><% } %></option>
                            </select>
                            <span class="barra"></span>
                            <label>Nombre Articulo</label>
                        </div>
                        <div class="formularioGrupo">
                            <select name="diseno" id="diseno" class="diseno" required="">
                                <option value=""></option>
                                <% for(int a = 0; a < arra.size(); a++){ 
                                    dise = arra.get(a);
                                %>
                                    <option value="<%=dise.getCod() %>"><%=dise.getNombre()%><% } %></option>

                            </select>
                            <span class="barra"></span> 
                            <label>Nombre del diseño</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="text" class="descripcion" id="descripcion" name="descripcion" required="">
                            <span class="barra"></span>
                            <label>Descripcion</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="text" class="cantidad" id="cantidad" name="cantidad" required="">
                            <span class="barra"></span>
                            <label>Cantidad</label>
                        </div>
                        <div class="formularioGrupo">
                            <input type="text" class="precio" id="precio" name="precio" required="">
                            <span class="barra"></span>
                            <label>Precio</label>
                        </div>
                        <button type="submit" class="btnEnviar" name="CargaPed">Registrar <i class="fa fa-sign-in ml-1"></i></button>
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
        <Script>
            (function (){
                fecha = new Date();
                
                var dia = fecha.getDate();
                var finmes = new Array(31,29,31,30,31,30,31,31,30,31,30,31);
                var ultimo = finmes[fecha.getMonth()]; //console.log(ultimo);
                var dia2 = fecha.getDate() + 6;
                var mes = fecha.getMonth()+1;
                var mes2 = fecha.getMonth()+1;
                var year = fecha.getFullYear();
                if(ultimo === 30){
                    if(dia2 === 31){dia2 = 1; mes2 = mes2 + 1;}
                    if(dia2 === 32){dia2 = 2; mes2 = mes2 + 1;}
                    if(dia2 === 33){dia2 = 3; mes2 = mes2 + 1;}
                    if(dia2 === 34){dia2 = 4; mes2 = mes2 + 1;}
                    if(dia2 === 35){dia2 = 5; mes2 = mes2 + 1;}
                    if(dia2 === 36){dia2 = 6; mes2 = mes2 + 1;}
                }
                if(ultimo === 31){
                    if(dia2 === 32){dia2 = 1; mes2 = mes2 + 1;}
                    if(dia2 === 33){dia2 = 2; mes2 = mes2 + 1;}
                    if(dia2 === 34){dia2 = 3; mes2 = mes2 + 1;}
                    if(dia2 === 35){dia2 = 4; mes2 = mes2 + 1;}
                    if(dia2 === 36){dia2 = 5; mes2 = mes2 + 1;}
                    if(dia2 === 37){dia2 = 6; mes2 = mes2 + 1;}
                }
                if(dia<10){
                    dia='0'+dia;
                }
                if(dia2<10){
                    dia2='0'+dia2;
                }
                if(mes<10){
                    mes = '0'+mes;
                }
                if(mes2<10){
                    mes2 = '0'+mes2;
                }
                var f = year+"-"+mes+"-"+dia; //console.log(f);
                var f2 = year+"-"+mes2+"-"+dia2;
//                var f2 = (f + 6);
//                alert(f2);
                var da = document.getElementsByTagName('input');
                da[3].value = f;
                da[4].value = f2;
            }());
        </Script>
        <% } %>
    </body>
</html>
