package May_Second_ch03;

class PrintTable {
	synchronized public void printTable(int n) { //synchronized -> 2단 출력 후 5단 출력
		System.out.println(n + "단 출력");
		for(int i=1; i<10; i++) {
			//System.out.println(n + "*" + i + "=" + n*i);
			System.out.printf("%d * %d = %d\n", n, i, n*i);
			try {Thread.sleep(500); }
			catch(InterruptedException e) {}
		}
	}
}

class PrintThread extends Thread{
	PrintTable pt;
	int n;
	PrintThread(PrintTable pt, int n) {
		this.pt = pt; this.n = n;
	}
	public void run() {
		pt.printTable(n);
	}
}

public class PrintThreadEx {

	public static void main(String[] args) {
		PrintTable pt = new PrintTable();
		PrintThread th1 = new PrintThread(pt, 2);
		PrintThread th2 = new PrintThread(pt, 5);
		
		th1.start();
		th2.start();
	}

}
