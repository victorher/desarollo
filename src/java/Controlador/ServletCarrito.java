/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.AddCarrito;
import Modelo.GestionDestalles;
import Modelo.detallesGetSet;
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


/**
 *
 * @author amico
 */
@WebServlet(name = "ServletCarrito", urlPatterns = {"/ServletCarrito"})
public class ServletCarrito extends HttpServlet {
    private String Documento, IdDiseno, IdArticulo, Cantidad, Direccion, Precio, estado;
    private int item=0;
   

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
        PrintWriter out = response.getWriter();
        
       

         Documento=request.getParameter("documento");
         IdDiseno=request.getParameter("diseno");
         IdArticulo=request.getParameter("articulo");
         Cantidad=request.getParameter("cantidad");
         Direccion=request.getParameter("direntrega");
         Precio=request.getParameter("precio");
         estado=request.getParameter("estado");
        
        HttpSession sesion = request.getSession(true);
        ArrayList<AddCarrito> Articulos = sesion.getAttribute("carrito") == null ? new 
        ArrayList<>() : (ArrayList) sesion.getAttribute("carrito");
        
        boolean dat=false;
        
        if (Articulos.size() > 0) {
            for (AddCarrito a : Articulos) {
                if (IdDiseno == a.getIdDiseno()) {
                    JOptionPane.showMessageDialog(null, "Este articulo ya existe");
                   
                    dat=true;
                }
            }
        }
        
        if (!dat) {
            Articulos.add(new AddCarrito(Documento, IdDiseno, IdArticulo, Cantidad, Direccion, Precio, estado, item));
            
            item=item+1;
            
            
            
       
        }
        
       
      
        
        sesion.setAttribute("carrito", Articulos);
        
        response.sendRedirect("Cliente.jsp");
       
        
        
  
        
  
       
            
            
        
            
            
            
            
            
            
        
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
