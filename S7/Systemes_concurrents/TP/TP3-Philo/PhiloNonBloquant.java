import java.util.concurrent.Semaphore;

public class PhiloNonBloquant implements StrategiePhilo {

	private Semaphore fourchettes[];

	/****************************************************************/

	public PhiloNonBloquant (int nbPhilosophes) {
		fourchettes = new Semaphore[nbPhilosophes];
		for (int i = 0; i < nbPhilosophes; i++) {
			fourchettes[i] = new Semaphore(1);
		}
	}

	/** Le philosophe no demande les fourchettes.
	 *  Précondition : il n'en possède aucune.
	 *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
	public void demanderFourchettes (int no) throws InterruptedException {
		boolean possede = false;
		while (!possede) {
			fourchettes[Main.FourchetteDroite(no)].acquire();
			if (!fourchettes[Main.FourchetteGauche(no)].tryAcquire()) {
				fourchettes[Main.FourchetteDroite(no)].release();
			} else {
				possede = true;
			}
		}
	}

	/** Le philosophe no rend les fourchettes.
	 *  Précondition : il possède les deux fourchettes adjacentes à son assiette.
	 *  Postcondition : il n'en possède aucune. Les fourchettes peuvent être libres ou réattribuées à un autre philosophe. */
	public void libererFourchettes (int no) throws InterruptedException {
		fourchettes[Main.FourchetteDroite(no)].release();
		fourchettes[Main.FourchetteGauche(no)].release();
	}

	/** Nom de cette stratégie (pour la fenêtre d'affichage). */
	public String nom() {
		return "Implantation Sémaphores, stratégie de prise de fourchettes non bloquante";
	}

}

