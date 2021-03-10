package May_Second_ch03;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ArrayReadEx {

	public static void main(String[] args) throws IOException {
		InputStream is = new FileInputStream("c:/temp/test2.txt");
		byte[] buffer = new byte[100];
		int count; //일어온 바이트 수
		while((count = is.read(buffer))!= -1) { //파일의 끝에 도달
			for(int i=0; i<count; i++) {
				System.out.println(buffer[i]); 
				//buffer[i] : 읽은 바이트 수 만큼 반복하면서 배열에 저장된 바이트를 화면에 출력
			}
		}

	}

}
