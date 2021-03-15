package May_third01_Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class WebsiteReadEx {

	public static void main(String[] args) {
		try {
			URL url = new URL("https://www.youtube.com/");
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			//openStream() �޼ҵ�� �Է� ��Ʈ�� ����
			String inputLine;
			while ((inputLine = br.readLine()) != null) 
				System.out.println(inputLine);
			br.close();
		} catch (IOException e) {
			System.out.println("URL���� �����͸� �д� ��");
		}

	}

}
