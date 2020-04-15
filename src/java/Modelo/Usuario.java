package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Usuario {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consultar todos los Usuarios
    public ArrayList<Usuariogetset> ConsultarUsu(){
        ArrayList<Usuariogetset> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("SELECT * FROM E_USUARIO");
                rs = ps.executeQuery();
                while(rs.next()){
                    Usuariogetset us = new Usuariogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4));
                    lista.add(us);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsultarUsu");
            }
        return lista;
    }
    //Consultar un solo usuario
    public ArrayList<Usuariogetset> ConsulUniUsuario(Usuariogetset us){
        ArrayList<Usuariogetset> lisuni = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUniUsuarios('"+us.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    Usuariogetset cl = new Usuariogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4));
                    lisuni.add(cl);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniUsuario");
            }
        return lisuni;
    }
    //incertar nuevo usuario
    public boolean IncertarUsuario(Usuariogetset us){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_InsertaNuevoUsuario(?,?,?,?)");
                ps.setString(1, us.getDocumento());
                ps.setString(2, us.getClave());
                ps.setString(3, us.getRoll());
                ps.setString(4, us.getEstado());
                int d = ps.executeUpdate();
                if(d>0)
                    dat = true;
                
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" IncertarUsuario");
            }
        return dat;
    }
    //actualizar usuario
    public boolean actaulizarUsuario(Usuariogetset geus){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_ActualizarUsuario("
                    + "'"+geus.getDocumento()+"', "
                    + "'"+geus.getClave()+"', "
                    + "'"+geus.getRoll()+"', "
                    + "'"+geus.getEstado()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
            //JOptionPane.showMessageDialog(null, "Si hay datos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" actaulizarUsuario");
        }
        return dat;
    }
    //eliminar usuario
    public boolean EliminarUsuario(Usuariogetset ust){
        boolean dat=false;
        try {
            ps=cnn.prepareCall("CALL pa_EliminaUsuario('"+ust.getDocumento()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + " EliminarUsuario");
        }
        return dat;
    }
}
