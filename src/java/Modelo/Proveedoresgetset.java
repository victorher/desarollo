package Modelo;
public class Proveedoresgetset {
    private String ProveedorID;
    private String NombrePro;
    private String ApellidoPro;
    private String DireccionPro;
    private String TelefonoPro;
    private String CorreoPro;
    private String CategoriaPro;
    private String EstadoPro;

    public Proveedoresgetset() {
    }

    public Proveedoresgetset(String ProveedorID) {
        this.ProveedorID = ProveedorID;
    }

    public Proveedoresgetset(String ProveedorID, String NombrePro, String ApellidoPro, String DireccionPro, String TelefonoPro, String CorreoPro, String CategoriaPro, String EstadoPro) {
        this.ProveedorID = ProveedorID;
        this.NombrePro = NombrePro;
        this.ApellidoPro = ApellidoPro;
        this.DireccionPro = DireccionPro;
        this.TelefonoPro = TelefonoPro;
        this.CorreoPro = CorreoPro;
        this.CategoriaPro = CategoriaPro;
        this.EstadoPro = EstadoPro;
    }

    public Proveedoresgetset(String NombrePro, String ApellidoPro, String DireccionPro, String TelefonoPro, String CorreoPro, String CategoriaPro, String EstadoPro) {
        this.NombrePro = NombrePro;
        this.ApellidoPro = ApellidoPro;
        this.DireccionPro = DireccionPro;
        this.TelefonoPro = TelefonoPro;
        this.CorreoPro = CorreoPro;
        this.CategoriaPro = CategoriaPro;
        this.EstadoPro = EstadoPro;
    }

    public String getProveedorID() {
        return ProveedorID;
    }

    public void setProveedorID(String ProveedorID) {
        this.ProveedorID = ProveedorID;
    }

    public String getNombrePro() {
        return NombrePro;
    }

    public void setNombrePro(String NombrePro) {
        this.NombrePro = NombrePro;
    }

    public String getApellidoPro() {
        return ApellidoPro;
    }

    public void setApellidoPro(String ApellidoPro) {
        this.ApellidoPro = ApellidoPro;
    }

    public String getDireccionPro() {
        return DireccionPro;
    }

    public void setDireccionPro(String DireccionPro) {
        this.DireccionPro = DireccionPro;
    }

    public String getTelefonoPro() {
        return TelefonoPro;
    }

    public void setTelefonoPro(String TelefonoPro) {
        this.TelefonoPro = TelefonoPro;
    }

    public String getCorreoPro() {
        return CorreoPro;
    }

    public void setCorreoPro(String CorreoPro) {
        this.CorreoPro = CorreoPro;
    }

    public String getCategoriaPro() {
        return CategoriaPro;
    }

    public void setCategoriaPro(String CategoriaPro) {
        this.CategoriaPro = CategoriaPro;
    }

    public String getEstadoPro() {
        return EstadoPro;
    }

    public void setEstadoPro(String EstadoPro) {
        this.EstadoPro = EstadoPro;
    }
    
}
