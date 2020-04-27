package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DisenoSelect {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ArrayList<Diseno_gs> SelectDiseno(){
        ArrayList<Diseno_gs> lista = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("SELECT Dis_IDDiseno, Dis_TextoDiseno FROM E_DISENO");
            rs = ps.executeQuery();
            while(rs.next()){
                Diseno_gs son = new Diseno_gs(rs.getString(1), rs.getString(2));
                lista.add(son);
            }
        } catch (Exception e) {
        }
        return lista;
    }
}
