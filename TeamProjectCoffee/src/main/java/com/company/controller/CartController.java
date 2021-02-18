package com.company.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.CartVO;
import com.company.domain.ProductVO;
import com.company.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private ProductService service;
	
	//카트에 물건 담기 요청
	@PostMapping("/insert")
	@ResponseBody
	public String inputCart(@RequestBody CartVO cart, HttpSession session) {
		log.info("cart post 요청 : "+cart);

		//재고 유무 확인
		//1) 재고 데이터 가져오기
		ProductVO product =  service.getProduct(cart.getPcode());
		log.info("product : "+product);
//		if(cart.getAmount()>product.getPAmount()) {
//			return "fail";
//		}
		
		//session에 cartList가 없는 경우
		if(session.getAttribute("cartList")==null) {
			List<CartVO> cartList = new ArrayList<CartVO>();
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
		}else {//session에 cartList가 있는 경우
			//장바구니 리스트를 가져옴
			List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");
			//장바구니 리스트에 CartVO를 추가함
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
		}	
		return "success";
	}
	
	@GetMapping("/cartList")
	public void cartForm(){
		//return "cartList";
		log.info("---------------카트 페이지 요청------------");		
	}
	
}
