import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

public class ExclusionMutuelle {

	static volatile AtomicBoolean busy;
	static final int N = 2;
	static AtomicLong cpt;

	public static void main(String[] args) {
		busy = new AtomicBoolean(false); // Libre pour aller en section critique
		cpt = new AtomicLong(0);

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
		long cptVal;
		for ( ; ; ) {
			System.out.println("Thread " + id + " attend SC ");
			entrer();
			cptVal = ExclusionMutuelle.cpt.incrementAndGet();
			System.out.println("Thread " + Thread.currentThread().getName() + " en SC \n---> SC faites : " + cptVal);
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
