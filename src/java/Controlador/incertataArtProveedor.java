package Controlador;

import Modelo.CatArticulogetset;
import Modelo.GestionArtCategoria;
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
@WebServlet(name = "incertataArtProveedor", urlPatterns = {"/incertataArtProveedor"})
public class incertataArtProveedor extends HttpServlet {

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
            String Nom, Des;
            Nom = request.getParameter("nombre");
            Des = request.getParameter("descripcion");
//            JOptionPane.showMessageDialog(null, Nom+"\n"+Des);
            CatArticulogetset usu = new CatArticulogetset(Nom, Des);
            GestionArtCategoria us = new GestionArtCategoria();
            boolean dat = us.IncertarCatArticulo(usu);
            if(dat){
                request.getRequestDispatcher("CreaArtProveedor.jsp").forward(request, response);
//                JOptionPane.showMessageDialog(null, "Datos guardados");
//                response.sendRedirect("CreaArtProveedor.jsp");
            }else{
                request.getRequestDispatcher("CreaArtProveedor.jsp").forward(request, response);
//                JOptionPane.showMessageDialog(null, "Error al guardar la categoria");
//                response.sendRedirect("CreaArtProveedor.jsp");
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
