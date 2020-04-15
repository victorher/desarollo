package Modelo;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class GestionArtCategoria {
    Conexion con = new Conexion();
    Connection cnn = con.Conexiondb();
    ResultSet rs = null;
    PreparedStatement ps = null;
    //Consultar todas las categorias de articulos
    public ArrayList<CatArticulogetset> ConsultarCatArticulo(){
        ArrayList<CatArticulogetset> lista = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL paConsultaCategoriaArticulo");
                rs = ps.executeQuery();
                while(rs.next()){
                    CatArticulogetset us = new CatArticulogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3));
                    lista.add(us);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsultarCatArticulo GestionArtCategoria");
            }
        return lista;
    }
    //Consultar un solo una categoria
    public ArrayList<CatArticulogetset> ConsulUniCatArticulo(CatArticulogetset us){
        ArrayList<CatArticulogetset> lisuni = new ArrayList<>();
            try {
                ps = cnn.prepareStatement("CALL pa_ConsulUniCatArticulo('"+us.getID()+"')");
                rs = ps.executeQuery();
                while(rs.next()){
                    CatArticulogetset cl = new CatArticulogetset(
                            rs.getString(1), 
                            rs.getString(2), 
                            rs.getString(3));
                    lisuni.add(cl);
                }
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" ConsulUniCatArticulo GestionArtCategoria");
            }
        return lisuni;
    }
    //incertar nuevas categorias
    public boolean IncertarCatArticulo(CatArticulogetset us){
        boolean dat = false;
            try {
                ps = cnn.prepareStatement("CALL pa_CreaNuevaCatArticulo(?,?)");
                ps.setString(1, us.getNom());
                ps.setString(2, us.getCat());
                int d = ps.executeUpdate();
                if(d>0)
                    dat = true;
                
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, e+" IncertarCatArticulo GestionArtCategoria");
            }
        return dat;
    }
    //actualizar categorias
    public boolean ActaulizarCatArticulo(CatArticulogetset geus){
        boolean dat = false;
        try {
            ps = cnn.prepareStatement("CALL pa_ActualizaCatArticulo('"+geus.getID()+"', '"+geus.getNom()+"', '"+geus.getCat()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
            //JOptionPane.showMessageDialog(null, "Si hay datos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e+" ActaulizarCatArticulo GestionArtCategoria");
        }
        return dat;
    }
    //eliminar categorias
    public boolean EliminarCatArticulo(CatArticulogetset ust){
        boolean dat=false;
        try {
            ps=cnn.prepareCall("CALL pa_EliminaCatArticulo('"+ust.getID()+"')");
            int d = ps.executeUpdate();
            if(d > 0){
                dat = true;
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e + " EliminarCatArticulo GestionArtCategoria");
        }
        return dat;
    }
}
