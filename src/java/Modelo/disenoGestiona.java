package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class disenoGestiona {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<disenoEtiqueta_gs> MuestraImagen(){
        ArrayList<disenoEtiqueta_gs> lista = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("SELECT Dis_IDDiseno, Dis_Titulo, Dis_ImagenDiseno, Dis_PrecioDiseno FROM E_DISENO;");
            rs = ps.executeQuery();
            while(rs.next()){
                disenoEtiqueta_gs mues = new disenoEtiqueta_gs(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                lista.add(mues);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + "disenoGestiona - MuestraImagen");
        }
        return lista;
    }
}
