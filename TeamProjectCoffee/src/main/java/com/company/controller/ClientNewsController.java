package com.company.controller;
//뉴스컨트롤러 - 은엽 

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/news/*")
public class ClientNewsController {
	
	@GetMapping("/clientnews")
	public void ClientNews() {
		log.info("---client news---");
	}

}
