import java.rmi.RemoteException;
public interface Carnet extends java.rmi.Remote {
    public void enregistrer (String Nom, Adresse a) throws RemoteException;
    public Adresse chercher (String Nom) throws RemoteException, AdresseInconnue;
    public void effacer (String Nom) throws RemoteException;
    public void lister () throws RemoteException;
    public void copier (String Nom, Carnet orig) throws RemoteException;
}
