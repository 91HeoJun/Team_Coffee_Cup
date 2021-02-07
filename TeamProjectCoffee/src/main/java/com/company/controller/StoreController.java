package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String storeGet() {
		log.info("매장 페이지 요청");
		return "/store/store";
	}

	@GetMapping("/admin")
	public String storeAdminPage(Model model) {
		log.info("매장 관리 페이지 요청");
		
		List<StoreVO> list = service.getAll();
		model.addAttribute("list", list);
		
		return "/store/storeAdmin";
	}

	// 매장 관리 컨트롤
	// 매장 등록
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
	
	@GetMapping("/getAttachList")
	public ResponseEntity<List<FileAttach>> getAttachList(int code){
		return new ResponseEntity<List<FileAttach>>(service.getAttachList(code), HttpStatus.OK);
	}

}
