import java.util.concurrent.Semaphore;

public class PhiloEtat implements StrategiePhilo {

	private EtatPhilosophe[] etat;
	private Semaphore mutex = new Semaphore(1);
	private Semaphore[] philos;

	/****************************************************************/

	public PhiloEtat (int nbPhilosophes) {
		etat = new EtatPhilosophe[nbPhilosophes];
		philos = new Semaphore[nbPhilosophes];
		for (int i = 0; i < nbPhilosophes; i++) {
			etat[i] = EtatPhilosophe.Pense;
			philos[i] = new Semaphore(0);
		}
	}

	/** Le philosophe no demande les fourchettes.
	 *  Précondition : il n'en possède aucune.
	 *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
	public void demanderFourchettes (int no) throws InterruptedException {
		boolean mange = false;
		while(!mange) {
			mutex.acquire();
			etat[no] = EtatPhilosophe.Demande;

			if (!peutManger(no)) {
				mutex.release();
				philos[no].acquire();
			} else {
				etat[no] = EtatPhilosophe.Mange;
				mutex.release();
				mange = true;
			}
		}
	}

	/** Le philosophe no rend les fourchettes.
	 *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
	 *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
	public void libererFourchettes (int no) throws InterruptedException {
		mutex.acquire();
		etat[no] = EtatPhilosophe.Pense;

		if (peutManger(Main.PhiloDroite(no))) {
			philos[Main.PhiloDroite(no)].release();
		}

		if (peutManger(Main.PhiloGauche(no))) {
			philos[Main.PhiloGauche(no)].release();
		}
		mutex.release();
	}

	/** Nom de cette stratégie (pour la fenêtre d'affichage). */
	public String nom() {
		return "Implantation Sémaphores, stratégie qui prend en compte l'état de ses voisins";
	}

	private boolean peutManger(int no) {
		return etat[no] == EtatPhilosophe.Demande && etat[Main.PhiloDroite(no)] != EtatPhilosophe.Mange && etat[Main.PhiloGauche(no)] != EtatPhilosophe.Mange;
	}
}

