package carnet;

import java.rmi.RemoteException;

/** Interface Individu. */
public interface Individu extends java.rmi.Remote {
	/** Renvoie le nom de l'individu. */
	String nom() throws RemoteException;

	/** Renvoie l'age actuel de l'individu. */
	int age() throws RemoteException;

	/** Incrémente l'age actuel de l'individu et affiche à l'écran un message. */
	void feter_anniversaire () throws RemoteException;
}
