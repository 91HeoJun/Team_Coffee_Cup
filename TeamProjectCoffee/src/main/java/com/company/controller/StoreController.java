package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class StoreController {
	
	@GetMapping("/store")
	public void storeGet() {
		log.info("매장 페이지 요청");
	}
}
