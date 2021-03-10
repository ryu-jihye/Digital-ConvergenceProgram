package May_Second_ch03;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class OneByteOutput {

	public static void main(String[] args) throws IOException { //예외 던지기
		OutputStream os = new FileOutputStream("c:/temp/test1.txt");
		
		os.write((byte)10);
		os.write((byte)20);
		os.write((byte)30);
		os.flush();
		os.close();

	}

}
