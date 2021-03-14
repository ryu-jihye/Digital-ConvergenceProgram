package May_Second_Review;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class InputStreamReaderEx {

	public static void main(String[] args) {
		InputStreamReader isr = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream("c:/temp/han.txt");
			isr = new InputStreamReader(fis, "UTF-8");
			int number;
			System.out.println("인코딩 문자 집합은" + isr.getEncoding());
			while ((number = isr.read()) != -1) {
				System.out.print((char)number);
			}
			isr.close();
			fis.close();
		} catch (IOException e) {
			System.out.println("입출력 오류");
		}

	}

}
