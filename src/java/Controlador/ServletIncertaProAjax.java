/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.GestionProveedores;
import Modelo.Proveedoresgetset;
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
@WebServlet(name = "ServletIncertaProAjax", urlPatterns = {"/ServletIncertaProAjax"})
public class ServletIncertaProAjax extends HttpServlet {

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
            String Nom, Apell, Dir, Telef, Corr, Cate, Esta;
            Nom = request.getParameter("nombre");
            Apell = request.getParameter("apellido");
            Dir = request.getParameter("direccion");
            Telef = request.getParameter("telefono");
            Corr = request.getParameter("correo");
            Cate = request.getParameter("categoria");
            Esta = request.getParameter("estado");
//            JOptionPane.showMessageDialog(null, Nom+"\n"+Apell+"\n"+Telef+"\n"+Corr+"\n"+Cate+"\n"+Esta);
            Proveedoresgetset usu = new Proveedoresgetset(Nom, Apell, Dir, Telef, Corr, Cate, Esta);
            GestionProveedores us = new GestionProveedores();
            boolean dat = us.IncertarProveedor(usu);
            if(dat){
                out.println("Datos guardados");
            }
//            if(dat){
//                JOptionPane.showMessageDialog(null, "Datos guardados");
//                response.sendRedirect("CreaPreveedores.jsp");
//            }else{
//                JOptionPane.showMessageDialog(null, "Error al guardar proveedor");
//                response.sendRedirect("CreaPreveedores.jsp");
//            }
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
