package Controlador;

import Modelo.GestionPedidos;
import Modelo.Pedidosgetset;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet(name = "ServletPedidos", urlPatterns = {"/ServletPedidos"})
public class ServletPedidos extends HttpServlet {

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
            if(request.getParameter("CargaPed")!=null){
                IncertaPedido(request,response);
            }
            if(request.getParameter("ActualizaPed")!=null){
                ActualizaPedido(request,response);
            }
            if(request.getParameter("EliminaPedido")!=null){
                EliminaPedido(request,response);
            }
        }
    }
    /*REGISTRA UN PEDIDO*/
    protected void IncertaPedido(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, est, fecped, fecentr, direcc, tipo;
            doc = request.getParameter("documento");
            est = request.getParameter("estado");
            fecped = request.getParameter("fepedido");
            fecentr = request.getParameter("feentrega");
            direcc = request.getParameter("direntrega");
            tipo = request.getParameter("tipo");
//            JOptionPane.showMessageDialog(null, doc+"\n"+est+"\n"+fecped+"\n"+fecentr+"\n"+direcc+"\n"+tipo);
            Pedidosgetset usu = new Pedidosgetset(doc, est, fecped, fecentr, direcc, tipo);
            GestionPedidos us = new GestionPedidos();
            boolean dat = us.IncertarPedido(usu);
            if(dat){
                JOptionPane.showMessageDialog(null, "Datos guardados");
                response.sendRedirect("CreaPedidos.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar pedido");
                response.sendRedirect("CreaPedidos.jsp");
            }
        }
    }
    /*ACTUALIZA UN PEDIDO*/
    protected void ActualizaPedido(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String doc, est, fecped, fecentr, direcc, tipo;
            doc = request.getParameter("documento");
            est = request.getParameter("estado");
            fecped = request.getParameter("fepedido");
            fecentr = request.getParameter("feentrega");
            direcc = request.getParameter("direntrega");
            tipo = request.getParameter("tipo");
//            JOptionPane.showMessageDialog(null, doc+"\n"+est+"\n"+fecped+"\n"+fecentr+"\n"+direcc+"\n"+tipo);
            Pedidosgetset usu = new Pedidosgetset(doc, est, fecped, fecentr, direcc, tipo);
            GestionPedidos us = new GestionPedidos();
            boolean dat = us.ActaulizarPedidos(usu);
            if(dat){
                JOptionPane.showMessageDialog(null, "Datos actualizados");
                response.sendRedirect("ConsultaPedidos.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Error al actualizar diseño");
                response.sendRedirect("ConsultaPedidos.jsp");
            }
        }
    }
    /*ELIMINA UN PEDIDO*/
    protected void EliminaPedido(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            String COD;
            COD = request.getParameter("cod");
            //JOptionPane.showMessageDialog(null, IDDis);
            Pedidosgetset cli = new Pedidosgetset(COD);
            GestionPedidos us = new GestionPedidos();
            if(us.EliminarPedidos(cli)){
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
