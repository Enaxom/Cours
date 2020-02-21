package carnet;

import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.util.*;

/** Implémentation basique d'un Carnet accessible à distance.
 *  Utilise une List(e) pour ranger les Individu(s).
 */
public class CarnetImpl extends UnicastRemoteObject implements Carnet {
	
	private List<Individu> contenu = new ArrayList<Individu>();
	private List<CallbackOnCreation> callbacks = new ArrayList<CallbackOnCreation>();

	public CarnetImpl() throws RemoteException {}

	/**** A COMPLETER ****/
	/** Insère l'Individu dans le carnet. */
	public void inserer (Individu x) throws RemoteException {
		Individu nouv = new IndividuRemote(x.nom(), x.age());

		contenu.add(nouv);

		for (CallbackOnCreation cb: callbacks)
			cb.eventCreated(nouv);

		System.out.println("Individu inséré: " + nouv.nom());
	}

	/** Renvoie un Individu dont le nom correspond à <code>nom</code>,
	 * ou lève l'exception <code>IndividuInexistant</code> s'il n'y en a pas. */
	public Individu chercher (String nom) throws RemoteException, IndividuInexistant {
		System.out.println("Recherche de l'individu " + nom);
		for (Individu ind: contenu)
			if (ind.nom().equals(nom))
				return ind;

		System.out.println("Individu non trouvé");
		throw new IndividuInexistant("Individu inexistant");
	}

	/** Renvoie le <code>n</code>-ième Individu du carnet,
	 * ou lève <code>IndividuInexistant</code> s'il n'y en a pas. */
	public Individu get (int n) throws RemoteException, IndividuInexistant {
		try {
			System.out.println("Recherche de l'individu n°" + n);
			return contenu.get(n);
		} catch (IndexOutOfBoundsException e) {
			throw new IndividuInexistant("Individu inexistant");
		}
	}

	/** Renvoie l'ensemble des Individu(s) contenus dans le carnet, sous
	 * la forme d'un tableau. */
	public Individu[] getAll() throws RemoteException {
		System.out.println("Affichage de tous les individus");
		return contenu.toArray(new Individu[contenu.size()]);
	}

	/** Ajouter un callback pour être informé lors de la création d'un Individu. */
	public void addCallbackOnCreation(CallbackOnCreation cb) throws RemoteException {
		callbacks.add(cb);
	}
	
	/** Enlever un callback. */
	public void removeCallbackOnCreation(CallbackOnCreation cb) throws RemoteException {
		callbacks.remove(cb);
	}
}
