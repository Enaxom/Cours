import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

public class CarnetImpl extends UnicastRemoteObject implements Carnet {
    private Map contenu = new HashMap();
    public CarnetImpl() throws RemoteException {}
    public void enregistrer (String nom, Adresse a) {
        contenu.put (nom, a);
    }
    public Adresse chercher (String nom) throws AdresseInconnue {
        if (contenu.containsKey (nom))
          return (Adresse) contenu.get (nom);
        else
          throw new AdresseInconnue();
    }
    public void effacer (String nom) {
        contenu.remove (nom);
    }
    public void lister () {
        System.out.println ("Contenu du carnet:");
        Iterator it = contenu.keySet().iterator();
        while (it.hasNext()) {
            String nom = (String) it.next();
            System.out.println (" " + nom + " : " + (Adresse)contenu.get(nom));
        }
        System.out.println("----");
    }
    public void copier (String nom, Carnet orig) throws RemoteException {
        try {
            Adresse a = orig.chercher (nom);
            this.enregistrer (nom, a);
        } catch (AdresseInconnue e) {
            // pas grave => on ignore
        }
    }
}
