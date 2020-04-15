package Modelo;

public class Empleadogetset {
    private String Documento;
    private String Nombre;
    private String Apellido;
    private String Telefono;
    private String Genero;
    private String Direecion;
    private String Correo;

    public Empleadogetset(String Documento) {
        this.Documento = Documento;
    }

    public Empleadogetset() {
    }

    public Empleadogetset(String Documento, String Nombre, String Apellido, String Telefono, String Genero, String Direecion, String Correo) {
        this.Documento = Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Telefono = Telefono;
        this.Genero = Genero;
        this.Direecion = Direecion;
        this.Correo = Correo;
    }

    public Empleadogetset(String Nombre, String Apellido, String Telefono, String Genero, String Direecion, String Correo) {
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Telefono = Telefono;
        this.Genero = Genero;
        this.Direecion = Direecion;
        this.Correo = Correo;
    }
    
    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
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

    public String getDireecion() {
        return Direecion;
    }

    public void setDireecion(String Direecion) {
        this.Direecion = Direecion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }
    
}
