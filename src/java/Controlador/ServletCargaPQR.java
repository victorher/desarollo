/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.pqrGetSet;
import Modelo.prrMovimientos;
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
 * @author VICTORH
 */
@WebServlet(name = "ServletCargaPQR", urlPatterns = {"/ServletCargaPQR"})
public class ServletCargaPQR extends HttpServlet {

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
//            String opc = request.getParameter("op");
//            JOptionPane.showMessageDialog(null, opc);
//            if(opc.equals("enviar")){
                String tipo, nombre, email, mensaje;
                nombre = request.getParameter("nombre");
                email = request.getParameter("email");
                tipo = request.getParameter("tipo");
                mensaje = request.getParameter("mensaje");
//                JOptionPane.showMessageDialog(null, tipo+"\n"+nombre+"\n"+email+"\n"+mensaje);
                pqrGetSet pqr = new pqrGetSet(tipo, nombre, email, mensaje);
                prrMovimientos prr = new prrMovimientos();
                boolean dat = prr.IncertarPQR(pqr);
                out.print(dat);
    //            if(dat){
    //                request.getRequestDispatcher("PQR.jsp").forward(request, response);
    //            }else{
    //                out.println("<!DOCTYPE html>");
    //                out.println("<html>");
    //                out.println("<head>");
    //                out.println("<script type='text/javascript'>alert('Los datos no quedaron cargados');</script>");
    //                out.println("</head>");
    //                out.println("</html>");
    //                request.getRequestDispatcher("PQR.jsp").forward(request, response);
    //            }
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
