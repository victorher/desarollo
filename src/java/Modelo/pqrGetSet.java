package Modelo;

public class pqrGetSet {
    private String id;
    private String Nombre;
    private String Correo;
    private String Mensaje;
    private String FechaRegistro;
    private String FechaRespuesta;
    private String Estado;
    private String Respuesta;

    public pqrGetSet(String Nombre, String Correo, String Mensaje) {
        this.Nombre = Nombre;
        this.Correo = Correo;
        this.Mensaje = Mensaje;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getMensaje() {
        return Mensaje;
    }

    public void setMensaje(String Mensaje) {
        this.Mensaje = Mensaje;
    }

    public String getFechaRegistro() {
        return FechaRegistro;
    }

    public void setFechaRegistro(String FechaRegistro) {
        this.FechaRegistro = FechaRegistro;
    }

    public String getFechaRespuesta() {
        return FechaRespuesta;
    }

    public void setFechaRespuesta(String FechaRespuesta) {
        this.FechaRespuesta = FechaRespuesta;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getRespuesta() {
        return Respuesta;
    }

    public void setRespuesta(String Respuesta) {
        this.Respuesta = Respuesta;
    }
}
