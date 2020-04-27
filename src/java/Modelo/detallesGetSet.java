
package Modelo;


public class detallesGetSet {
    private String idDetalle;
    private String idArticulo;
    private String idDIseno;
    private String Descripcion;
    private String Cantidad;
    private String Precio;

    public detallesGetSet() {
    }

    public detallesGetSet(String idDetalle) {
        this.idDetalle = idDetalle;
    }

    public detallesGetSet(String idDetalle, String idArticulo, String idDIseno, String Descripcion, String Cantidad, String Precio) {
        this.idDetalle = idDetalle;
        this.idArticulo = idArticulo;
        this.idDIseno = idDIseno;
        this.Descripcion = Descripcion;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
    }

    public detallesGetSet(String idArticulo, String idDIseno, String Descripcion, String Cantidad, String Precio) {
        this.idArticulo = idArticulo;
        this.idDIseno = idDIseno;
        this.Descripcion = Descripcion;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
    }

    public String getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(String idDetalle) {
        this.idDetalle = idDetalle;
    }

    public String getIdArticulo() {
        return idArticulo;
    }

    public void setIdArticulo(String idArticulo) {
        this.idArticulo = idArticulo;
    }

    public String getIdDIseno() {
        return idDIseno;
    }

    public void setIdDIseno(String idDIseno) {
        this.idDIseno = idDIseno;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }
    
}
