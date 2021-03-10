package May_Second_ch03;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;

public class BufferEx {

	public static void main(String[] args) {
		long start, end, duration; //크기가 크므로 long타입
		String org = "c:/Program Files (x86)/Internet Explorer/iexplore.exe";
		String dst = "c:/temp/iexplore1.exe";
		start = System.nanoTime();
		
		BufferedInputStream bis = null; BufferedOutputStream bos = null;
		FileInputStream fis = null;		FileOutputStream fos = null;
		try {
			bis = new BufferedInputStream(new FileInputStream(org));
			bos = new BufferedOutputStream(new FileOutputStream(dst));
			while (bis.available() > 0) {
				int b = bis.read();
				bos.write(b);
			}
			bos.flush();
		} catch (Exception e) {}
		end = System.nanoTime();
		duration = end - start;
		System.out.println("버퍼를 사용한 경우 : " + duration);
		
		start = System.nanoTime();
		try {
			fis = new FileInputStream(org); fos = new FileOutputStream(dst);
			while(fis.available() > 0) {
				int b = fis.read(); fos.write(b);
			}
			fos.flush();
		} catch (Exception e) {}
		end = System.nanoTime();
		duration = end - start;
		System.out.println("버퍼를 사용하지 않은 경우 : " + duration);
	}
	

}
