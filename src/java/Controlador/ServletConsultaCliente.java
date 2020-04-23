/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConUsuCliente;
import Modelo.GestionCliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
@WebServlet(name = "ServletConsultaCliente", urlPatterns = {"/ServletConsultaCliente"})
public class ServletConsultaCliente extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletConsultaCliente</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            out.println("<table>");
            out.println("<tr>");
            out.println("<th>Nombre</th>");
            out.println("<th>Apellido</th>");
            out.println("<th>Clave</th>");
            out.println("</tr>");
            ArrayList<ConUsuCliente> listas = new ArrayList();
            ConUsuCliente con = new ConUsuCliente(); //convas hago referencia al constructor vasio
            GestionCliente Cons = new GestionCliente();

            listas = Cons.ConsultaCliente();

            for(int i=0; i<listas.size(); i++){

                con = listas.get(i);
            out.println("<tr>");
                out.println("<td>"+con.getNombre()+"</td>");
                out.println("<td>"+con.getApellido()+"</td>");
                out.println("<td>"+con.getClave()+"</td>");
            out.println("</tr>");
            }
            out.println("</table>");
            
            //out.println("<h1>Servlet ServletConsultaCliente at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
