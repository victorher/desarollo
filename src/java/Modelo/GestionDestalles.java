
package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class GestionDestalles {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<detallesGetSet> ConDetalles(){
        ArrayList<detallesGetSet> lista = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("SELECT * FROM E_DETALLE");
            rs = ps.executeQuery();
            while(rs.next()){
                detallesGetSet conta = new detallesGetSet(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6));
                lista.add(conta);
            }
        } catch (SQLException e) {
        }
        return lista;
    }
    
    public ArrayList<detallesGetSet> ConDetalleUni(detallesGetSet em){
        ArrayList<detallesGetSet> lista = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("SELECT * FROM E_DETALLE WHERE Det_DetalleID = '"+em.getIdDetalle()+"'");
            rs = ps.executeQuery();
            while(rs.next()){
                detallesGetSet unic = new detallesGetSet(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6));
                lista.add(unic);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " ConDetalleUni");
        }
        return lista;
    }
    
    public boolean IncertarDetalles(detallesGetSet de){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_IncertaNuevosDetalles(?,?,?,?,?)");
            ps.setString(1, de.getIdArticulo());
            ps.setString(2, de.getIdDIseno());
            ps.setString(3, de.getDescripcion());
            ps.setString(4, de.getCantidad());
            ps.setString(5, de.getPrecio());
//            JOptionPane.showMessageDialog(null, 
//                    de.getIdArticulo()+" - "+
//                    de.getIdDIseno()+" - "+
//                    de.getDescripcion()+" - "+
//                    de.getCantidad()+" - "+
//                    de.getPrecio());
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " IncertarDetalles");
        }
        return dat;
    }
    
    public boolean ActualizarDetalle(detallesGetSet de){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_ActualizaDetalles("
                    + "'"+de.getIdDetalle()+"',"
                    + "'"+de.getIdArticulo()+"',"
                    + "'"+de.getIdDIseno()+"',"
                    + "'"+de.getDescripcion()+"',"
                    + "'"+de.getCantidad()+"',"
                    + "'"+de.getPrecio()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " ActualizarDetalle");
        }
        return dat;
    }
    
    public boolean EliminarDetalle(detallesGetSet em){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_EliminaDetalle('"+em.getIdDIseno()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " EliminarDetalle");
        }
        return dat;
    }
}
