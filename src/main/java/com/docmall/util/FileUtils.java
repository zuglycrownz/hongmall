package com.docmall.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

public class FileUtils {

	public static String getDateFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		
		String str = sdf.format(date);
		
		
		// 각 OS별로 경로구분자를 변환
		return str.replace("-", File.separator);
	}
	
	public static String uploadFile(String uploadFolder,String dataFolder,MultipartFile uploadFile) {
		
		String realUploadFileName = "";
		
		File file = new File(uploadFolder,dataFolder);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		String clientFileName = uploadFile.getOriginalFilename();
		
		
		UUID uuid = UUID.randomUUID();
		
		realUploadFileName = uuid.toString() + "_" + clientFileName;
		
		
		try {
			//C:/dev/upload/2023/11/02
			File saveFile = new File(file,realUploadFileName);
			//파일복사
			uploadFile.transferTo(saveFile);
			
			if(checkimageType(saveFile)) {
				
				//섬네일파일생성
				FileOutputStream thumbnail = new FileOutputStream(new File(file,"s_" + realUploadFileName));
				
				//원본파일이미지를 스프링식으로해석
				Thumbnailator.createThumbnail(uploadFile.getInputStream(),thumbnail,100,100);
				
				thumbnail.close();
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return realUploadFileName;
	}
	
	private static boolean checkimageType(File saveFile) {
		boolean isImageType = false;
		try {
			String contentType = Files.probeContentType(saveFile.toPath());
			
			isImageType = contentType.startsWith("image");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isImageType;
	}
	
	public static ResponseEntity<byte[]> getFile(String uploadPath,String filename) throws Exception {
		ResponseEntity<byte[]> entity = null;
		
		File file = new File(uploadPath, filename);
		
		//존재여부확인
		if(!file.exists()) {
			return entity;
		}
		
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type",Files.probeContentType(file.toPath()));
		
		entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		return entity;
	}
	
	public static void deleteFile(String uploadPath,String folderName,String fileName) {
		
		
		new File((uploadPath + folderName + "\\" + fileName).replace('\\', File.separatorChar)).delete();
		
		new File((uploadPath + folderName + "\\" + "s_" + fileName).replace('\\', File.separatorChar)).delete();
	}
}
