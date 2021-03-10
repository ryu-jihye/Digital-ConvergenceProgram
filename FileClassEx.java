package May_Second_ch03;

import java.io.File;

public class FileClassEx {

	public static void main(String[] args) {
		File file = new File("c:/windows/system.ini");
		String res;
		if(file.isFile())
			res = "파일";
		else 
			res = "디렉토리";
		System.out.println(file.getPath() + "은" + res + "입니다.");
	}

}
