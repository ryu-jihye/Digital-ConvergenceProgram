package May_Second_05;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;

public class ChatServer {

	public static void main(String[] args) {
		BufferedReader in = null; //소켓 입력
		BufferedReader stin = null; //키보드 입력 -> 추가한 부분
		PrintWriter out = null;
		Socket socketOfClient = null;
		try {
			ServerSocket server = new ServerSocket(9999); //클라이언트 소켓 생성
			System.out.println("접속을 기다립니다.");
			Socket socketOfServer = server.accept();
			InetAddress inetAddr = socketOfServer.getInetAddress();
			System.out.println(inetAddr.getHostAddress() + " 로 부터 접속했음");
			stin = new BufferedReader(new InputStreamReader(System.in));
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(socketOfServer.getOutputStream()));
			BufferedReader br = new BufferedReader(new InputStreamReader(socketOfServer.getInputStream()));
			String line = null;
			while((line=br.readLine()) != null) {
				System.out.println("클라이언트가 보낸 메시지 : " + line);
				pw.println("서버 > " + stin.readLine());
			}
	} catch(IOException e) {
		e.printStackTrace();
	}

	}

}
