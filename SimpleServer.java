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
			System.out.println("������ ��ٸ��ϴ�.");
			Socket socketOfServer = server.accept();
			InputStream is = socketOfServer.getInputStream();
			//���Ͽ� �Է½�Ʈ�� ����
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String line = br.readLine(); //���Ͽ� ����� Ŭ���̾�Ʈ �Է�
			System.out.println("���� ���ڿ� = " + line);
		} catch (Exception e) {}

	}

}
