package semi.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyRenamePolicy implements FileRenamePolicy {
	public static ArrayList Filenamechange = new ArrayList();
	// 다른곳에서 이름을 뽑아쓸 수 있게 Static 변수로 list를생성
	@Override
	public File rename(File oldFile) {
		// 현재 시간 기준의 파일 포맷 방식
		// 사용하기
		
		long currentTimes = System.currentTimeMillis();
		
		SimpleDateFormat sdf 
		 = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		int randomNumber = (int)(Math.random() * 10000);
		
		// 확장자 명만 제외하고 이름 바꾸기
		String name = oldFile.getName();
		String body = "";  // 파일 명
		String ext = "";   // 파일 확장자
		
		// index.html ; index ; .html
		
		int dot = name.lastIndexOf('.');
		
		if(dot != -1) {
			// 확장자가 존재하는 경우
			body = name.substring(0, dot);
			
			ext = name.substring(dot);
		} else {
			// 확장자가 없을 경우
			body = name;
		}
		
		// 새로 만들어질 파일 명 생성하기
		
		String fileName = sdf.format(new Date(currentTimes))
				+ "_" + randomNumber + ext;
		Filenamechange.add(fileName);
		// 파일이 이 클래스를 지나갈때마다 변하는 이름을 static 변수에 집어넣는다
				
		File newFile = new File(oldFile.getParentFile(), fileName);
				
		return newFile;
	}

}










