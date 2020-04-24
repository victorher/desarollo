package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionCliente {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consulta todos los usuarios clientes
    public ArrayList<ConUsuCliente> ConsultaCliente(){
        ArrayList<ConUsuCliente> listas = new ArrayList<>();
        try {
            ps=cnn.prepareStatement("CALL pa_ConsultaUsuarioClientes()");
            rs=ps.executeQuery();
            //JOptionPane.showMessageDialog(null, "Datos Consultados");
           
            while(rs.next()){
                ConUsuCliente consCli = new ConUsuCliente(
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
           
                listas.add(consCli);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,e);
        }
        return listas;
    }
    
    //Consultar un solo usuario cliente
    public ArrayList<ConUsuCliente> ConsulClienteUni(ConUsuCliente cl){
        ArrayList<ConUsuCliente> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUsuarioClientesDoc('"+cl.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    ConUsuCliente de = new ConUsuCliente(
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
                    lista.add(de);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e + " ConsulUniCliente de la clase GestionCliente");
            }
        return lista;
    }
    
    //Consultar un solo usuario cliente
    public ArrayList<ConUsuCliente> ConsulEmpleadoUni(ConUsuCliente cl){
        ArrayList<ConUsuCliente> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUsuarioEmpleadoDoc('"+cl.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    ConUsuCliente de = new ConUsuCliente(
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
                    lista.add(de);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e + " ConsulUniCliente de la clase GestionCliente");
            }
        return lista;
    }
    
    //Filtra clientes
    public ArrayList<ConUsuCliente> FiltraCliente(ConUsuCliente cl){
        ArrayList<ConUsuCliente> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_FiltraUsuarioCliente('"+cl.getFiltro()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    ConUsuCliente de = new ConUsuCliente(
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
                    lista.add(de);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e + " FiltraCliente de la clase GestionCliente");
            }
        return lista;
    }
    
    //Consultar un solo usuario cliente
    public ArrayList<Clientegetset> ConsulUniCliente(Clientegetset cl){
        ArrayList<Clientegetset> liscli = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsultaUniCliente('"+cl.getDocumento()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    Clientegetset de = new Clientegetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3), 
                            rs.getString(4),
                            rs.getString(5),
                            rs.getString(6));
                    liscli.add(de);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniCliente");
            }
        return liscli;
    }
    //Incertar nuevos clientes 
    public boolean IncertarCliente(Clientegetset cl){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_InsertaNuevoCliente(?,?,?,?,?,?,?)");
                ps.setString(1, cl.getDocumento());
                ps.setString(2, cl.getNombre());
                ps.setString(3, cl.getApellido());
                ps.setString(4, cl.getTelefono());
                ps.setString(5, cl.getGenero());
                ps.setString(6, cl.getDireecion());
                ps.setString(7, cl.getCorreo());
                int d = ps.executeUpdate();
                if(d > 0){
                    dat = true;
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e);
            }
        return dat;
    }
    //actualizar cliente
    public boolean actaulizarCliente(Clientegetset cl){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_ActualizaCliente("
                    + "'"+cl.getDocumento()+"',"
                    + "'"+cl.getNombre()+"', "
                    + "'"+cl.getApellido()+"', "
                    + "'"+cl.getTelefono()+"', "
                    + "'"+cl.getGenero()+"', "
                    + "'"+cl.getDireecion()+"', "
                    + "'"+cl.getCorreo()+"')");
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
}
