package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        return dat;
    }
}
