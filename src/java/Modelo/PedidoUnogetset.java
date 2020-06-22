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
    private String Fechaped;
    private String FechaEnt;
    private String Estado;
    private String Direccion;
    private String Descripcion;
    private String Titulo;
    private int Precio;
    private String Imagen;

    public PedidoUnogetset() {
    }

    public PedidoUnogetset(String Documento) {
        this.Documento = Documento;
    }

    public PedidoUnogetset(String Documento, String Fechaped, String FechaEnt, String Estado, String Direccion, String Titulo, int Precio, String Imagen) {
        this.Documento = Documento;
        this.Fechaped = Fechaped;
        this.FechaEnt = FechaEnt;
        this.Estado = Estado;
        this.Direccion = Direccion;
        this.Titulo = Titulo;
        this.Precio = Precio;
        this.Imagen = Imagen;
    }

    public PedidoUnogetset(String Documento, String Fechaped, String FechaEnt, String Estado, String Direccion, String Descripcion, String Titulo, int Precio, String Imagen) {
        this.Documento = Documento;
        this.Fechaped = Fechaped;
        this.FechaEnt = FechaEnt;
        this.Estado = Estado;
        this.Direccion = Direccion;
        this.Descripcion = Descripcion;
        this.Titulo = Titulo;
        this.Precio = Precio;
        this.Imagen = Imagen;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
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

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getTitulo() {
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public int getPrecio() {
        return Precio;
    }

    public void setPrecio(int Precio) {
        this.Precio = Precio;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
    
            
}
