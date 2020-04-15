/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Disenogetset;
import Modelo.GestionDiseno;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author VICTORH
 */
@WebServlet(name = "ServletDisenoActualiza", urlPatterns = {"/ServletDisenoActualiza"})
@MultipartConfig //se usa para indicar al servidor
public class ServletDisenoActualiza extends HttpServlet {

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
            String IDDiseno, NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis;
            IDDiseno = request.getParameter("iddiseno");
            NumDet = request.getParameter("numdetalle");
            TexDis = request.getParameter("texdiseno");
            TamDis = request.getParameter("tamdiseno");
            ColDis = request.getParameter("coldiseno");
            PrecDis = request.getParameter("prediseno");
            ObsDis = request.getParameter("obsdiseno");
//            Part foto = request.getPart("imgdiseno");
//            String nomfoto = foto.getSubmittedFileName();
            //JOptionPane.showMessageDialog(null, IDDiseno);
//            String nombre = NumDet + "_" + nomfoto;
//            String Url = "C:\\Users\\VICTORH\\Documents\\NetBeansProjects\\EntreSuenos\\web\\img\\" + nombre;
//            String Url2 = "img/" + nombre;
            String Url2 = "defecto.png";
            
//            InputStream file = foto.getInputStream();
//            File f = new File(Url);
//            FileOutputStream sal = new FileOutputStream(f);
//            int num = file.read(); //read es un metodo de la clase file
//            while(num != -1){
//                sal.write(num);
//                num = file.read();
//            }
//            JOptionPane.showMessageDialog(null, IDDiseno+"\n"+NumDet+"\n"+TexDis+"\n"+
//                    TamDis+"\n"+ColDis+"\n"+PrecDis+"\n"+ObsDis+"\n"+Url2);
            Disenogetset usu = new Disenogetset(IDDiseno, NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis, Url2);
            GestionDiseno us = new GestionDiseno();
            boolean dat = us.ActaulizarDiseno(usu);
            if(dat){
//                JOptionPane.showMessageDialog(null, "Datos actualizados");
                response.sendRedirect("ConsultaDiseno.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Error al actualizar diseno");
                response.sendRedirect("ConsultaDiseno.jsp");
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
