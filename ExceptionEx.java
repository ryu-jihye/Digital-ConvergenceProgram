package May_Second_Review;

class Calculator {
	int left, right;
	public void setOprands(int left, int right) {
		this.left= left;
		this.right = right;
	}


public void divide() {
	// �߸��� ǥ��
//	System.out.print("��� ����� ");
//	System.out.print(this.left/this.right);
//	System.out.print("�Դϴ�.");
	//Exception in thread "main" ��� ����� java.lang.ArithmeticException: / by zero
	//��� ��� ���� : 10�� 0���� �������� ��
	
	//���� �ذ�� : exception �߰�
	try {
		System.out.print("��� ����� ");
		System.out.print(this.left/this.right);
		System.out.print("�Դϴ�.");
	} catch(Exception e) {
		System.out.println("������ �߻��߽��ϴ�." + e.getMessage());
		System.out.println("������ �߻��߽��ϴ�." + e.toString());
//		System.out.println(""\n\ne.printStackTrace()");"
				e.printStackTrace();
	}
	
}
}

public class ExceptionEx {

	public static void main(String[] args) {
		Calculator c1 = new Calculator();
		c1.setOprands(10, 0);
		c1.divide();
	}

}
