package May_Second_ch03;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class FileCopyEx3 {

	public static void main(String[] args) {
		BufferedReader br = null;
		BufferedWriter bw = null;
		String srcFile = ("c:/temp/dorian.ini");
		String destFile = ("c:/temp/dorian.txt");
		
		String inSr = null;
		Scanner scan = new Scanner(System.in);
		try {
			br = new BufferedReader(new FileReader(scrFile));
			bw = new BufferedWriter(new FileReader(destFile));
			
			while(((inStr = br.readLine()) != null)) {
				System.out.println(inStr);
				bw.writer(inStr + "\n");
			}
			bw.close();
		} catch( IOException e) {
			e.printStackTrace();
		}

	}

}
