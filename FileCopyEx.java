package May_Second_ch03;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class FileCopyEx {

	public static void main(String[] args) {
		String src = "c:/windows/system.ini"; //원본 파일
		String dest = "c:/temp/system_copy.ini"; //복사 파일
		try {
			FileInputStream fis = new FileInputStream(src); //읽을 파일
			FileOutputStream fos = new FileOutputStream(dest); //복사할 파일
 			
			int c;
			while ((c = fis.read()) != -1)
				fos.write(c); 
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
