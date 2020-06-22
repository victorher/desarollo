/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GestionDestalles;
import Modelo.GestionPedidos;
import Modelo.Pedidosgetset;
import Modelo.detallesGetSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "ServletPedidoRegistra", urlPatterns = {"/ServletPedidoRegistra"})
public class ServletPedidoRegistra extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String doc, est, direcc, tipo, idA, idD, desc, canti, prec;
            idA = "1";
            idD = request.getParameter("diseno");
            desc = request.getParameter("descripcion");
            canti = request.getParameter("cantidad");
            prec = request.getParameter("precio");
            doc = request.getParameter("documento");
            est = request.getParameter("estado");
            direcc = request.getParameter("direntrega");
            tipo = request.getParameter("tipo");
//            JOptionPane.showMessageDialog(null, "IDArticulo: "+idA+"\n IDDiseno: "+idD+"\n Descripcion: "+desc+"\n Cantidad: "+canti+"\n Precio: "+prec);
//            JOptionPane.showMessageDialog(null, "Documento: "+doc+"\n Estado: "+est+"\n Direccion: "+direcc+"\n Tipo: "+tipo);
            detallesGetSet dise = new detallesGetSet(idA, idD, desc, canti, prec);
            GestionDestalles gdet = new GestionDestalles();
            boolean desen = gdet.IncertarDetalles(dise);
//            gdet.IncertarDetalles(dise);
//            JOptionPane.showMessageDialog(null, desen);
            if(desen){
//                JOptionPane.showMessageDialog(null, "Documento: "+doc+"\n Estado: "+est+"\n Direccion: "+direcc+"\n Tipo: "+tipo);
                Pedidosgetset usu = new Pedidosgetset(doc, est, direcc, tipo);
                GestionPedidos us = new GestionPedidos();
                boolean dat = us.IncertarPedido(usu);
                if(dat){
                    request.getRequestDispatcher("CreaPedidos.jsp").forward(request, response);
//                JOptionPane.showMessageDialog(null, "Datos guardados");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar pedido");
                response.sendRedirect("CreaPedidos.jsp");
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
