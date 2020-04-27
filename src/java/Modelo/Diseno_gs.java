
package Modelo;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Diseno_gs {
    private String Cod;
    private String Nombre;

    public Diseno_gs() {
    }

    public Diseno_gs(String Cod, String Nombre) {
        this.Cod = Cod;
        this.Nombre = Nombre;
    }

    public String getCod() {
        return Cod;
    }

    public void setCod(String Cod) {
        this.Cod = Cod;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
}
