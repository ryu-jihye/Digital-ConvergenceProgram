package May_Second_Review;

import java.io.File;

public class FileEx {

	public static void main(String[] args) {
		File file1 = new File("c:/temp/test2.txt");
		File file2 = new File("c:/windows/system.ini");
		String fname;
		if(file2.isFile()) {
			fname = "����";
		} else {
			fname  = "���͸�";
		}
		System.out.println(file2.getPath() + "��" + fname + "�Դϴ�."); 
	
		File file3 = new File("c:/windows");
		File[] fs = file3.listFiles();
		for (File f : fs) {
			if(f.isDirectory()) {
				System.out.printf("dir : %s\n", f);
			} else {
				System.out.printf("file : %s(%d bytes(\n", f, f.length());
			}
		}
	
	}

}
