package com.company.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.activation.MimetypesFileTypeMap;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.FileAttach;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Slf4j
@RequestMapping("/upload/*")
public class FileuploadController {

	/*
	 * 파일 업로드 접근 경로 : /upload/* 
	 * 서버 파일 루트 경로 : g:\\pictures로 설정되어 있음 이후 수정
	 */
	

	@PostMapping(value = "/files", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<FileAttach>> uploadPost(MultipartFile[] uploadFile) {
		log.info("upload 요청");
		
		String uploadFolder="c:\\pictures";
		String uploadFileName=null;
		
		//폴더 생성
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder,uploadFolderPath);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		//첨부파일에 대한 정보를 담을 객체 생성
		List<FileAttach> attachList = new ArrayList<>();
		
		for(MultipartFile f:uploadFile) {
			log.info("-----------------------");
			log.info("upload file name : "+f.getOriginalFilename());
			log.info("upload file size : "+f.getSize());

			//파일명 중복 해결
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString()+"_"+f.getOriginalFilename();
			
			FileAttach attach = new FileAttach();
			attach.setFileName(f.getOriginalFilename());
			attach.setUploadPath(uploadFolderPath);
			attach.setUuid(uuid.toString());
			
			File saveFile = new File(uploadPath, uploadFileName);
			
			try {
				//이미지인지 일반 파일인지 확인
				if(checkImageType(saveFile)) {
					attach.setFileType(true);
					//이미지라면 썸네일로 한번 더 저장
					// g:\\upload\\날짜 폴더, s_uuid_원본파일명.jpg
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					InputStream in = f.getInputStream();
					Thumbnailator.createThumbnail(in, thumbnail, 100, 100);
					in.close();
					thumbnail.close();
				}
				//서버에 저장
				f.transferTo(saveFile);
				attachList.add(attach);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<List<FileAttach>>(attachList, HttpStatus.OK);
	}
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileName){
		File f = new File("c:\\pictures\\"+fileName);
		
		ResponseEntity<byte[]> entity = null;
		
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(f.toPath()));	//mimeType으로 바뀜 : image/jpg
			//다운로드 시 : "Content-Disposition" (!?)
			entity = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(f), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return entity;
	}
	//다운로드
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> download(String fileName) {
		log.info("down load 요청 : "+ fileName);
		
		//파일 이름에 uuid 제거한 이름으로 다운로드하도록
		Resource resource = new FileSystemResource("d:\\upload\\"+fileName);
		String resourceUidName = resource.getFilename();
		String resourceName = resourceUidName.substring(resourceUidName.indexOf("_")+1);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			headers.add("Content-Disposition", "attachment;filename="+new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//서버에서 파일 삭제
	@PostMapping("/deleteFile")
	//fileName : 날짜폴더\파일이름.txt(jpg, png etc)
	//type : image or file(fileName == oriName)
	public ResponseEntity<String> deleteFile(String fileName, String type){
		
		log.info("파일 삭제 : "+fileName+" / "+"타입 : "+type);
		
		try {
			File file = new File("d:\\pictures\\"+URLDecoder.decode(fileName, "utf-8"));
			
			//파일(썸네일, 일반파일) 삭제
			file.delete();
			
			if(type.equals("image")) {
				String oriName = file.getAbsolutePath().replace("s_", "");
				file = new File(oriName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
		
	}

	//서버에 저장한 파일이 이미지인지 일반 파일인지 확인
	private boolean checkImageType(File file) {
//			String contentType = Files.probeContentType(file.toPath());
//			return contentType.startsWith("image");
			MimetypesFileTypeMap m=new MimetypesFileTypeMap();
			m.addMimeTypes("image png jpg jpeg gif");
			return m.getContentType(file).contains("image");
	}

	//날짜에 따라 폴더 생성하기
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();	//시간, 날짜가 길게 나옴
		String str = sdf.format(date);	//연월일 형태로 변경(yyyy-MM-dd)
		return str.replace("-", File.separator);	//폴더 구분 시 사용하는 문자(운영체제에 맞춰 삽입) - windows : \, linux : /
	}	
}
