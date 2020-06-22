/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.AddCarrito;
import Modelo.Disenogetset;
import Modelo.GestionDiseno;
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
@WebServlet(name = "ServletEliCarrito", urlPatterns = {"/ServletEliCarrito"})
public class ServletEliCarrito extends HttpServlet {

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
          
        
        
        String IdDiseno;
        
        IdDiseno = request.getParameter("Iddiseno");
        
        
        HttpSession sesion = request.getSession();
        ArrayList<AddCarrito> Articulos = sesion.getAttribute("carrito") == null ? null : 
        (ArrayList) sesion.getAttribute("carrito");
        
            
            if(Articulos != null){
                for(AddCarrito a: Articulos){
                    if(IdDiseno == IdDiseno){
                        Articulos.remove(a);
                        JOptionPane.showMessageDialog(null, "Eliminado");
                        break;
                    }
                }
            }    
            
            int total = 0;
            GestionDiseno Gd = new GestionDiseno();
            for(AddCarrito a: Articulos){                                 
                Disenogetset Dgs = Gd.GetId(a.getIdDiseno());
                total += a.getCantidad() * Dgs.getPreDiseno();
                
                
                               
            }
            JOptionPane.showMessageDialog(null, total);
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
