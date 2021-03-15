package May_third01_Review;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class LocalIPEx {

	public static void main(String[] args) {
		InetAddress inetaddr = null;
		try {
			inetaddr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
		}
		System.out.println(inetaddr.getHostName());
		System.out.println(inetaddr.getHostAddress());

	}

}
