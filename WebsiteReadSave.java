package May_third01_Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

public class WebsiteReadSave {

	public static void main(String[] args) throws IOException {
		//������Ʈ�� �о��
		
		try {
			URL url = new URL("https://en.wikipedia.org/wiki/"); //��Ű�� �ٲٱ�
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
			//openStream() �޼ҵ�� �Է� ��Ʈ�� ����
			String inputLine;
			while ((inputLine = br.readLine()) != null) 
				System.out.println(inputLine); //�ֿܼ� �ҷ���
			//���Ͽ� �����ϴ� �κ� (�ٷ� ����) -> Writer �κ�
			
			br.close();
		} catch (IOException e) {
			System.out.println("URL���� �����͸� �д� ��");
		}
		}
	}




//catch(FileNotFoundException e) {
//	System.out.println("������ ������ �����ϴ�.");
//} catch(IOException e) {
//	System.out.println("�� �� ���� ����� �����Դϴ�.");
//}