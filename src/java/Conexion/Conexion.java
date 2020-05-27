package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    Connection cnn;
    public Connection Conexiondb(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            cnn = DriverManager.getConnection("jdbc:mysql://localhost/Entre_Suenos","root","jardines.23");
//            JOptionPane.showMessageDialog(null, "Conexión establecida");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
        }
        return cnn;
    }
    public static void main(String[] args) {
        Conexion con = new Conexion();
        con.Conexiondb();
    }
}
