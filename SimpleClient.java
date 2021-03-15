package May_third01_Review;

import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

public class SimpleClient {

	public static void main(String[] args) {
		try {
			Socket socketOfClient = new Socket("127.0.0.1", 9999);
			OutputStream outs = socketOfClient.getOutputStream();
			//소켓에 출력 스트림 연결
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(outs));
			pw.println("hello, java");
			pw.flush();
		} catch (IOException e) {}

	}

}
