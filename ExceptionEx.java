package May_Second_Review;

class Calculator {
	int left, right;
	public void setOprands(int left, int right) {
		this.left= left;
		this.right = right;
	}


public void divide() {
	// 잘못된 표기
//	System.out.print("계산 결과는 ");
//	System.out.print(this.left/this.right);
//	System.out.print("입니다.");
	//Exception in thread "main" 계산 결과는 java.lang.ArithmeticException: / by zero
	//계산 결과 오류 : 10을 0으로 나누려고 함
	
	//오류 해결법 : exception 추가
	try {
		System.out.print("계산 결과는 ");
		System.out.print(this.left/this.right);
		System.out.print("입니다.");
	} catch(Exception e) {
		System.out.println("오류가 발생했습니다." + e.getMessage());
		System.out.println("오류가 발생했습니다." + e.toString());
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
