package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/store/*")
public class StoreController {
	
	@GetMapping("/store")
	public void storeGet() {
		log.info("매장 페이지 요청");
	}
	
	@GetMapping("/storeAdmin")
	public String storeAdminPage() {
		log.info("매장 관리 페이지 요청");
		return "storeAdmin";
	}
}
