package May_third01_Review;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class IOEx {

	public static void main(String[] args) {
		BufferedReader br = null;
		PrintWriter pw = null; //���ڱ�� ��Ʈ�� 
		String line = null;
		
		try {
			br = new BufferedReader (new InputStreamReader(System.in));
			pw = new PrintWriter(new FileWriter("c:/temp/IOEx"));
			
			while((line = br.readLine()) != null) {
				System.out.println(line);
				pw.write(line);
			}
			pw.close();
		} catch (IOException e) {
			System.out.println("����� ����");
		}
		

	}

}
