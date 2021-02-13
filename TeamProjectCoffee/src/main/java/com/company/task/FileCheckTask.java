package com.company.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.company.domain.FileAttach;
import com.company.mapper.StoreAttachMapper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileCheckTask {
	//어제 날짜의 폴더를 알아낸 후 매일 새벽 2시에 자동으로 도는 프로그램
	//데이터베이스에서 파일 리스트를 가져와서 현재 서버의 upload 폴더와 비교한 후
	//데이터베이스와 일치하지 않은 파일 제거
	
	@Autowired
	private StoreAttachMapper mapper;
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		
//		c.add(Calendar.DATE, -1);
		c.add(Calendar.DATE, 0);
		String str = sdf.format(c.getTime());
		
		return str.replace("-", File.separator);
	}
	
	
	@Scheduled(cron = "* * 2 * * *")
	public void checkFiles() {
		log.warn("File Check Task run....");
		
		//어제 날짜의 파일 정보 데이터베이스에서 가져오기
		//DB -(전일 파일 리스트)-> list
		List<FileAttach> fileList = mapper.getOldFiles();
		//list -> stream
		Stream<FileAttach> stream = fileList.stream();
		//stream -> Path stream
		Stream<Path> filePath = stream.map(vo -> Paths.get("d:\\pictures", vo.getUploadPath(), vo.getUuid()+"_"+vo.getFileName()));
		//Path stream -> Path list
		List<Path> fileListPath = filePath.collect(Collectors.toList());
		filePath.close();
		stream.close();
		//일단 보이는 Stream 다 닫기 -> 새로 생성 -> 썸네일 주소 입력
		// -> fileListPath에 합쳐주기
		Stream<FileAttach> stream1 = fileList.stream();
		Stream<Path> filePath1 = stream1.map(vo -> Paths.get("d:\\pictures", vo.getUploadPath(), "s_"+vo.getUuid()+"_"+vo.getFileName()));
		fileListPath.addAll(filePath1.collect(Collectors.toList()));
		//map() : 스트림의 요소에 저장된 값 중에서 원하는 필드만 추출하거나 특정 형태로 변환시 사용
		//List 구조를 stream 으로 변경(병렬 처리(빠른 속도) / 필터링 / 합계, 평균, 매핑과 같은 중간 집계)
		//결론 : list -> Path list / stream 사용 :속도면 이점 
		//람다식 : jdk_8부터
		
		//Path list 확인
		fileListPath.forEach(p -> log.warn(""+p));
		
		File targetDir = Paths.get("d:\\pictures", getFolderYesterDay()).toFile();
		File[] removeFiles = targetDir.listFiles(file -> fileListPath.contains(file.toPath())==false);
		
		for(File file:removeFiles) {
			log.warn(file.getAbsolutePath());
			file.delete();
		}
	}
}
