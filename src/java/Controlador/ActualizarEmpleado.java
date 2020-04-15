/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Empleadogetset;
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

/**
 *
 * @author VICTORH
 */
@WebServlet(name = "ActualizarEmpleado", urlPatterns = {"/ActualizarEmpleado"})
public class ActualizarEmpleado extends HttpServlet {

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
//                    JOptionPane.showMessageDialog(null, "Error al actualizar Empleado");
                    response.sendRedirect("ConsultaEmpleado.jsp");
                }
            }else{
                JOptionPane.showMessageDialog(null, "Error al actualizar Usuario");
                response.sendRedirect("ConsultaEmpleado.jsp");
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
