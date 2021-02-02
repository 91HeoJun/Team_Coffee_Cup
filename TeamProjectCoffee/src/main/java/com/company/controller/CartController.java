package com.company.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.CartVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class CartController {
	
	
	//카트에 물건 담기 요청
	@PostMapping("/cart")
	public ResponseEntity<String> inputCart(@RequestBody CartVO cart, HttpSession session) {
		log.info("cart post 요청 : "+cart);

		//재고 유무 확인
		
		//session에 cartList가 없는 경우
		if(session.getAttribute("cartList")==null) {
			List<CartVO> cartList = new ArrayList<CartVO>();
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
		}else {//session에 cartList가 있는 경우
			List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");
			cartList.add(cart);
			session.setAttribute("cartList", cartList);
		}	
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
