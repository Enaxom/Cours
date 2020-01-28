public class Adresse implements java.io.Serializable {
    private String ville;
    private String rue;
    private int    numero;
    public Adresse (String v, String r, int n) {
        ville = v; rue = r; numero = n;
    }
    public String toString () {
        return numero + " " + rue + " a " + ville;
    }
}
