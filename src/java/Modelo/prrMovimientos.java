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
 * @author VICTORH
 */
public class prrMovimientos {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    //Incertar nuevos empleados 
    public boolean IncertarPQR(pqrGetSet p){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pqrIncertaDatos(?,?,?)");
                ps.setString(1, p.getNombre());
                ps.setString(2, p.getCorreo());
                ps.setString(3, p.getMensaje());
                int d = ps.executeUpdate();
                if(d>0){
                    dat = true;
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e);
            }
        return dat;
    }
    
    //Consulta todos las pqrs que estan sin responder
    public ArrayList<PQRconsultaGetSet> ConsultaPQR(){
        ArrayList<PQRconsultaGetSet> lista = new ArrayList<>();
        try {
            ps=cnn.prepareStatement("SELECT p_ID, p_FechaRegistro, p_Mensaje FROM E_pqr WHERE p_Respuesta IS NULL");
            rs=ps.executeQuery();
           
            while(rs.next()){
                PQRconsultaGetSet pqr = new PQRconsultaGetSet(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3));
                lista.add(pqr);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return lista;
    }
    
    //Consulta una pqr para cargarla en los input
    public ArrayList<PQRconsultaGetSet> ConsultaPQRUni(PQRconsultaGetSet p){
        ArrayList<PQRconsultaGetSet> lista = new ArrayList<>();
        try {
            ps=cnn.prepareStatement("CALL ConsultaUnicaPQR('"+p.getId()+"')");
            rs=ps.executeQuery();
            //JOptionPane.showMessageDialog(null, "Datos Consultados");
           
            while(rs.next()){
                PQRconsultaGetSet pqr = new PQRconsultaGetSet(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3));
                lista.add(pqr);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null,e + " pqrMovimientos");
        }
        return lista;
    }
    
    //Actualizar el estado de la PQR
    public boolean actaulizarPQR(PQRconsultaGetSet p){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_ActualizaEmpleado("
                    + "'"+p.getId()+"',"
                    + "'"+p.getMensaje()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return dat;
    }
}
