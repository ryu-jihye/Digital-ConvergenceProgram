package May_Second_Review;

class A {
	private int[] arr= new int[3];
	A() {
		arr[0] = 0;
		arr[1] = 10;
		arr[2] = 20;
	}
	public void z(int first, int second) {
		//���� 1
//		System.out.println(arr[first]/arr[second]);
		//�������� �ʴ� ���� ���������� �õ��ϰ� �ֱ� ������ �ڹٿ����� ArrayIndexOutOfBoundsException�� �߻�
		
		//�ذ�
		try {
		System.out.println(arr[first]/arr[second]);
//		} catch(Exception e) {
//			System.out.println("Exception");
		// �� �κ� �Է� �� 
		//It is already handled by the catch block for Exception ����
		//Exception �������� ���� ���� > ArrayIndextOutOfBoundsException �������� ���� ����
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
