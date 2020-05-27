package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class Logueo {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    public  ArrayList<Usuariogetset> login(Usuariogetset gs){
        ArrayList<Usuariogetset> listalogin = new ArrayList<>();
        try {
//            JOptionPane.showMessageDialog(null, gs.getDocumento()+" "+gs.getClave());
            ps = cnn.prepareStatement("CALL PA_LOGIN('"+gs.getDocumento()+"','"+gs.getClave()+"')");
            rs = ps.executeQuery();
            while(rs.next()){
                Usuariogetset us = new Usuariogetset(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                listalogin.add(us);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e+" Logueo.java");
        }
        return listalogin;
    }
    public ArrayList<GeneroEmpGS> GenEmp(GeneroEmpGS Ge){
        ArrayList<GeneroEmpGS> lisgen = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("CALL pa_ConsultaGeneroEmpleado('"+Ge.getDocumento()+"')");
            rs = ps.executeQuery();
            while(rs.next()){
                GeneroEmpGS tabla = new GeneroEmpGS(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                lisgen.add(tabla);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e+" GenEmp.java");
        }
        return lisgen;
    }
    
    public ArrayList<GeneroEmpGS> GenCli(GeneroEmpGS cl){
        ArrayList<GeneroEmpGS> lisgen = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("CALL pa_ConsultaGeneroCliente('"+cl.getDocumento()+"')");
            rs = ps.executeQuery();
            while(rs.next()){
                GeneroEmpGS tabla = new GeneroEmpGS(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                lisgen.add(tabla);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e+" GenCli.java");
        }
        return lisgen;
    }
}
