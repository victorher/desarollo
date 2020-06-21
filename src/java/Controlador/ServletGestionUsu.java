package Controlador;

import Modelo.Clientegetset;
import Modelo.Empleadogetset;
import Modelo.GestionCliente;
import Modelo.GestionEmpleados;
import Modelo.Usuario;
import Modelo.Usuariogetset;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "ServletGestionUsu", urlPatterns = {"/ServletGestionUsu"})
public class ServletGestionUsu extends HttpServlet {

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
            if(request.getParameter("CargaEmp")!=null){
                IncertaEmpleado(request,response);
            } 
            if(request.getParameter("CargaCli")!=null){
                IncertaCliente(request,response);
            }
            if(request.getParameter("ActualizaEmp")!=null){
                ActualizaEmpleado(request,response);
            }
            if(request.getParameter("ActualizaCli")!=null){
                ActualizaCliente(request,response);
            }
            if(request.getParameter("EliminaUsuario")!=null){
                EliminaUsuario(request,response);
            }
        }
    }
    /*REGISTRA UN EMPLEADO GUARDANDO LOS DATOS EN USUARIO Y LUEGO EN EMPLEADO*/
    protected void IncertaEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, cla, roll, est, nom, ape, tel, gen, dir, corr;
            doc=request.getParameter("documento");
            cla=request.getParameter("contra");
            roll=request.getParameter("rol");
            est=request.getParameter("estado");
            nom=request.getParameter("nombre");
            ape=request.getParameter("apellido");
            tel=request.getParameter("telefono");
            gen=request.getParameter("sexo");
            dir=request.getParameter("direccion");
            corr=request.getParameter("correo");
//            JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
            Usuariogetset usu = new Usuariogetset(doc, cla, roll, est);
            Usuario us = new Usuario();
            boolean dat = us.IncertarUsuario(usu);
            if(dat){
                Empleadogetset emp = new Empleadogetset(doc, nom, ape, tel, gen, dir, corr);
                GestionEmpleados gem = new GestionEmpleados();
                boolean datem = gem.IncertarEmpleado(emp);
                if(datem){
//                    JOptionPane.showMessageDialog(null, "Datos guardados");
                    response.sendRedirect("CreaEmpleado.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "Error al guardar Empleado");
                    response.sendRedirect("CreaEmpleado.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar Usuario");
                response.sendRedirect("CreaEmpleado.jsp");
            }
        }
    }
    /*REGISTRA UN CLIENTE GUARDANDO LOS DATOS EN USUARIO Y LUEGO EN CLIENTE*/
    protected void IncertaCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, cla, roll, est, nom, ape, tel, gen, dir, corr;
            doc=request.getParameter("documento");
            cla=request.getParameter("contra");
            roll=request.getParameter("rol");
            est=request.getParameter("estado");
            nom=request.getParameter("nombre");
            ape=request.getParameter("apellido");
            tel=request.getParameter("telefono");
            gen=request.getParameter("sexo");
            dir=request.getParameter("direccion");
            corr=request.getParameter("correo");
//            JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
            Usuariogetset usu = new Usuariogetset(doc, cla, roll, est);
            Usuario cl = new Usuario();
            boolean dat = cl.IncertarUsuario(usu);
            if(dat){
//                JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
                Clientegetset dhl = new Clientegetset(doc, nom, ape, tel, gen, dir, corr);
                GestionCliente gem = new GestionCliente();
                boolean datcl = gem.IncertarCliente(dhl);
                if(datcl){
//                    JOptionPane.showMessageDialog(null, "Datos guardados");
                    response.sendRedirect("CreaCliente.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "Error al guardar Cliente");
                    response.sendRedirect("CreaCliente.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar Usuario");
                response.sendRedirect("CreaCliente.jsp");
            }
        }
    }
    /*ACTUALIZA UN EMPLEADO GUARDANDO LOS DATOS EN USUARIO Y LUEGO EN EMPLEADO*/
    protected void ActualizaEmpleado(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, cla, roll, est, nom, ape, tel, gen, dir, corr;
            doc=request.getParameter("documento");
            cla=request.getParameter("contra");
            roll=request.getParameter("rol");
            est=request.getParameter("estado");
            nom=request.getParameter("nombre");
            ape=request.getParameter("apellido");
            tel=request.getParameter("telefono");
            gen=request.getParameter("sexo");
            dir=request.getParameter("direccion");
            corr=request.getParameter("correo");
//            JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
            Usuariogetset usu = new Usuariogetset(doc, cla, roll, est);
            Usuario us = new Usuario();
            boolean dat = us.actaulizarUsuario(usu);
            if(dat){
                Empleadogetset emp = new Empleadogetset(doc, nom, ape, tel, gen, dir, corr);
                GestionEmpleados gem = new GestionEmpleados();
                boolean datem = gem.actaulizarEmpleado(emp);
                if(datem){
//                    JOptionPane.showMessageDialog(null, "Datos actualizados");
                    response.sendRedirect("ConsultaEmpleado.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "Error al actualizar Empleado");
                    response.sendRedirect("ConsultaEmpleado.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al actualizar Usuario");
                response.sendRedirect("ConsultaEmpleado.jsp");
            }
        }
    }
    /*ACTUALIZA UN CLIENTE GUARDANDO LOS DATOS EN USUARIO Y LUEGO EN CLIENTE*/
    protected void ActualizaCliente(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, cla, roll, est, nom, ape, tel, gen, dir, corr;
            doc=request.getParameter("documento");
            cla=request.getParameter("contra");
            roll=request.getParameter("rol");
            est=request.getParameter("estado");
            nom=request.getParameter("nombre");
            ape=request.getParameter("apellido");
            tel=request.getParameter("telefono");
            gen=request.getParameter("sexo");
            dir=request.getParameter("direccion");
            corr=request.getParameter("correo");
//            JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
            Usuariogetset usu = new Usuariogetset(doc, cla, roll, est);
            Usuario cl = new Usuario();
            boolean dat = cl.actaulizarUsuario(usu);
            if(dat){
//                JOptionPane.showMessageDialog(null, doc+"\n "+cla+"\n "+roll+"\n "+
//                    est+"\n "+nom+"\n "+ape+"\n "+tel+"\n "+gen+"\n "+dir+"\n "+corr);
                Clientegetset dhl = new Clientegetset(doc, nom, ape, tel, gen, dir, corr);
                GestionCliente gem = new GestionCliente();
                boolean datcl = gem.actaulizarCliente(dhl);
                if(datcl){
//                    JOptionPane.showMessageDialog(null, "Datos actualizados");
                    response.sendRedirect("ConsultaCliente.jsp");
                }else{
                    JOptionPane.showMessageDialog(null, "Error al actualizar Cliente");
                    response.sendRedirect("ConsultaCliente.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al actualizar Usuario");
                response.sendRedirect("ConsultaCliente.jsp");
            }
        }
    }
    /*ELIMINA UN USUARIO BORRANDO TODO SU HISTORIAL*/
    protected void EliminaUsuario(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            String doc;
            doc=request.getParameter("cod");
            //JOptionPane.showMessageDialog(null, doc);
            Usuariogetset cli = new Usuariogetset(doc);
            Usuario us = new Usuario();
            if(us.EliminarUsuario(cli)){
                JOptionPane.showMessageDialog(null, "Datos Eliminados");
                response.sendRedirect("Principal.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Los Datos no fueron eliminados");
                response.sendRedirect("Principal.jsp");
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
