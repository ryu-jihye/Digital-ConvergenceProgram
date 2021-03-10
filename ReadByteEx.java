package May_Second_ch03;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

public class ReadByteEx {

	public static void main(String[] args) throws IOException{
		InputStream is = new FileInputStream("c:/temp/test3.txt");
		byte[] buffer = new byte[5];
		int count;
		while ((count = is.read(buffer, 2, 3)) != -1) {
			for(int i=0; i<buffer.length; i++) {
				System.out.println(buffer[i]);
			}
		}

	}

}
