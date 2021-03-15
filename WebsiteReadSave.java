package May_third01_Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class WebsiteReadSave {

	public static void main(String[] args) throws IOException {
		//웹사이트를 읽어옴
		
		try {
			URL url = new URL("https://en.wikipedia.org/wiki/"); //위키로 바꾸기
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			//openStream() 메소드로 입력 스트림 생성
			String inputLine;
			while ((inputLine = br.readLine()) != null) 
				System.out.println(inputLine); //콘솔에 불러옴
			//파일에 저장하는 부분 (바로 저장) -> Writer 부분
			
			br.close();
		} catch (IOException e) {
			System.out.println("URL에서 데이터를 읽는 중");
		}
		}
	}




//catch(FileNotFoundException e) {
//	System.out.println("지정할 파일이 없습니다.");
//} catch(IOException e) {
//	System.out.println("알 수 없는 입출력 오류입니다.");
//}