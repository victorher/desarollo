/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConUsuCliente;
import Modelo.GestionCliente;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
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
@WebServlet(name = "ServletPDF", urlPatterns = {"/ServletPDF"})
public class ServletPDF extends HttpServlet {

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
        if(request.getParameter("btnpdf")!=null){
            this.pdf(request, response);
        }
    }
    
    protected void pdf(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("application/pdf");
            OutputStream out = response.getOutputStream();
            ArrayList<ConUsuCliente> list = new ArrayList<>();
            ConUsuCliente cons = new ConUsuCliente();
            GestionCliente cli = new GestionCliente();
            
            list = cli.ConsultaCliente();
            
            Document documento = new Document(PageSize.LETTER.rotate());
            try {
                PdfWriter.getInstance(documento, out);
            } catch (Exception e) {
            }
            documento.open();
             Paragraph pg=new Paragraph();
            Font tutilo=new Font (Font.FontFamily.HELVETICA,16, Font.BOLD, BaseColor.BLUE);
            pg.add(new Phrase("LISTADO DE USUARIOS", tutilo));
            pg.setAlignment(Element.ALIGN_CENTER);
            pg.add(new Phrase(Chunk.NEWLINE));
            pg.add(new Phrase(Chunk.NEWLINE));
                
                PdfPTable tabla=new PdfPTable(5);
                tabla.setWidthPercentage(90);
                
                PdfPCell doc=new PdfPCell(new Paragraph("Nombre", FontFactory.getFont("Arial", 12, Font.ITALIC, BaseColor.BLACK.GREEN)));
                PdfPCell usu=new PdfPCell(new Paragraph("Apellido", FontFactory.getFont("Arial", 12, Font.ITALIC, BaseColor.GREEN)));
                PdfPCell cla=new PdfPCell(new Paragraph("Direccion", FontFactory.getFont("Arial", 12, Font.ITALIC, BaseColor.GREEN)));
                PdfPCell rol=new PdfPCell(new Paragraph("Genero", FontFactory.getFont("Arial", 12, Font.ITALIC, BaseColor.GREEN)));
                PdfPCell est=new PdfPCell(new Paragraph("Telefono", FontFactory.getFont("Arial", 12, Font.ITALIC, BaseColor.GREEN)));   
            
            documento.add(pg);
            tabla.addCell(doc);
            tabla.addCell(usu);
            tabla.addCell(cla);
            tabla.addCell(rol);
            tabla.addCell(est);
            
            for(int i=0; i<list.size(); i++){
                cons=list.get(i);
                
                tabla.addCell(cons.getNombre());
                tabla.addCell(cons.getApellido());
                tabla.addCell(cons.getDireccion());
                tabla.addCell(cons.getGenero());
                tabla.addCell(cons.getTelefono());
            }
            
            documento.add(tabla);
            documento.close();
                    
            
        } catch (Exception e) {
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
