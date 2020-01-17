import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux rédacteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioRedacteur implements LectRed {

	private ReentrantLock verrou = new ReentrantLock(); // verrou permet d'assurer l'exclusion mutuelle
	private boolean red = false; // Vrai si un rédacteur occupe le fichier
	private int nl = 0; // Nombre de lecteurs en cours
	private int nra = 0; // Nombre de rédacteurs en attente
	private Condition lp = verrou.newCondition(); // Variable condition: lecture possible
	private Condition ep = verrou.newCondition(); // Variable condition: écriture possible

	public void demanderLecture() throws InterruptedException {
		verrou.lock();

		// On attend qu'il n'y ait pas de rédacteur en cours ou en attente pour démarrer la lecture
		while (red || nra != 0) {
			lp.await();
		}

		nl++;
		lp.signalAll(); // Réveille les lecteurs

		verrou.unlock();
	}

	public void terminerLecture() throws InterruptedException {
		verrou.lock();

		nl--; // Pas de condition pour terminer lecture
		if (nl == 0) { // Pas de rédacteur, nl = 0
			ep.signal();
		}

		verrou.unlock();
	}

	public void demanderEcriture() throws InterruptedException {
		verrou.lock();

		// On attend s'il y a un rédacteur ou un lecteur
		while (red || nl != 0) {
			nra++; // Le nombre de rédacteurs en attente augmente
			ep.await();
			nra--;
		}

		red = true; // Rédacteur en cours
		verrou.unlock();
	}

	public void terminerEcriture() throws InterruptedException {
		verrou.lock();

		// Pas de condition pour terminer l'écriture
		red = false;
		if (nra != 0) { // On réveille les rédacteurs s'il y en a en attente
			ep.signal();
		} else {
			lp.signalAll();
		}

		verrou.unlock();
	}

	public String nomStrategie() {
		return "Stratégie: Priorité Rédacteurs.";
	}
}
