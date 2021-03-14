package May_Second_Review;

class A {
	private int[] arr= new int[3];
	A() {
		arr[0] = 0;
		arr[1] = 10;
		arr[2] = 20;
	}
	public void z(int first, int second) {
		//문제 1
//		System.out.println(arr[first]/arr[second]);
		//존재하지 않는 값을 가져오려고 시도하고 있기 때문에 자바에서는 ArrayIndexOutOfBoundsException을 발생
		
		//해결
		try {
		System.out.println(arr[first]/arr[second]);
//		} catch(Exception e) {
//			System.out.println("Exception");
		// 이 부분 입력 시 
		//It is already handled by the catch block for Exception 나옴
		//Exception 포괄적인 예외 범위 > ArrayIndextOutOfBoundsException 포괄적인 예외 범위
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("ArrayIndexOutOfBoundsException");
		} catch(Exception e) {
			System.out.println("Exception e");
		} finally {
			System.out.println("finally");
		}
	
	}
}

public class ExceptionEx1 {

	public static void main(String[] args) {
		A a = new A();
		a.z(10, 0);
		a.z(1, 0);
		a.z(2, 1);

	}

}
