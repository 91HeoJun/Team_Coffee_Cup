package com.company.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.FileAttach;
import com.company.domain.StoreVO;
import com.company.service.StoreService;

import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Slf4j
@RequestMapping("/store/*")
public class StoreController {

	@Autowired
	private StoreService service;

	@GetMapping("/list")
	public String storeGet(Model model) {
		log.info("매장 페이지 요청");
		
		//매장 페이지 불러올 때 매장 리스트 가져오기
//		List<StoreVO> list = service.getAll();
//		model.addAttribute("list", list);
		
		return "/store/store";
	}
	
	@GetMapping("/getStore")
	public ResponseEntity<StoreVO> getStoreInfo(int code) {
		log.info("개별 매장 정보 요청");
		return new ResponseEntity<StoreVO>(service.getRow(code), HttpStatus.OK);
	}

	/* @Secured("ROLE_ADMIN") */
	@GetMapping("/admin")
	public String storeAdminPage(Model model) {
		log.info("매장 관리 페이지 요청");
		
		List<StoreVO> list = service.getAll();
		model.addAttribute("list", list);
		
		
		
		return "/store/storeAdmin";
	}

	// 매장 관리 컨트롤
	// 매장 등록
	@Secured("ROLE_ADMIN")
	@PostMapping("/add")
	public String storeAdd(StoreVO store) {
		log.info("매장 추가 요청 : " + store);

		// 파일첨부 확인
		if (store.getAttachList() != null) {
			store.getAttachList().forEach(attach -> log.info("" + attach));
		}
		log.info("게시글 번호 : " + store.getCode());
		if (service.insert(store)) {
			return "redirect:/store/admin";
		}
		return "/store/admin";
	}
	
	//첨부물 목록 보내주기
	@GetMapping("/getAttachList")
	public ResponseEntity<List<FileAttach>> getAttachList(int code){
		return new ResponseEntity<List<FileAttach>>(service.getAttachList(code), HttpStatus.OK);
	}
	
	//매장 삭제
	@Secured("ROLE_ADMIN")
	@DeleteMapping(value = "/{code}")
	public ResponseEntity<String> deleteStore(@PathVariable int code) {
		
		List<FileAttach> attachList =service.getAttachList(code);
		// 성공하면 리스트 보여주기
		if(service.delete(code)) {//②데이터베이스 삭제(게시물, 첨부물)
			deleteFiles(attachList);
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
		return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
	}
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/modify")
	public String modify(StoreVO store) {
		log.info("매장 수정 " + store); // 동일한 경로의 post로 이동시 : get에서 받은 데이터 유지 cri != null

		// 파일첨부 확인
		if (store.getAttachList() != null) {
			store.getAttachList().forEach(attach -> log.info("" + attach));
		}

		service.modify(store);
		
		return "redirect:/store/admin";
	}
	
	//첨부물 삭제
	private void deleteFiles(List<FileAttach> attachList) {
		log.info("첨부물 삭제 : "+attachList);
		
		if(attachList == null || attachList.size() <=0) {
			return;
		}
		for(FileAttach attach:attachList) {
			Path path = Paths.get("d:\\pictures\\", attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
			
			//일반 파일, 이미지 원본 파일 삭제
			try {
				Files.deleteIfExists(path);
				
				if(Files.probeContentType(path).startsWith("image")) {
					Path thumb = Paths.get("d:\\\\pictures\\", attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumb);
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//ajax : 매장 리스트 가져오기
	
	  @GetMapping(value = "/storeList", produces =
	  MediaType.APPLICATION_JSON_UTF8_VALUE) public ResponseEntity<List<StoreVO>>
	  getStoreList() {
	  
	  List<StoreVO> list = service.getAll();
	  
	  return new ResponseEntity<List<StoreVO>>(list, HttpStatus.OK); }
	 
}
