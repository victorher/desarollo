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

@WebServlet(name = "ServletCatArticulo", urlPatterns = {"/ServletCatArticulo"})
public class ServletCatArticulo extends HttpServlet {

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
            if(request.getParameter("CargaArt")!=null){
                IncertaArtProveedor(request,response);
            }
//            if(request.getParameter("ActualizaArt")!=null){
//                ActualizaArtProveedor(request,response);
//            }
            if(request.getParameter("EliminaArt")!=null){
                EliminaArtProveedor(request,response);
            }
        }
    }
    /*REGISTRA UNA CATEGORIA*/
    protected void IncertaArtProveedor(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String Nom, Des;
            Nom = request.getParameter("nombre");
            Des = request.getParameter("descripcion");
//            JOptionPane.showMessageDialog(null, Nom+"\n"+Des);
            CatArticulogetset usu = new CatArticulogetset(Nom, Des);
            GestionArtCategoria us = new GestionArtCategoria();
            boolean dat = us.IncertarCatArticulo(usu);
            if(dat){
                JOptionPane.showMessageDialog(null, "Datos guardados");
                response.sendRedirect("CreaArtProveedor.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar la categoria");
                response.sendRedirect("CreaArtProveedor.jsp");
            }
        }
    }
    /*ACTUALIZA UNA CATEGORIA*/
//    protected void ActualizaArtProveedor(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//        try (PrintWriter out = response.getWriter()) {
//            String ID, Nom, Des;
//            ID = request.getParameter("id");
//            Nom = request.getParameter("nombre");
//            Des = request.getParameter("descripcion");
////            JOptionPane.showMessageDialog(null, ID+"\n"+Nom+"\n"+Des);
//            CatArticulogetset usu = new CatArticulogetset(ID, Nom, Des);
//            GestionArtCategoria us = new GestionArtCategoria();
//            boolean dat = us.ActaulizarCatArticulo(usu);
//            if(dat){
//                JOptionPane.showMessageDialog(null, "Datos actualizados");
//                response.sendRedirect("ConsultaArtProveedor.jsp");
//            }else{
//                JOptionPane.showMessageDialog(null, "Error al actualizar la categoria");
//                response.sendRedirect("ConsultaArtProveedor.jsp");
//            }
//        }
//    }
    /*ELIMINA UNA CATEGORIA*/
    protected void EliminaArtProveedor(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            String COD;
            COD = request.getParameter("cod");
            //JOptionPane.showMessageDialog(null, COD);
            CatArticulogetset cli = new CatArticulogetset(COD);
            GestionArtCategoria us = new GestionArtCategoria();
            if(us.EliminarCatArticulo(cli)){
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
