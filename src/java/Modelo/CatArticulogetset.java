package Modelo;
public class CatArticulogetset {
    private String ID;
    private String Nom;
    private String Cat;

    public CatArticulogetset() {
    }

    public CatArticulogetset(String ID) {
        this.ID = ID;
    }
    
    public CatArticulogetset(String Nom, String Cat) {
        this.Nom = Nom;
        this.Cat = Cat;
    }

    public CatArticulogetset(String ID, String Nom, String Cat) {
        this.ID = ID;
        this.Nom = Nom;
        this.Cat = Cat;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String Nom) {
        this.Nom = Nom;
    }

    public String getCat() {
        return Cat;
    }

    public void setCat(String Cat) {
        this.Cat = Cat;
    }
    
}
