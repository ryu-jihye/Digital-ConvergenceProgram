package May_third01_Review;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class NslookupEx {

	public static void main(String[] args) {
		if(args.length != 1) {
			System.out.println("IP주소나 도메인 주소를 인자로 지정하세요");
			System.exit(0);
		}
		InetAddress inetAddr[] = null;
		InetAddress ia = null;
		
		try {
			ia = InetAddress.getByName(args[0]);
			inetAddr = InetAddress.getAllByName(args[0]);
		} catch(UnknownHostException e) {}
		System.out.println(ia.getHostName());
		System.out.println(ia.getHostAddress());
		
		System.out.println("==================================");
		
		for(int i=0; i<inetAddr.length; i++) {
			System.out.println(inetAddr[i].getHostName());
			System.out.println(inetAddr[i].getHostAddress());
			System.out.println(inetAddr[i].toString());
			System.out.println("==================================");
		}

	}

}
