package May_Second_ch03;

import java.io.FileReader;
import java.io.IOException;

public class FileReaderEx {

	public static void main(String[] args) {
		FileReader in = null;
		try {
			in = new FileReader("c:/windows/system.ini");
			int c;
			while ((c = in.read()) != -1) {
				System.out.print((char)c);
			}
			in.close();
		} catch(IOException e) {
			System.out.println("입출력 오류");
		}

	}

}
