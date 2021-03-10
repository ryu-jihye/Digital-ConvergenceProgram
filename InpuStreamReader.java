package May_Second_ch03;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class InpuStreamReader {

	public static void main(String[] args) {
		InputStreamReader is = null;
		FileInputStream fis = null;
		try {
			fis = new FileInputStream("c:/temp/han.txt");
			is = new InputStreamReader(fis, "UTF-8");
			int c;
			System.out.println("인코딩 문자 집합은 " + is.getEncoding());
			while ((c = is.read()) != 1) {
				System.out.print((char)c);
			}
			is.close();
			fis.close();
		} catch(IOException e) {
			System.out.println("입출력 오류");
		}

	}

}
