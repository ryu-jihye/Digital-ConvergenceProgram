package May_Second_ch03;

import java.io.File;

public class FileClassEx {

	public static void main(String[] args) {
		File file = new File("c:/windows/system.ini");
		String res;
		if(file.isFile())
			res = "����";
		else 
			res = "���丮";
		System.out.println(file.getPath() + "��" + res + "�Դϴ�.");
	}

}
