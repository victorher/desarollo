package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionEmpleados {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consulta todos los usuarios empleados
    public ArrayList<ConUsuEmpleado> ConsultaEmpleado(){
        ArrayList<ConUsuEmpleado> lista = new ArrayList<>();
        try {
            ps=cnn.prepareStatement("CALL pa_ConsultaUsuarioEmpleado()");
            rs=ps.executeQuery();
            //JOptionPane.showMessageDialog(null, "Datos Consultados");
           
            while(rs.next()){
                ConUsuEmpleado consemp = new ConUsuEmpleado(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getString(9), 
                        rs.getString(10));
                lista.add(consemp);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return lista;
    }
    
    //Consulta todos los usuarios empleados
    public ArrayList<ConUsuEmpleado> ConsultaEmpleadoUni(ConUsuEmpleado em){
        ArrayList<ConUsuEmpleado> lista = new ArrayList<>();
        try {
            ps=cnn.prepareStatement("CALL pa_ConsultaUsuarioEmpleadoDoc('"+em.getDocumento()+"')");
            rs=ps.executeQuery();
            //JOptionPane.showMessageDialog(null, "Datos Consultados");
           
            while(rs.next()){
                ConUsuEmpleado consemp = new ConUsuEmpleado(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8), 
                        rs.getString(9), 
                        rs.getString(10));
                lista.add(consemp);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e + " GestionEmpleados - ConsultaEmpleadoUni");
        }
        return lista;
    }
    
    //Consultar un solo usuario empleado
    public ArrayList<Empleadogetset> ConsulUniEmpleado(Empleadogetset em){
        ArrayList<Empleadogetset> lisuni = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUniEmpleado('"+em.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    Empleadogetset cl = new Empleadogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6));
                    lisuni.add(cl);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniEmpleado");
            }
        return lisuni;
    }
    // consultar administrador
    public ArrayList<AdministradorGetSet> ConsultarAdministrador(AdministradorGetSet em){
        ArrayList<AdministradorGetSet> consultar = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUsuarioAdministradorDoc('"+em.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    AdministradorGetSet cl = new AdministradorGetSet(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getString(9),
                            rs.getString(10));
                    consultar.add(cl);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsultarAdministrador");
            }
        return consultar;
    }
    //Incertar nuevos empleados 
    public boolean IncertarEmpleado(Empleadogetset em){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_InsertaNuevoEmpleado(?,?,?,?,?,?,?)");
                ps.setString(1, em.getDocumento());
                ps.setString(2, em.getNombre());
                ps.setString(3, em.getApellido());
                ps.setString(4, em.getTelefono());
                ps.setString(5, em.getGenero());
                ps.setString(6, em.getDireecion());
                ps.setString(7, em.getCorreo());
                int d = ps.executeUpdate();
                if(d>0){
                    dat = true;
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        return dat;
    }
    //actualizar empleado
    public boolean actaulizarEmpleado(Empleadogetset em){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_ActualizaEmpleado("
                    + "'"+em.getDocumento()+"',"
                    + "'"+em.getNombre()+"', "
                    + "'"+em.getApellido()+"', "
                    + "'"+em.getTelefono()+"', "
                    + "'"+em.getGenero()+"', "
                    + "'"+em.getDireecion()+"', "
                    + "'"+em.getCorreo()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return dat;
    }
}
