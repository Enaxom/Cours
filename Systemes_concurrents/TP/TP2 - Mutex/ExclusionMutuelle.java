import java.util.concurrent.atomic.AtomicBoolean;

public class ExclusionMutuelle {

	static volatile AtomicBoolean busy;
	static final int N = 10;
	static volatile int cpt = 0;

	public static void main(String[] args) {
		busy = new AtomicBoolean(false); // Libre pour aller en section critique

		for (int i = 0; i < N; i++) {
			Thread t = new Thread(new Proc(), String.valueOf(i));
			t.start();
		}
	}
}

class Proc implements Runnable {
	int id;
	public void run() {
		id =  Integer.parseInt(Thread.currentThread().getName());
		for ( ; ; ) {
			System.out.println("Thread " + id + " attend SC ");
			entrer();
			System.out.println("Thread " + Thread.currentThread().getName() + " en SC ");
			ExclusionMutuelle.cpt++;
			System.out.println("---> SC faites : " + ExclusionMutuelle.cpt);
			sortir();
			System.out.println("Thread " + Thread.currentThread().getName() + " hors SC ");
		}
	}

	void entrer() {
		// Attente tant que la valeur de scLibre est à faux
		// Quand scLibre est à true, il passe à faux et l'attente est terminée
		while (ExclusionMutuelle.busy.getAndSet(true)) {}
	}

	void sortir() {
		ExclusionMutuelle.busy.set(false);
	}
}
