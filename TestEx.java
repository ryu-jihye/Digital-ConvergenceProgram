package May_Second_ch03;

import java.util.StringTokenizer;

public class TestEx {

	public static void main(String[] args) {
		StringTokenizer st = new StringTokenizer("to be or not to be a problem", " ");
		
//		System.out.println(st.nextToken());
//		System.out.println(st.nextToken());
//		System.out.println(st.nextToken());
//		System.out.println(st.nextToken());
//		System.out.println(st.nextToken());System.out.println(st.nextToken());
//		System.out.println(st.nextToken());System.out.println(st.nextToken());
//		System.out.println(st.nextToken());
		while(st.hasMoreTokens()) {
			System.out.println(st.nextToken());
		}
	}

}
