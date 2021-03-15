package May_third01_Review;

import java.net.MalformedURLException;
import java.net.URL;

public class UrlEx {

	public static void main(String[] args) {
		if(args.length != 1) {
			System.exit(1);
		}
		URL url = null;
		try {
			url = new URL(args[0]);
		} catch(MalformedURLException e) {
			System.out.println("잘못된 URL 형식입니다.");
			System.out.println(e);
			System.exit(1);
		}
		System.out.println("프로토콜  : " + url.getProtocol());
		System.out.println("호스트 이름  : " + url.getHost());
		System.out.println("포트번호 : " + url.getPort());
		System.out.println("파일 이름  : " + url.getPath());
		System.out.println("사용자 쿼리 : " + url.getQuery());
				
	}

}
