
package Modelo;

public class disenoEtiqueta_gs {
    private String idDis;
    private String imagen;
    private String precio;

    public disenoEtiqueta_gs(String idDis, String imagen, String precio) {
        this.idDis = idDis;
        this.imagen = imagen;
        this.precio = precio;
    }

    public disenoEtiqueta_gs(String idDis, String imagen) {
        this.idDis = idDis;
        this.imagen = imagen;
    }

    public disenoEtiqueta_gs() {
    }

    public String getIdDis() {
        return idDis;
    }

    public void setIdDis(String idDis) {
        this.idDis = idDis;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }
    
}
