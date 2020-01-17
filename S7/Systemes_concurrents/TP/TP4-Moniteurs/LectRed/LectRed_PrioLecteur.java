import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import Synchro.Assert;

/** Lecteurs/rédacteurs
 * stratégie d'ordonnancement: priorité aux lecteurs,
 * implantation: avec un moniteur. */
public class LectRed_PrioLecteur implements LectRed {

	private ReentrantLock verrou = new ReentrantLock(); // verrou permet d'assurer l'exclusion mutuelle
	private boolean red = false; // Vrai si un rédacteur occupe le fichier
	private int nl = 0; // Nombre de lecteurs en cours
	private int nla = 0; // Nombre de lecteurs en attente
	private Condition lp = verrou.newCondition(); // Variable condition: lecture possible -> pas d'écriture en cours !(!red)
	private Condition ep = verrou.newCondition(); // Variable condition: écriture possible -> pas d'écriture, de lecture en cours et de lecture en attente !red && nl == 0 && nla == 0

	public void demanderLecture() throws InterruptedException {
		verrou.lock();

		while (red) { // On attend la condition pour démarrer la lecture
			nla++;
			lp.await();
			nla--;
		}

		nl++;
		lp.signalAll(); // Réveille les lecteurs

		verrou.unlock();
	}

	public void terminerLecture() throws InterruptedException {
		verrou.lock();

		nl--; // Pas de condition pour terminer lecture
		if (nl == 0) { // Pas de rédacteur, nl = 0 et pas de lecteur en attente
			ep.signal();
		}

		verrou.unlock();
	}

	public void demanderEcriture() throws InterruptedException {
		verrou.lock();

		// LP ne doit pas être vide, pas de rédacteur en cours et pas de lecture en cours
		while (red || nl != 0 || nla != 0) {
			ep.await();
		}

		red = true; // Rédacteur en cours {red ^ nl > 0}
		verrou.unlock();
	}

	public void terminerEcriture() throws InterruptedException {
		verrou.lock();

		red = false; // Pas de condition pour terminer écriture
		if (nla == 0) {
			ep.signal(); // S'il n'y a pas de lecteurs en attente, on réveille un rédacteur
		} else {
			lp.signalAll(); // Sinon, on réveille tous les lecteurs
		}

		verrou.unlock();
	}

	public String nomStrategie() {
		return "Stratégie: Priorité Lecteurs.";
	}
}

