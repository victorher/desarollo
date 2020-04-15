package Modelo;

public class Usuariosgetset {
    private String Documeto;
    private String Contraseña;
    private String Roll;
    private String Estado;

    public Usuariosgetset(String Documeto, String Contraseña, String Roll, String Estado) {
        this.Documeto = Documeto;
        this.Contraseña = Contraseña;
        this.Roll = Roll;
        this.Estado = Estado;
    }

    public Usuariosgetset(String Contraseña, String Roll, String Estado) {
        this.Contraseña = Contraseña;
        this.Roll = Roll;
        this.Estado = Estado;
    }

    public Usuariosgetset(String Documeto) {
        this.Documeto = Documeto;
    }

    public String getDocumeto() {
        return Documeto;
    }

    public void setDocumeto(String Documeto) {
        this.Documeto = Documeto;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
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
