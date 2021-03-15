package May_third01_Review;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;

public class SimpleServer {

	public static void main(String[] args) {
		try {
			ServerSocket server = new ServerSocket(9999);
			System.out.println("접속을 기다립니다.");
			Socket socketOfServer = server.accept();
			InputStream is = socketOfServer.getInputStream();
			//소켓에 입력스트림 연결
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String line = br.readLine(); //소켓에 연결된 클라이언트 입력
			System.out.println("받은 문자열 = " + line);
		} catch (Exception e) {}

	}

}
