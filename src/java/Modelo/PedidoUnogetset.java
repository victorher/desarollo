/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author amico
 */
public class PedidoUnogetset {
    private String Documento;
    private String Imagen;
    private String Titulo;
    private String Fechaped;
    private String FechaEnt;
    private String Direccion;
    private String Estado;
    private String Precio;
//    private String PedidoID;
//    private String DetalleID;
//    private String Descripcion;
//    private String DisenoID;

    public PedidoUnogetset(String Documento) {
        this.Documento = Documento;
    }

    public PedidoUnogetset(String Imagen, String Titulo, String Fechaped, String FechaEnt, String Direccion, String Estado, String Precio) {
        this.Imagen = Imagen;
        this.Titulo = Titulo;
        this.Fechaped = Fechaped;
        this.FechaEnt = FechaEnt;
        this.Direccion = Direccion;
        this.Estado = Estado;
        this.Precio = Precio;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getFechaped() {
        return Fechaped;
    }

    public void setFechaped(String Fechaped) {
        this.Fechaped = Fechaped;
    }

    public String getFechaEnt() {
        return FechaEnt;
    }

    public void setFechaEnt(String FechaEnt) {
        this.FechaEnt = FechaEnt;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }
    
}
