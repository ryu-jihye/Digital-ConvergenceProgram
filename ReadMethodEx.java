package May_Second_ch03;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ReadMethodEx {

	public static void main(String[] args) throws IOException {
		InputStream is = new FileInputStream("c:/temp/test1.txt");
		int data;
		while((data = is.read()) != -1) { //파일에 끝에 도달
			System.out.println(data);
		}
		is.close();
	}

}
