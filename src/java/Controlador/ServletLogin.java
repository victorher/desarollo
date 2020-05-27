package Controlador;

import Modelo.GeneroEmpGS;
import Modelo.Logueo;
import Modelo.Usuariogetset;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {
    private String doc, cont, rol, est, nomb, apell, sexo, nombre, pedido, empleado, direc;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("btnlogin")!=null){
                String us, co, docu;
                ArrayList<Usuariogetset> usu = new ArrayList<>();
                us = request.getParameter("usu");
                co = request.getParameter("con");
//                JOptionPane.showMessageDialog(null, "Doc: "+us+" Cla: "+co);
                Usuariogetset usgs = new Usuariogetset(us, co);
                Logueo lo = new Logueo();
                usu = lo.login(usgs);
//                JOptionPane.showMessageDialog(null, usu+" ingresa");
                if(usu.size()>0){
                    for(int i = 0; i < usu.size(); i++){
                        usgs = usu.get(i);
                        String cli="Cliente", adm="Administrador", emp="Empleado", mas="Masculino", pos = "1";
                        docu = (doc = usgs.getDocumento());
                        cont = usgs.getClave();
                        rol = usgs.getRoll();
                        est = usgs.getEstado();
//                        JOptionPane.showMessageDialog(null, "User: "+doc+" Pass: "+cont+" "+rol);
                        ArrayList<GeneroEmpGS> gen = new ArrayList<>();
                        GeneroEmpGS sex = new GeneroEmpGS(docu);
                        
                        //INGRESA COMO ADMINISTRADOR////
                        if(us.equals(doc) && co.equals(cont) && adm.equals(rol)){
                            //JOptionPane.showMessageDialog(null, docu);
                            gen = lo.GenEmp(sex);
                            //JOptionPane.showMessageDialog(null, sex);
                            if(gen.size()>0){
                                for(int a = 0; a < gen.size(); a ++){
                                    sex = gen.get(a);
                                    nomb = sex.getNombre();
                                    apell = sex.getApellido();
                                    sexo = sex.getGenero();
                                    direc = sex.getDireccion();
                                    if(mas.equals(sexo) && pos.equals(est)){
                                        //JOptionPane.showMessageDialog(null, "Bienvenido " + nomb + " " + apell);
                                        //nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Principal.jsp");
                                        empleado = "Principal.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }else{
                                        //JOptionPane.showMessageDialog(null, "Bienvenida " + nomb + " " + apell);
                                        //nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Principal.jsp");
                                        empleado = "Principal.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }
                                }
                            }
                        }
                        
                        //INGRESA COMO EMPLEADO////
                        if(us.equals(doc) && co.equals(cont) && emp.equals(rol)){
//                            JOptionPane.showMessageDialog(null, docu);
//                            ArrayList<GeneroEmpGS> gen = new ArrayList<>();
//                            GeneroEmpGS sex = new GeneroEmpGS(docu);
                            gen = lo.GenEmp(sex);
//                            JOptionPane.showMessageDialog(null, gen);
                            if(gen.size()>0){
                                for(int a = 0; a < gen.size(); a ++){
                                    sex = gen.get(a);
                                    nomb = sex.getNombre();
                                    apell = sex.getApellido();
                                    sexo = sex.getGenero();
                                    direc = sex.getDireccion();
//                                    JOptionPane.showMessageDialog(null, nomb+" "+apell+" "+sexo);
                                    if(mas.equals(sexo) && pos.equals(est)){
//                                        JOptionPane.showMessageDialog(null, "Bienvenido " + nomb + " " + apell);
//                                        nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Empleado.jsp");
                                        empleado = "Empleado.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }else{
                                        //JOptionPane.showMessageDialog(null, "Bienvenida " + nomb + " " + apell);
                                        //nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Empleado.jsp");
                                        empleado = "Empleado.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }
                                }
                            }
                        }
                        
                        //INGRESA COMO CLIENTE////
                        if(us.equals(doc) && co.equals(cont) && cli.equals(rol)){
                            //JOptionPane.showMessageDialog(null, docu);
                            //ArrayList<GeneroEmpGS> gen = new ArrayList<>();
                            //GeneroEmpGS sex = new GeneroEmpGS(docu);
                            gen = lo.GenCli(sex);
                            //JOptionPane.showMessageDialog(null, sex);
                            if(gen.size()>0){
                                for(int a = 0; a < gen.size(); a ++){
                                    sex = gen.get(a);
                                    nomb = sex.getNombre();
                                    apell = sex.getApellido();
                                    sexo = sex.getGenero();
                                    direc = sex.getDireccion();
                                    //JOptionPane.showMessageDialog(null, nomb+" "+apell+" "+sexo);
                                    if(mas.equals(sexo)){
                                        //JOptionPane.showMessageDialog(null, "Bienvenido " + nomb + " " + apell);
                                        //nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Cliente.jsp");
                                        empleado = "Cliente.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }else{
                                        //JOptionPane.showMessageDialog(null, "Bienvenida " + nomb + " " + apell);
                                        //nomb = (nomb + " " + apell);
                                        HttpSession sesion = request.getSession();
                                        response.sendRedirect("Cliente.jsp");
                                        empleado = "Cliente.jsp";
                                        pedido = "Pedidos.jsp";
                                        sesion.setAttribute("Nombre", nomb);
                                        sesion.setAttribute("Apellido", apell);
                                        sesion.setAttribute("Genero", sexo);
                                        sesion.setAttribute("Documento", doc);
                                        sesion.setAttribute("Contrasena", cont);
                                        sesion.setAttribute("Direccion", direc);
                                        sesion.setAttribute("Rol", rol);
                                    }
                                }
                            }
                        }
                    }
                }else{
                    JOptionPane.showMessageDialog(null, "Usuarios o Contraseña inconrrectos");
                    response.sendRedirect("index.jsp");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
