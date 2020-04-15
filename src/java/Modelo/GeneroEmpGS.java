package Modelo;

public class GeneroEmpGS {
    private String Documento;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private String Direccion;

    public GeneroEmpGS(String Documento) {
        this.Documento = Documento;
    }

    public GeneroEmpGS(String Nombre, String Apellido, String Genero, String Direccion) {
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Direccion = Direccion;
    }    

    public GeneroEmpGS() {
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

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }
    
}
