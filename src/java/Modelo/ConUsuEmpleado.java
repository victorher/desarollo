package Modelo;

public class ConUsuEmpleado {
    private String Nombre;
    private String Apellido;
    private String Documento;
    private String Rol;
    private String Telefono;
    private String Genero;
    private String Direccion;
    private String Correo;
    private String Clave;
    private String Estado;

    public ConUsuEmpleado(String Nombre, String Apellido, String Documento, String Rol, String Telefono, String Genero, String Direccion, String Correo, String Clave, String Estado) {
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Documento = Documento;
        this.Rol = Rol;
        this.Telefono = Telefono;
        this.Genero = Genero;
        this.Direccion = Direccion;
        this.Correo = Correo;
        this.Clave = Clave;
        this.Estado = Estado;
    }

    public ConUsuEmpleado(String Documento) {
        this.Documento = Documento;
    }
        
    public ConUsuEmpleado() {
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

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
}
