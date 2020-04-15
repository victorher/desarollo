package Modelo;

public class Usuariogetset {
    private String Documento;
    private String Clave;
    private String Roll;
    private String Estado;

    public Usuariogetset(String Documento, String Clave) {
        this.Documento = Documento;
        this.Clave = Clave;
    }

    public Usuariogetset(String Documento) {
        this.Documento = Documento;
    }

    public Usuariogetset(String Documento, String Clave, String Roll, String Estado) {
        this.Documento = Documento;
        this.Clave = Clave;
        this.Roll = Roll;
        this.Estado = Estado;
    }

    public Usuariogetset() {
    }

    public String getDocumento() {
        return Documento;
    }

    public void setDocumento(String Documento) {
        this.Documento = Documento;
    }

    public String getClave() {
        return Clave;
    }

    public void setClave(String Clave) {
        this.Clave = Clave;
    }

    public String getRoll() {
        return Roll;
    }

    public void setRoll(String Roll) {
        this.Roll = Roll;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
}
