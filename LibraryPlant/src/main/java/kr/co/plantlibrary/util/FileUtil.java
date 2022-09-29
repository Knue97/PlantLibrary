package kr.co.plantlibrary.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUtil {
	
	public String uploadFile(MultipartFile[] upload, MultipartHttpServletRequest request, int ec_id) {
		
		String saveDir= request.getSession().getServletContext().getRealPath("/resources/assets/img");
		
		if(ec_id == 20)
			saveDir += "/disease";
		else if(ec_id == 30)
			saveDir += "/pest";
		
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
	            return fileList;
		
		return fileList.substring(0, fileList.length() - 1);
		

		
	}
	
	
	
	
	

}
