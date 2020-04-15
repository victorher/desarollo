package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionProveedores {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consultar todos los proveedores
    public ArrayList<Proveedoresgetset> ConsultarProveedores(){
        ArrayList<Proveedoresgetset> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("SELECT * FROM E_Proveedores");
                rs = ps.executeQuery();
                while(rs.next()){
                    Proveedoresgetset us = new Proveedoresgetset(
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
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsultarProveedores GestionProveedores");
            }
        return lista;
    }
    //Consultar un solo proveedores
    public ArrayList<Proveedoresgetset> ConsulUniProveedores(Proveedoresgetset us){
        ArrayList<Proveedoresgetset> lisuni = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUnicoProveedor('"+us.getProveedorID()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    Proveedoresgetset cl = new Proveedoresgetset(
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
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniProveedores GestionProveedores");
            }
        return lisuni;
    }
    //incertar nuevos proveedores
    public boolean IncertarProveedor(Proveedoresgetset us){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_IncertaProveedor(?,?,?,?,?,?,?)");
                ps.setString(1, us.getNombrePro());
                ps.setString(2, us.getApellidoPro());
                ps.setString(3, us.getDireccionPro());
                ps.setString(4, us.getTelefonoPro());
                ps.setString(5, us.getCorreoPro());
                ps.setString(6, us.getCategoriaPro());
                ps.setString(7, us.getEstadoPro());
                int d = ps.executeUpdate();
                if(d>0)
                    dat = true;
                
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" IncertarProveedor");
            }
        return dat;
    }
    //actualizar proveedores
    public boolean ActaulizarProveedor(Proveedoresgetset geus){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_ActualizaProveedor("
                    + "'"+geus.getProveedorID()+"', "
                    + "'"+geus.getNombrePro()+"', "
                    + "'"+geus.getApellidoPro()+"', "
                    + "'"+geus.getDireccionPro()+"', "
                    + "'"+geus.getTelefonoPro()+"', "
                    + "'"+geus.getCorreoPro()+"', "
                    + "'"+geus.getCategoriaPro()+"', "
                    + "'"+geus.getEstadoPro()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
            //JOptionPane.showMessageDialog(null, "Si hay datos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" ActaulizarProveedor");
        }
        return dat;
    }
    //eliminar proveedores
    public boolean EliminarProveedor(Proveedoresgetset ust){
        boolean dat=false;
        try {
            ps=cnn.prepareCall("CALL pa_EliminaProveedor('"+ust.getProveedorID()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + " EliminarProveedor");
        }
        return dat;
    }
}
