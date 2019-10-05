import java.util.concurrent.Semaphore;

public class PhiloAssymetrie implements StrategiePhilo {

	private Semaphore fourchettes[];

	/****************************************************************/

	public PhiloAssymetrie (int nbPhilosophes) {
		fourchettes = new Semaphore[nbPhilosophes];
		for (int i = 0; i < nbPhilosophes; i++) {
			fourchettes[i] = new Semaphore(1);
		}
	}

	/** Le philosophe no demande les fourchettes.
	 *  Précondition : il n'en possède aucune.
	 *  Postcondition : quand cette méthode retourne, il possède les deux fourchettes adjacentes à son assiette. */
	public void demanderFourchettes (int no) throws InterruptedException {
		if (no == 0) {
			fourchettes[Main.FourchetteDroite(no)].acquire();
			fourchettes[Main.FourchetteGauche(no)].acquire();
		} else {
			fourchettes[Main.FourchetteGauche(no)].acquire();
			fourchettes[Main.FourchetteDroite(no)].acquire();
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
		return "Implantation Sémaphores, stratégie assymétrique";
	}

}

