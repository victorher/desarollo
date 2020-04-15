package Modelo;

public class Pedidosgetset {
    private String CodPedido;
    private String Documento;
    private String Nombre;
    private String Apellido;
    private String Estado;
    private String FecPedido;
    private String FecEntrega;
    private String DirEntrega;
    private String Tipo;

    public Pedidosgetset() {
    }

    public Pedidosgetset(String Documento, String Estado, String FecPedido, String FecEntrega, String DirEntrega, String Tipo) {
        this.Documento = Documento;
        this.Estado = Estado;
        this.FecPedido = FecPedido;
        this.FecEntrega = FecEntrega;
        this.DirEntrega = DirEntrega;
        this.Tipo = Tipo;
    }
    
    public Pedidosgetset(String Documento, String Nombre, String Apellido, String Estado, String FecPedido, String FecEntrega, String DirEntrega, String Tipo) {
        this.Documento = Documento;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Estado = Estado;
        this.FecPedido = FecPedido;
        this.FecEntrega = FecEntrega;
        this.DirEntrega = DirEntrega;
        this.Tipo = Tipo;
    }

    public Pedidosgetset(String CodPedido, String Documento, String Estado, String FecPedido, String FecEntrega, String DirEntrega, String Tipo) {
        this.CodPedido = CodPedido;
        this.Documento = Documento;
        this.Estado = Estado;
        this.FecPedido = FecPedido;
        this.FecEntrega = FecEntrega;
        this.DirEntrega = DirEntrega;
        this.Tipo = Tipo;
    }

    public Pedidosgetset(String Documento) {
        this.Documento = Documento;
    }

    public String getCodPedido() {
        return CodPedido;
    }

    public void setCodPedido(String CodPedido) {
        this.CodPedido = CodPedido;
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

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getFecPedido() {
        return FecPedido;
    }

    public void setFecPedido(String FecPedido) {
        this.FecPedido = FecPedido;
    }

    public String getFecEntrega() {
        return FecEntrega;
    }

    public void setFecEntrega(String FecEntrega) {
        this.FecEntrega = FecEntrega;
    }

    public String getDirEntrega() {
        return DirEntrega;
    }

    public void setDirEntrega(String DirEntrega) {
        this.DirEntrega = DirEntrega;
    }

    public String getTipo() {
        return Tipo;
    }

    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }
    
    
}
