package carnet;

import java.rmi.server.UnicastRemoteObject;
import java.rmi.RemoteException;
import java.util.*;

public class IndividuLocal implements Individu, java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String nom;
	private int age;

	public IndividuLocal(String nom, int age) {
		this.nom = nom;
		this.age = age;
	}

	public String nom() {
		return nom;
	}

	public int age() {
		return age;
	}

	public void feter_anniversaire() {
		age++;
	}
}
