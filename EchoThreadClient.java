package May_Second_05;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

public class EchoThreadClient {

	public static void main(String[] args) {
		try {
			Socket socketOfClient = new Socket("127.0.0.1",9999);
			BufferedReader keyboard
			=new BufferedReader(new InputStreamReader(System.in));
			
			OutputStream out = socketOfClient.getOutputStream();
			InputStream in = socketOfClient.getInputStream();
			
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(out));
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String line = null;
			
			while((line = keyboard.readLine())!=null) {
				if(line.equals("quit")) {break;}
				pw.println(line);pw.flush();
				
				String echo = br.readLine();
				System.out.println(echo);
			}
			pw.close();br.close();socketOfClient.close();
		}catch(Exception e) {}


	}

}
