import java.util.concurrent.atomic.AtomicLong;

public class ProtocoleSynchronized {

	static final int N = 10;
	static Object mutex = new Object();
	static AtomicLong cpt;

	public static void main(String[] args) {
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
			synchronized(ProtocoleSynchronized.mutex) {
				cptVal = ProtocoleSynchronized.cpt.incrementAndGet();
				System.out.println("Thread " + Thread.currentThread().getName() + " en SC \n---> SC faites : " + cptVal);
			}
			System.out.println("Thread " + Thread.currentThread().getName() + " hors SC ");
		}
	}
}
