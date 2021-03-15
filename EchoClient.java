package May_third01_Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

public class EchoClient {

	public static void main(String[] args) {
		try {
			Socket socketOfClient = new Socket("127.0.0.1", 9999);
			BufferedReader keyboard = new BufferedReader(new InputStreamReader(System.in));
			OutputStream outs = socketOfClient.getOutputStream();
			InputStream in = socketOfClient.getInputStream();
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(outs));
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String line = null;
			while ((line = keyboard.readLine()) != null) {
				if(line.equals("quit")) { break;}
				pw.println(line);
				pw.flush();
				String echo = br.readLine();
				System.out.println("서버로부터 전달받은 문자열 " + echo);
			}
			pw.close();
			br.close();
			socketOfClient.close();
		} catch (IOException e) {}

	}

}
