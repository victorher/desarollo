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
public class AddCarrito {
    
    private String Documento;
    private String IdDiseno;
    private String IdArticulo;
    private int Cantidad;
    private String Direccion;
    private String Precio;
    private String estado;
    private int item;

    public AddCarrito() {
    }

    public AddCarrito(int item) {
        this.item = item;
    }
    

    public AddCarrito(String Documento, String IdDiseno, String IdArticulo, int Cantidad, String Direccion, String Precio, String estado) {
        this.Documento = Documento;
        this.IdDiseno = IdDiseno;
        this.IdArticulo = IdArticulo;
        this.Cantidad = Cantidad;
        this.Direccion = Direccion;
        this.Precio = Precio;
        this.estado = estado;
    }
    

    public AddCarrito(String Documento, String IdDiseno, String IdArticulo, int Cantidad, String Direccion, String Precio, String estado, int item) {
        this.Documento = Documento;
        this.IdDiseno = IdDiseno;
        this.IdArticulo = IdArticulo;
        this.Cantidad = Cantidad;
        this.Direccion = Direccion;
        this.Precio = Precio;
        this.estado = estado;
        this.item = item;
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getIdDiseno() {
        return IdDiseno;
    }

    public void setIdDiseno(String IdDiseno) {
        this.IdDiseno = IdDiseno;
    }

    public String getIdArticulo() {
        return IdArticulo;
    }

    public void setIdArticulo(String IdArticulo) {
        this.IdArticulo = IdArticulo;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getPrecio() {
        return Precio;
    }

    public void setPrecio(String Precio) {
        this.Precio = Precio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }
    
    

  

    
    


    
    
}
