package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionPedidos {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consulta todos los pedidos
    public ArrayList<Pedidosgetset> ConsultaPedidos(){
        ArrayList<Pedidosgetset> listas = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("CALL pa_ConsultaPedidos()");
            rs = ps.executeQuery();
            //JOptionPane.showMessageDialog(null, "Datos Consultados");
           
            while(rs.next()){
                Pedidosgetset consPed = new Pedidosgetset(
                        rs.getString(1), 
                        rs.getString(2), 
                        rs.getString(3), 
                        rs.getString(4), 
                        rs.getString(5), 
                        rs.getString(6), 
                        rs.getString(7), 
                        rs.getString(8));
           
                listas.add(consPed);
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " ConsultaPedidos");
        }
        return listas;
    }
    //Incertar nuevo pedido
    public boolean IncertarPedido(Pedidosgetset us){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_CreaNuevoPedido(?,?,?,?)");
                ps.setString(1, us.getDocumento());
                ps.setString(2, us.getEstado());
//                ps.setString(3, us.getFecPedido());
//                ps.setString(4, us.getFecEntrega());
                ps.setString(3, us.getDirEntrega());
                ps.setString(4, us.getTipo());
//                JOptionPane.showMessageDialog(null, 
//                    us.getDocumento()+" - "+
//                    us.getEstado()+" - "+
//                    us.getDirEntrega()+" - "+
//                    us.getTipo());
                int d = ps.executeUpdate();
                if(d > 0)
                    dat = true;
                
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, e + " IncertarPedido");
            }
        return dat;
    }
    //Actualizar pedidos
    public boolean ActaulizarPedidos(Pedidosgetset geus){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_ActualizaDatosDelPedido("
                    + "'"+geus.getCodPedido()+"', "
                    + "'"+geus.getDocumento()+"', "
                    + "'"+geus.getEstado()+"', "
                    + "'"+geus.getFecPedido()+"', "
                    + "'"+geus.getDirEntrega()+"', "
                    + "'"+geus.getDirEntrega()+"', "
                    + "'"+geus.getTipo()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
            //JOptionPane.showMessageDialog(null, "Si hay datos");
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " ActaulizarPedidos");
        }
        return dat;
    }
    //Eliminar pedidos
    public boolean EliminarPedidos(Pedidosgetset ust){
        boolean dat = false;
        try {
            ps = cnn.prepareCall("CALL pa_EliminaPedidoDelSistema('"+ust.getCodPedido()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e + " EliminarPedidos");
        }
        return dat;
    }
}
