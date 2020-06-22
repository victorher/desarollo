package Modelo;

public class Disenogetset {
    private String IDDiseno;
    private String NumDetalle;
    private String TexDiseno;
    private String TamDiseno;
    private String ColDiseno;
    private int PreDiseno;
    private String ObserDiseno;
    private String Imagen;

    public Disenogetset(String NumDetalle, String TexDiseno, String TamDiseno, String ColDiseno, int PreDiseno, String ObserDiseno, String Imagen) {
        this.NumDetalle = NumDetalle;
        this.TexDiseno = TexDiseno;
        this.TamDiseno = TamDiseno;
        this.ColDiseno = ColDiseno;
        this.PreDiseno = PreDiseno;
        this.ObserDiseno = ObserDiseno;
        this.Imagen = Imagen;
    }

    public Disenogetset(String IDDiseno) {
        this.IDDiseno = IDDiseno;
    }

    public Disenogetset() {
    }

    public Disenogetset(String IDDiseno, String NumDetalle, String TexDiseno, String TamDiseno, String ColDiseno, int PreDiseno, String ObserDiseno, String Imagen) {
        this.IDDiseno = IDDiseno;
        this.NumDetalle = NumDetalle;
        this.TexDiseno = TexDiseno;
        this.TamDiseno = TamDiseno;
        this.ColDiseno = ColDiseno;
        this.PreDiseno = PreDiseno;
        this.ObserDiseno = ObserDiseno;
        this.Imagen = Imagen;
    }

    public String getIDDiseno() {
        return IDDiseno;
    }

    public void setIDDiseno(String IDDiseno) {
        this.IDDiseno = IDDiseno;
    }

    public String getNumDetalle() {
        return NumDetalle;
    }

    public void setNumDetalle(String NumDetalle) {
        this.NumDetalle = NumDetalle;
    }

    public String getTexDiseno() {
        return TexDiseno;
    }

    public void setTexDiseno(String TexDiseno) {
        this.TexDiseno = TexDiseno;
    }

    public String getTamDiseno() {
        return TamDiseno;
    }

    public void setTamDiseno(String TamDiseno) {
        this.TamDiseno = TamDiseno;
    }

    public String getColDiseno() {
        return ColDiseno;
    }

    public void setColDiseno(String ColDiseno) {
        this.ColDiseno = ColDiseno;
    }

    public int getPreDiseno() {
        return PreDiseno;
    }

    public void setPreDiseno(int PreDiseno) {
        this.PreDiseno = PreDiseno;
    }

    public String getObserDiseno() {
        return ObserDiseno;
    }

    public void setObserDiseno(String ObserDiseno) {
        this.ObserDiseno = ObserDiseno;
    }

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
}
