package com.company.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("---- 인덱스 페이지로 이동중 ... ----");
				
		return "index";
	}
	
	//회사 소개 페이지 추가 : about -은주
	@GetMapping("/about")
	public void about() {
		log.info("소개 페이지 요청");
	}
			
	//회사 소개 페이지 : 커피 이야기 추가 -은주
	@GetMapping("/coffeeStory")
	public void coffeeStory() {
		log.info("커피이야기 페이지 요청");
	}

	//상품 리스트 페이지 - 예진
	@GetMapping("/product")
	public String product() {
		log.info("상품 리스트 페이지 요청");
		return "/productList";
	}
	
	//장바구니 테스트 폼 호출 - 이대우
	@GetMapping("/cart")
	public String cartTest() {
		log.info("장바구니 테스트 폼 출력");
		return "/cartTest";
	}
	
	//장바구니 확인 - 이대우
	@GetMapping("/confirmCart")
	public String cartConfirm() {
		log.info("장바구니 확인");
		return "/cartList";
	}
	
}
