package kr.co.plantlibrary.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtil {
	
	public String uploadFile(MultipartFile[] upload, MultipartHttpServletRequest request, String path) {
		
		String saveDir= request.getSession().getServletContext().getRealPath("/resources/assets/img");
		
		saveDir += path;
		
		// 위에서 설정한 경로의 폴더가 없을 경우 생성
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String fileList = "";
		
		// 파일 업로드
		for(MultipartFile f: upload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename();
				System.out.println(orifileName);
				String ext = orifileName.substring(orifileName.lastIndexOf("."));
				
				// 이름 값 변경을 위한 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				int rand = (int)(Math.random()*1000);
				
				// 파일 이름 변경
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext;
				
				// 파일 저장
				try {
					f.transferTo(new File(saveDir + "/" + reName));
					fileList += reName + ",";
					
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
	   
		if (fileList == null || fileList.length() == 0)
	            return null;
		
		return fileList.substring(0, fileList.length() - 1);

		
	}
	
	public int deleteFile(HttpServletRequest request, String path, String fileText) throws IOException {
		
		if(fileText == null || fileText.length()==0)
			return 0;
		
		String[] arr = fileText.split(",");
		
		
		for(int i=0; i<arr.length; i++) {
			
			String saveDir= request.getSession().getServletContext().getRealPath("/resources/assets/img");
			saveDir += path + "/" + arr[i];
			
			boolean result = Files.deleteIfExists(Paths.get(saveDir));
			
			if(result)
				System.out.println("파일 삭제 완료");
			else
				System.out.println("파일 삭제 실패");			
			
		}
		
		
		return 0;
	}
	
	
	
	
	

}
