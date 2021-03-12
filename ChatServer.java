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
		BufferedReader in = null; //���� �Է�
		BufferedReader stin = null; //Ű���� �Է� -> �߰��� �κ�
		PrintWriter out = null;
		Socket socketOfClient = null;
		try {
			ServerSocket server = new ServerSocket(9999); //Ŭ���̾�Ʈ ���� ����
			System.out.println("������ ��ٸ��ϴ�.");
			Socket socketOfServer = server.accept();
			InetAddress inetAddr = socketOfServer.getInetAddress();
			System.out.println(inetAddr.getHostAddress() + " �� ���� ��������");
			stin = new BufferedReader(new InputStreamReader(System.in));
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(socketOfServer.getOutputStream()));
			BufferedReader br = new BufferedReader(new InputStreamReader(socketOfServer.getInputStream()));
			String line = null;
			while((line=br.readLine()) != null) {
				System.out.println("Ŭ���̾�Ʈ�� ���� �޽��� : " + line);
				pw.println("���� > " + stin.readLine());
			}
	} catch(IOException e) {
		e.printStackTrace();
	}

	}

}
