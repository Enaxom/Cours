import java.rmi.Naming;
/** Exemple de client utilisant un objet Carnet accessible à distance
 */
public class ClientCarnet {
    public static void main (String args[])
        throws java.rmi.NotBoundException, java.net.MalformedURLException, java.rmi.RemoteException {
        if (args.length != 2) {
            System.out.println ("java ClientCarnet <site serveur>"
                                + "{enregistrer|chercher|effacer|lister}");
            System.exit(1);
        } 
        //  Connexion au serveur de noms (obtention d'un handle)
        Carnet carnet1 = (Carnet) Naming.lookup("//"+args[0]+"/MonCarnet");
        //  Exemples d'utilisation
        if (args[1].equals ("enregistrer")) {
            carnet1.enregistrer ("moi", new Adresse ("Toulouse", "port Saint-Étienne", 32));
            carnet1.enregistrer ("007", new Adresse ("Londres", "Trafalgar Square", 7));
            carnet1.enregistrer ("Han Solo", new Adresse ("Voie Lactée", "Astéroïde à droite", 4));
            carnet1.enregistrer ("Deckard", new Adresse ("Los Angeles", "Bradbury Building", 304));
            carnet1.lister();
        } else if (args[1].equals ("chercher")) {
            String nom = "007";
            try {
                Adresse a = carnet1.chercher (nom);
                System.out.println (nom + " habite au " + a);
            } catch (AdresseInconnue e) {
                System.out.println ("Pas d'adresse pour " + nom);
            }
        } else if (args[1].equals ("effacer")) {
            carnet1.effacer ("007");
        } else if (args[1].equals ("lister")) {
            carnet1.lister ();
        } else {
            System.err.println ("Commande inconnue.");
        }
    }
}
