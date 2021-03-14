package May_Second_Review;

import java.io.IOException;

public class ExceptionEx2 {

	public static void main(String[] args) {
		byte[] list = {'a', 'b', 'c'};
		
		try {
		System.out.write(list);
	} catch (IOException e) {
		e.printStackTrace();
	}
		
		try {
			System.out.println(5/0);
		} catch (ArithmeticException e) {
			System.out.println("현재 발생한 예외 정보 : " + e.getMessage());
		}
		
	}
}
