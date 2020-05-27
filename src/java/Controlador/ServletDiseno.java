package Controlador;

import Modelo.Disenogetset;
import Modelo.GestionDiseno;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

@WebServlet(name = "ServletDiseno", urlPatterns = {"/ServletDiseno"})
@MultipartConfig //se usa para indicar al servidor
public class ServletDiseno extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("CargaDis")!=null){
                IncertaDiseno(request,response);
            }
////            if(request.getParameter("ActualizaDis")!=null){
////                ActualizaDiseno(request,response);
////            }
            if(request.getParameter("EliminaDiseno")!=null){
                EliminaDiseno(request,response);
            }
        }
    }
    /*REGISTRA UN DISEÑO*/
    protected void IncertaDiseno(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            
            //JOptionPane.showMessageDialog(null, "servelt");
            String NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis;
            NumDet = request.getParameter("numdetalle");
            TexDis = request.getParameter("texdiseno");
            TamDis = request.getParameter("tamdiseno");
            ColDis = request.getParameter("coldiseno");
            PrecDis = request.getParameter("prediseno");
            ObsDis = request.getParameter("obsdiseno");
            Part foto = request.getPart("imgdiseno");
            String nomfoto = foto.getSubmittedFileName();

            String nombre = NumDet + "_" + nomfoto;
            String Url = "C:\\Users\\VICTORH\\Documents\\NetBeansProjects\\EntreSuenos\\web\\img\\" + nombre;
//            String Url3 = "C:\\xampp\\htdocs\\EntreSuenos\\img\\" + nombre;
            String Url2 = nombre;
            
            InputStream file = foto.getInputStream();
            InputStream archivo = foto.getInputStream();
            File f = new File(Url);
//            File fa = new File(Url3);
            FileOutputStream sal = new FileOutputStream(f);
//            FileOutputStream otro = new FileOutputStream(fa);
            int num = file.read(); //read es un metodo de la clase file
            int num1 = archivo.read(); //read es un metodo de la clase file
            while(num != -1){
                sal.write(num);
                num = file.read();
            }
//            while(num1 != -1){
//                otro.write(num1);
//                num1 = archivo.read();
//            }
//            JOptionPane.showMessageDialog(null, NumDet+"\n"+TexDis+"\n"+TamDis+"\n"+
//                    ColDis+"\n"+PrecDis+"\n"+ObsDis+"\n"+Url2);
            Disenogetset usu = new Disenogetset(NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis, Url2);
            GestionDiseno us = new GestionDiseno();
            boolean dat = us.IncertarDiseno(usu);
            if(dat){
                JOptionPane.showMessageDialog(null, "Datos guardados");
                response.sendRedirect("CreaDiseno.jsp");
            }else{
                JOptionPane.showMessageDialog(null, "Error al guardar diseno");
                response.sendRedirect("CreaDiseno.jsp");
            }
        }
    }
    /*ACTUALIZA UN DISEÑO*/
//    protected void ActualizaDiseno(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//        try (PrintWriter out = response.getWriter()) {
//            
//            String IDDiseno, NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis;
//            IDDiseno = request.getParameter("iddiseno");
//            NumDet = request.getParameter("numdetalle");
//            TexDis = request.getParameter("texdiseno");
//            TamDis = request.getParameter("tamdiseno");
//            ColDis = request.getParameter("coldiseno");
//            PrecDis = request.getParameter("prediseno");
//            ObsDis = request.getParameter("obsdiseno");
//            Part foto = request.getPart("imgdiseno");
//            String nomfoto = foto.getSubmittedFileName();
//            JOptionPane.showMessageDialog(null, IDDiseno);
//            String nombre = NumDet + "_" + nomfoto;
//            String Url = "C:\\Users\\VICTORH\\Documents\\NetBeansProjects\\EntreSuenos\\web\\img\\" + nombre;
//            String Url2 = "img/" + nombre;
//            
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
//            Disenogetset usu = new Disenogetset(IDDiseno, NumDet, TexDis, TamDis, ColDis, PrecDis, ObsDis, Url2);
//            GestionDiseno us = new GestionDiseno();
//            boolean dat = us.ActaulizarDiseno(usu);
//            if(dat){
//                JOptionPane.showMessageDialog(null, "Datos actualizados");
//                response.sendRedirect("ConsultaDiseno.jsp");
//            }else{
//                JOptionPane.showMessageDialog(null, "Error al actualizar diseno");
//                response.sendRedirect("ConsultaDiseno.jsp");
//            }
//        }
//    }
    /*ELIMINA UN DISEÑO*/
    protected void EliminaDiseno(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        PrintWriter out = response.getWriter();
            String IDDiseno, nombre;
            IDDiseno = request.getParameter("cod");
            nombre = request.getParameter("numdetalle");
            String Url = "C:\\Users\\VICTORH\\Documents\\NetBeansProjects\\EntreSuenos\\web\\img\\" + nombre;
//            String Url3 = "C:\\xampp\\htdocs\\EntreSuenos\\img\\" + nombre;
            //JOptionPane.showMessageDialog(null, IDDiseno);
            Disenogetset cli = new Disenogetset(IDDiseno);
            GestionDiseno us = new GestionDiseno();
            if(us.EliminarDiseno(cli)){
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
