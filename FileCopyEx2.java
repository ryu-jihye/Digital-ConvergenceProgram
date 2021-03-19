package May_third01_Review;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

public class FileCopyEx2 {

	public static void main(String[] args) {
		String urlStr = "https://en.wikipedia.org/wiki/Main_Page";
		try {
			URL url = new URL(urlStr);
			System.out.println("�������� : " + url.getProtocol());
			System.out.println("ȣ��Ʈ : " + url.getHost());
			System.out.println("��Ʈ��ȣ : " + url.getDefaultPort());
			System.out.println("Path : " + url.getPath());
			System.out.println("QueryString : " + url.getQuery());
			System.out.println("Reference : " + url.getRef());
		
			InputStream is =url.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			PrintWriter pw = new PrintWriter(System.out, true);
			//FileWriter : ���Ϸ� ���� �� �ѱ��� ����
			PrintWriter fw = new PrintWriter(new FileOutputStream("c:/temp/aaa2.html"));
			
			String line = "";
			while ((line = br.readLine()) != null) {
				pw.println(line);
				fw.println(line);
				fw.flush();
			}
			br.close();
			is.close();
			pw.close();
			fw.close();
		} catch(MalformedURLException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}

	}

}