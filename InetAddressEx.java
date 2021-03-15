package May_third01_Review;

import java.io.IOException;
import java.net.InetAddress;


public class InetAddressEx {

	public static void main(String[] args) throws IOException {
		// 로컬 컴퓨터의 InetAddress 얻기
		InetAddress ia = InetAddress.getLocalHost();
		System.out.println(ia); //LAPTOP-EAHPU87K/192.168.35.169
		
		
		//외부 컴퓨터의 도메인 이름 얻기
		String line1 = null;
		InetAddress ia1 = InetAddress.getByName(line1);
		System.out.println(ia1); //localhost/127.0.0.1
		
		String line2 = null;
		InetAddress[] ia2Array = InetAddress.getAllByName(line2);
		System.out.println(ia2Array); //[Ljava.net.InetAddress;@77afea7d
		
		//InetAddress.getHo`stName();
		//InetAddress.getHostAddress();
		
	}

}
