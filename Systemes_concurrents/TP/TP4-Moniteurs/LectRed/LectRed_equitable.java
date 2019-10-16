import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: équitable,
 * implantation: avec un moniteur. */
public class LectRed_equitable implements LectRed {

	private ReentrantLock verrou = new ReentrantLock(true); // verrou permet d'assurer l'exclusion mutuelle, favorise les lecteurs ou rédacteurs qui ont attendu le plus longtemps
	private boolean red = false; // Vrai si un rédacteur occupe le fichier
	private int nl = 0; // Nombre de lecteurs en cours
	private int nrla = 0; // Nombre de lecteurs/rédacteurs en attente
	private Condition acces = verrou.newCondition(); // Acces au fichier par les lecteurs et rédacteurs

	public void demanderLecture() throws InterruptedException {
		verrou.lock();

		// S'il y a un rédacteur ou des rédacteurs/lecteurs en attente
		if (red || nrla != 0) {
			// Il ne faut pas revérifier l'état de la file d'attente au réveil parce que s'il est réveillé, c'est à son tour
			do {
				nrla++; // Un lecteur s'ajoute à la file d'attente
				acces.await();
				nrla--;
			} while (red);
		}

		nl++;
		verrou.unlock();
	}

	public void terminerLecture() throws InterruptedException {
		verrou.lock();

		nl--;
		// Pas de rédacteur et nl >= 0
		if (nl == 0) {
			acces.signal(); // On réveille celui qui attend depuis le plus longtemps
		}

		verrou.unlock();
	}

	public void demanderEcriture() throws InterruptedException {
		verrou.lock();

		// On attend s'il y a des rédacteurs ou lecteurs en cours ou si quelqu'un attend
		if (red || nrla != 0 || nl > 0) {
			// Il ne faut pas revérifier l'état de la file d'attente au réveil parce que s'il est réveillé, c'est à son tour
			do {
				nrla++; // Un rédacteur s'ajoute à la file d'attente
				acces.await();
				nrla--;
			} while (red || nl > 0);
		}

		red = true; // Rédacteur en cours
		verrou.unlock();
	}

	public void terminerEcriture() throws InterruptedException {
		verrou.lock();

		// Pas de rédacteur en cours
		red = false;
		acces.signal(); // On réveille le prochain lecteur ou rédacteur

		verrou.unlock();
	}

	public String nomStrategie() {
		return "Stratégie: équitable.";
	}
}

