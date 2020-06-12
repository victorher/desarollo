package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionDiseno {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consultar todos los disenos
    public ArrayList<Disenogetset> ConsultarDisenos(){
        ArrayList<Disenogetset> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaDisenos()");
                rs = ps.executeQuery();
                while(rs.next()){
                    Disenogetset us = new Disenogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4), 
                            rs.getString(5), 
                            rs.getString(6), 
                            rs.getString(7), 
                            rs.getString(8));
                    lista.add(us);
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e+" ConsultarDisenos Gestion disenos");
            }
        return lista;
    }
    //Consultar un solo diseño
    public ArrayList<Disenogetset> ConsulUniDiseno(Disenogetset us){
        ArrayList<Disenogetset> lisuni = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaDisenosUni('"+us.getIDDiseno()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    Disenogetset cl = new Disenogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4), 
                            rs.getString(5), 
                            rs.getString(6), 
                            rs.getString(7), 
                            rs.getString(8));
                    lisuni.add(cl);
                }
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniDiseno Gestion Diseno");
            }
        return lisuni;
    }
    //incertar nuevos disenos
    public boolean IncertarDiseno(Disenogetset us){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_CrearNuevoDiseno(?,?,?,?,?,?,?)");
                ps.setString(1, us.getNumDetalle());
                ps.setString(2, us.getTexDiseno());
                ps.setString(3, us.getTamDiseno());
                ps.setString(4, us.getColDiseno());
                ps.setString(5, us.getPreDiseno());
                ps.setString(6, us.getObserDiseno());
                ps.setString(7, us.getImagen());
                int d = ps.executeUpdate();
                if(d>0)
                    dat = true;
                
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e+" IncertarDiseno");
            }
        return dat;
    }
    //actualizar disenos
    public boolean ActaulizarDiseno(Disenogetset geus){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_ActualizaDiseno("
                    + "'"+geus.getIDDiseno()+"', "
                    + "'"+geus.getNumDetalle()+"', "
                    + "'"+geus.getTexDiseno()+"', "
                    + "'"+geus.getTamDiseno()+"', "
                    + "'"+geus.getColDiseno()+"', "
                    + "'"+geus.getPreDiseno()+"', "
                    + "'"+geus.getObserDiseno()+"', "
                    + "'"+geus.getImagen()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
            //JOptionPane.showMessageDialog(null, "Si hay datos");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e+" ActaulizarDiseno");
        }
        return dat;
    }
    //eliminar diseno
    public boolean EliminarDiseno(Disenogetset ust){
        boolean dat=false;
        try {
            ps=cnn.prepareCall("CALL pa_EliminaDiseno('"+ust.getIDDiseno()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " EliminarDiseno");
        }
        return dat;
    }
}
