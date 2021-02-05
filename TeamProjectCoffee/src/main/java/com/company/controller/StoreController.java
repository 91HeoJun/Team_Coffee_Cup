package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "store/store";
	}
	
	@GetMapping("/admin")
	public String storeAdminPage() {
		log.info("매장 관리 페이지 요청");
		return "store/storeAdmin";
	}
	
	//매장 관리 컨트롤
	//매장 등록
	@PostMapping("/add")
	public String storeAdd(StoreVO store) {
		log.info("매장 추가 요청 : "+store);
		
		//매장 등록 쿼리문 실행
		service.insert(store);
		
		return "store/list";
	}
}
