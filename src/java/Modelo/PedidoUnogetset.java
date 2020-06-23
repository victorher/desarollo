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
    private String PedidoID;
    private String Imagen;
    private String Titulo;
    private String Fechaped;
    private String FechaEnt;
    private String Direccion;
    private String Nombre;
    private String Apellido;
    private String Estado;
    private String Documento;
    private String Precio;
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

    public PedidoUnogetset(String PedidoID, String Imagen, String Titulo, String Fechaped, String FechaEnt, String Direccion, String Nombre, String Apellido, String Documento, String Precio) {
        this.PedidoID = PedidoID;
        this.Imagen = Imagen;
        this.Titulo = Titulo;
        this.Fechaped = Fechaped;
        this.FechaEnt = FechaEnt;
        this.Direccion = Direccion;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Documento = Documento;
        this.Precio = Precio;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public PedidoUnogetset() {
    }

    
    public PedidoUnogetset(String Estado, String PedidoID) {
        this.Estado = Estado;
        this.PedidoID = PedidoID;
    }

    public String getPedidoID() {
        return PedidoID;
    }

    public void setPedidoID(String PedidoID) {
        this.PedidoID = PedidoID;
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
