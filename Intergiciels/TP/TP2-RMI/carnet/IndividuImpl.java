package carnet;

import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.util.*;

public class IndividuImpl extends UnicastRemoteObject implements Individu {

	private static final long serialVersionUID = 1L;

	private String nom;
	private int age;

	public IndividuImpl(String nom, int age) throws RemoteException {
		this.nom = nom;
		this.age = age;
	}

	public String nom() throws RemoteException {
		return nom;
	}

	public int age() throws RemoteException {
		return age;
	}

	public void feter_anniversaire() throws RemoteException {
		age++;
	}
}
