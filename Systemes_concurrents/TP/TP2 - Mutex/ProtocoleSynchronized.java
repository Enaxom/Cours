public class ProtocoleSynchronized {

	static final int N = 10;
	static Object mutex = new Object();
	static volatile int cpt = 0;

	public static void main(String[] args) {
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
			synchronized(ProtocoleSynchronized.mutex) {
				System.out.println("Thread " + Thread.currentThread().getName() + " en SC ");
				ProtocoleSynchronized.cpt++;
				System.out.println("---> SC faites : " + ProtocoleSynchronized.cpt);
			}
			System.out.println("Thread " + Thread.currentThread().getName() + " hors SC ");
		}
	}
}
