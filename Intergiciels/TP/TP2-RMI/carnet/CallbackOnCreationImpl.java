package carnet;

import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;

public class CallbackOnCreationImpl extends UnicastRemoteObject implements CallbackOnCreation {

	public CallbackOnCreationImpl() throws RemoteException {

	}

	/** Un individu a été créé. */
	public void eventCreated(Individu i) throws RemoteException {
		System.out.println("Individu ajouté: " + i.nom());
	}
}
