import java.rmi.Naming;
import java.rmi.registry.LocateRegistry;

/** Création d'un serveur de nom intégré et d'un objet accessible à distance */
public class ServeurCarnet {
    public static void main (String args[]) {
        try {
            //  Création de l'objet Carnet
            Carnet unCarnet = new CarnetImpl();
            //  Création du serveur de noms
            LocateRegistry.createRegistry(1099);
            //  Enregistrement du carnet dans le serveur local
            Naming.bind("MonCarnet", unCarnet);
        } catch (Exception e) { System.err.println (e); }
        // Service prêt : attente d'appels
        System.out.println ("Le système est prêt.");
    }
}
