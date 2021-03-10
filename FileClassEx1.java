package May_Second_ch03;

import java.io.File;

public class FileClassEx1 {

	public static void main(String[] args) {
		File file = new File("c:/windows");
		File[] fs = file.listFiles();
		for (File f : fs) {
			if(f.isDirectory()) {
				System.out.printf("dir : %s\n", f);
			} else {
				System.out.printf("file : %s(%d bytes)\n", f, f.length());
			}
		}

	}

}
