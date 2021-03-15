package May_third01_Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class URLConnectionEx {

	public static void main(String[] args) {
		try {
			URL url = new URL("https://www.google.com/");
			URLConnection uc = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
			
			String inputLine;
			while ((inputLine = in.readLine()) != null) {
				System.out.println(inputLine);
			}
			in.close();
		} catch(IOException e) {
			System.out.println("URL에서 데이터를 읽는 중 오류가 발생");
		}

	}

}
