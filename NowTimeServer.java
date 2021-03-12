package May_Second_05;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class NowTimeServer {

	public static void main(String[] args) { //������
		// ������ ��ٸ��ϴ�
		//127.0.0.1�� �����մϴ�
		//Ŭ���̾�Ʈ�κ��� ���۹��� ���ڿ� -> Ŭ���̾�Ʈ���� �ð��� ������
		Date now = new Date();
		String strNow1 = now.toString();
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd-hh:mm:ssa");
		String strNow2 = sdf.format(now);
		
		
		
		try {
			ServerSocket server = new ServerSocket(9999); //Ŭ���̾�Ʈ�� ����ϱ� ���� ����
			System.out.println("������ ��ٸ��ϴ�."); 
			Socket socketOfServer = server.accept(); //���� ����, client�� ��ȣ ���
			InetAddress inetaddr = socketOfServer.getInetAddress();
			System.out.println(inetaddr.getHostAddress() + " �� ���� �����Ͽ����ϴ�.");
			
			OutputStream out = socketOfServer.getOutputStream();
			InputStream in = socketOfServer.getInputStream();
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(out));
			
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String line = null;
			
			Calendar cal = Calendar.getInstance();
			
			while ((line = br.readLine()) != null) {
				System.out.println("Ŭ���̾�Ʈ�κ��� ���� ���� ���ڿ� : "+ line);
				System.out.println(cal.getTime() + line);
				//cal.getTime()
				pw.println(line);
				pw.flush();
			}
			pw.close();
			br.close();
			socketOfServer.close();
		} catch(Exception e) {
			System.out.println(e);
		}
		}

	}


