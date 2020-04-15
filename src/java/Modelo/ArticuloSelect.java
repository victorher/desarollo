
package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ArticuloSelect {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public ArrayList<Articulo_gs> listaArticulo(){
        ArrayList<Articulo_gs> lista = new ArrayList<>();
        try {
            ps = cnn.prepareStatement("SELECT Art_ArticuloID, Art_NombreArt FROM E_ARTICULO;");
            rs = ps.executeQuery();
            while(rs.next()){
                Articulo_gs cuen = new Articulo_gs(rs.getString(1), rs.getString(2));
                lista.add(cuen);
            }
        } catch (Exception e) {
        }
        return lista;
    } 
}
