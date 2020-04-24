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
@WebServlet(name = "Filtrar", urlPatterns = {"/Filtrar"})
public class Filtrar extends HttpServlet {

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
            String nome = request.getParameter("datnom");
            out.print(nome);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Filtrar</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("        <div class='dataTables_length table-responsive text-nowrap vertical-table'>");
            out.println("            <table class='table table-striped table-bordered table-hover table-sm' cellspacing='0' width='100%'>");
            out.println("                <thead>");
            out.println("                    <tr class'btn-info'>");
            out.println("                        <th scope='col'>Nombre</th>");
            out.println("                        <th scope='col'>Apellido</th>");
            out.println("                        <th scope='col'>Documento</th>");
            out.println("                        <th scope='col'>Roll</th>");
            out.println("                        <th scope='col'>Telefono</th>");
            out.println("                        <th scope='col'>Genero</th>");
            out.println("                        <th scope='col'>Direccion</th>");
            out.println("                        <th scope='col'>Correo</th>");
            out.println("                        <th scope='col'>Clave</th>");
            out.println("                        <th scope='col'>Estado</th>");
            out.println("                        <th scope='col'>Actualizar</th>");
            out.println("                        <th scope='col'>Eliminar</th>");
            out.println("                    </tr>");
            out.println("                </thead>");
            out.println("                <tbody>");
                                
//                                    String doc = request.getParameter("bus");
                                    //JOptionPane.showMessageDialog(null, doc);
                                    ArrayList<ConUsuCliente> lista = new ArrayList<>(); //metodo getset
                                    ConUsuCliente fil = new ConUsuCliente(nome); //convas hago referencia al constructor vasio
                                    GestionCliente filrt = new GestionCliente();

                                    lista = filrt.FiltraCliente(fil);

                                    for(int i=0; i<lista.size(); i++){

                                        fil = lista.get(i);

                                

            out.println("                    <tr>");
            out.println("                        <td scope='row'>"+fil.getNombre()+"</td>");
            out.println("                        <td>"+fil.getApellido()+"</td>");
            out.println("                        <td>"+fil.getDocumento()+"</td>");
            out.println("                        <td>"+fil.getRol()+"</td>");
            out.println("                        <td>"+fil.getTelefono()+"</td>");
            out.println("                        <td>"+fil.getGenero()+"</td>");
            out.println("                        <td>"+fil.getDireccion()+"</td>");
            out.println("                        <td>"+fil.getCorreo()+"</td>");
            out.println("                        <td>"+fil.getClave()+"</td>");
            out.println("                        <td>"+fil.getEstado()+"</td>");
            out.println("                        <td>");
            out.println("                            <form action='' method='POST'>");
            out.println("                                <input type='hidden' name='cod' value="+fil.getDocumento()+">");
            out.println("                                <div class='text-center'>");
            out.println("                                    <button type='submit' name='modifica' value='ACTUALIZAR' class='img-fluid btn-success'>");
            out.println("                                        <i class='fa fa-wrench' aria-hidden='true'></i>");
            out.println("                                    </button>");
            out.println("                                </div>");
            out.println("                            </form>");
            out.println("                        </td>");
            out.println("                        <td>");
            out.println("                            <form action='ServletGestionUsu' method='POST'>");
            out.println("                                <input type='hidden' name='cod' value="+fil.getDocumento()+">");
            out.println("                                <div class='text-center'>");
            out.println("                                    <button type='submit' name='EliminaUsuario' value='ELIMINAR' class='img-fluid btn-danger' onclick='return Eliminar()'>");
            out.println("                                        <i class='fa fa-trash-o' aria-hidden='true'></i>");
            out.println("                                    </button>");
            out.println("                                </div>");
            out.println("                            </form>");
            out.println("                        </td>");
            out.println("                    </td>");
            out.println("                    </tr>");

                                
                                   }
                                
            out.println("                </tbody>");
            out.println("            </table>");
            out.println("        </div>");
            out.println("    </div>");
//            out.println("<h1>Servlet Filtrar at " + request.getContextPath() + "</h1>");
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
