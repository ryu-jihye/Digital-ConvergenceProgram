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

public class ReadGithub {

	public static void main(String[] args) {
		String urlStr = "https://github.com/";
		try {
			URL url = new URL(urlStr);
			
			InputStream is =url.openStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			PrintWriter pw = new PrintWriter(System.out, true);
			PrintWriter fw = new PrintWriter(new FileOutputStream("c:/temp/github.html"));
			
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
