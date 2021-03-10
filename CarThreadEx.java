package May_Second_ch03;

import java.util.Random;

class SharedCar {
	public synchronized void drive(String name, String destination) {
		System.out.println(name + "님이 공유차에 탔음");
		Random r = new Random();
		for(int i=0; i<r.nextInt(3)+1; i++) //자동차 주행시간을 랜덤하게 처리 {
			System.out.println(name + "님이 공유차를 운전 중");
			System.out.println(name + "님이 " + destination + "에 도착했음");
	}
}

class CarThread extends Thread {
	private String driver;
	private SharedCar car; //공유객체 참조변수
	private String destination;
	public CarThread(String driver, SharedCar car, String destination) {
		this.driver = driver; this.car = car; this.destination = destination;
	}
	public void run() {car.drive(driver, destination);}
}

public class CarThreadEx {

	public static void main(String[] args) {
		SharedCar car = new SharedCar();
		new CarThread("코난", car, "서울").start();
		new CarThread("장미", car, "부산").start();
		new CarThread("미란", car, "대전").start();


	}

}
