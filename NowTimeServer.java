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

	public static void main(String[] args) { //진행중
		// 접속을 기다립니다
		//127.0.0.1로 접속합니다
		//클라이언트로부터 전송받은 문자열 -> 클라이언트에선 시간도 나오기
		Date now = new Date();
		String strNow1 = now.toString();
		SimpleDateFormat sdf=
				new SimpleDateFormat("yyyy-MM-dd-hh:mm:ssa");
		String strNow2 = sdf.format(now);
		
		
		
		try {
			ServerSocket server = new ServerSocket(9999); //클라이언트와 통신하기 위한 소켓
			System.out.println("접속을 기다립니다."); 
			Socket socketOfServer = server.accept(); //서버 생성, client에 신호 대기
			InetAddress inetaddr = socketOfServer.getInetAddress();
			System.out.println(inetaddr.getHostAddress() + " 로 부터 접속하였습니다.");
			
			OutputStream out = socketOfServer.getOutputStream();
			InputStream in = socketOfServer.getInputStream();
			PrintWriter pw = new PrintWriter(new OutputStreamWriter(out));
			
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			String line = null;
			
			Calendar cal = Calendar.getInstance();
			
			while ((line = br.readLine()) != null) {
				System.out.println("클라이언트로부터 전송 받은 문자열 : "+ line);
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


