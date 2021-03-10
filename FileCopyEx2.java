package May_Second_ch03;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCopyEx2 {
 public static void main(String[] args) {
	 File src = new File("c:/windows/system.ini");
	 File dst = new File("c:/temp/systemdst.txt");
	 FileReader fr = null;
	 FileWriter fw = null;
	 BufferedReader in = null;
	 BufferedWriter out = null;
	 int c;
	 try {
		 fr = new FileReader(src);
		 fw = new FileWriter(dst);
		 in = new BufferedReader(fr);
		 out = new BufferedWriter(fw);
		 while((c = in.read()) != -1) { //null이 아니라고 하면
			 out.write((char)c);
		 }
		 in.close();
		 out.close();
		 fr.close();
		 fw.close();
	 } catch(IOException e) {
		 System.out.println("파일 복사 오류");
	 }
 }
}
