package May_Second_ch03;

import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileWriterEx {

	public static void main(String[] args) {
		InputStreamReader in = new InputStreamReader(System.in);
		
		FileWriter fout = null;
		int c;
		try {
			fout = new FileWriter("c:/temp/test1.txt");
			while ((c = in.read()) != -1) {
				fout.write(c); //파일에 쓰기 -> 파일로 저장
			}
			in.close();
			fout.close();
		} catch(IOException e) {
			System.out.println("입출력 오류");
		}

	}

}
