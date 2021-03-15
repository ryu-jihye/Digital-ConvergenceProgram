package May_third01_Review;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCopyEx {

	public static void main(String[] args) {
		File src = new File("c:/windows/system.ini");
		File dest = new File("c:/temp/system.txt");
		
		FileReader fr = null;
		FileWriter fw = null;
		BufferedReader br = null;
		BufferedWriter bw = null;
		int c;
		
		try {
			fr = new FileReader(src);
			fw = new FileWriter(dest);
			br = new BufferedReader(fr);
			bw = new BufferedWriter(fw);
		
			while((c= br.read()) != -1) {
				bw.write((char)c);
			}
			fr.close(); fw.close();
			br.close(); bw.close();
		} catch(IOException e) {
			System.out.println("설정상 오류입니다.");
		}

	}

}
