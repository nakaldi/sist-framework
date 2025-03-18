package fileTest;

import java.io.File;

public class FileTest {
	public static void main(String[] args) {
		File file = new File("c:/student_java/lib/ojdbc6.jar");
		System.out.println("file아 너 있니?" + file.exists());
		
		System.out.println("file아 너 폴더니?" + file.isDirectory());
		System.out.println("file아 너 파일이니?" + file.isFile());
		
		System.out.println("file아 너 이름이 뭐야" + file.getName());
		System.out.println("file아 바이트용량이 몇이야" + file.length());
		
		File file2 = new File("c:/student_java");
		System.out.println("file2아 너 있니?" + file2.exists());
		                        
		System.out.println("file2아 너 폴더니?" + file2.isDirectory());
		System.out.println("file2아 너 파일이니?" + file2.isFile());
		                        
		System.out.println("file2아 너 이름이 뭐야" + file2.getName());
		System.out.println("file2아 바이트용량이 몇이야" + file2.length());
		
		File[] files = file2.listFiles();
		for(File f : files) {
			String filetype = f.isFile()?"[FILE]\t":"[DIR]\t";
			System.out.println(filetype + f.getName() +"\t"+ (f.isFile()?f.length():""));
		}
		
		File file3 = new File("c:/student_java/lib/market");
		//dir을 생성하는 메서드
		file3.mkdir();
		
	}

}
