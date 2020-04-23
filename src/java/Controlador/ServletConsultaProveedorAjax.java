package Controlador;

import Modelo.GestionProveedores;
import Modelo.Proveedoresgetset;
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
@WebServlet(name = "ServletConsultaProveedorAjax", urlPatterns = {"/ServletConsultaProveedorAjax"})
public class ServletConsultaProveedorAjax extends HttpServlet {

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
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container container-cards'>");
            out.println("    <div class='table'>");
            out.println("        <form action='' method='POST'>");
            out.println("            <table class='table-responsive table-hover table-borderless table-sm'>");
            out.println("                <thead>");
            out.println("                    <tr style='background: linear-gradient(-90deg, #8E2DE2, #4A00E0);'>");
            out.println("                        <th scope='col' class='text-center'>Codigo</th>");
            out.println("                        <th scope='col' class='text-center'>Nombre</th>");
            out.println("                        <th scope='col' class='text-center'>Apellidos</th>");
            out.println("                        <th scope='col' class='text-center'>Direccion</th>");
            out.println("                        <th scope='col' class='text-center'>Telefono</th>");
            out.println("                        <th scope='col' class='text-center'>Correo</th>");
            out.println("                        <th scope='col' class='text-center'>Categoria</th>");
            out.println("                        <th scope='col' class='text-center'>Estado</th>");
            out.println("                        <th scope='col' class='text-center'>Actualizar</th>");
            out.println("                        <th scope='col' class='text-center'>Eliminar</th>");
            out.println("                    </tr>");
            out.println("                </thead>");
            out.println("                <tbody>");
                                
                                    ArrayList<Proveedoresgetset> listas = new ArrayList<>();
                                    Proveedoresgetset con = new Proveedoresgetset(); //convas hago referencia al constructor vasio
                                    GestionProveedores Cons = new GestionProveedores();

                                    listas = Cons.ConsultarProveedores();

                                    for(int i=0; i<listas.size(); i++){

                                        con = listas.get(i);

                                

            out.println("                    <tr>");
            out.println("                        <td scope='row'><input class='input-group-text border-0 text-center table proveedorID' value='"+con.getProveedorID()+"' name='proveedorID'></td>");
            out.println("                        <td><input class='border-0 input-group-text nombr' value='"+con.getNombrePro()+"' name='nombr'></td>");
            out.println("                        <td><input class='border-0 input-group-text apellido' value='"+con.getApellidoPro()+"' name='apellido'></td>");
            out.println("                        <td><input class='border-0 input-group-text direccion' value='"+con.getDireccionPro()+"' name='direccion'></td>");
            out.println("                        <td><input class='border-0 input-group-text telefono' value='"+con.getTelefonoPro()+"' name='telefono'></td>");
            out.println("                        <td><input class='border-0 input-group-text correo' size='30' value='"+con.getCorreoPro()+"' name='correo'></td>");
            out.println("                        <td><input class='border-0 input-group-text categori' value='"+con.getCategoriaPro()+"' name='categori'></td>");
            out.println("                        <td><input class='border-0 input-group-text estado' value='"+con.getEstadoPro()+"' name='estado'></td>");
            out.println("                        <td>");
            out.println("                            <input type='hidden' name='' value=value='"+con.getProveedorID()+"'>");
            out.println("                            <div class='text-center'>");
            out.println("                                <button type='submit' name='ActualizaPro' class='btn-success img-fluid btnmod'><i class='fa fa-wrench' aria-hidden='true'></i></button>");
            out.println("                            </div>");
            out.println("                        </td>");
            out.println("                        <td>");
            out.println("                            <input type='hidden' name='' value=value='"+con.getProveedorID()+"' class='text-center'>");
            out.println("                            <div class='text-center'>");
            out.println("                                <button type='submit' name='EliminaPro' class='btn-danger img-fluid' onclick='return Eliminar()'><i class='fa fa-trash-o' aria-hidden='true'></i></button>");
            out.println("                            </div>");
            out.println("                        </td>");
            out.println("                    </tr>");
                                }
            out.println("                </tbody>");
            out.println("            </table>");
            out.println("        </form>");
            out.println("    </div>");
            out.println("</div>");
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
