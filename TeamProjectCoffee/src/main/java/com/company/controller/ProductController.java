package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.Criteria;
import com.company.domain.ProductVO;
import com.company.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// 상품 입력
	@GetMapping("/productRegister")
	public void productInsert() {
		log.info("---- 상품 입력 페이지로 이동중 ... ----");
	}
	
	@PostMapping("/productRegister")
	public String insertProduct(ProductVO product, RedirectAttributes rttr) {
		log.info("---- 상품 입력 실행중 ... ----"+product);
		
		
		
		if (productService.insertProduct(product)) {
			log.info("---- 상품 코드 : " +product.getPcode()+ " 입력중 ... ----");
			rttr.addFlashAttribute("result", product.getPcode());
			return "redirect:productList";

		} else {
			log.info("***** ---- 상품 입력 실패 ---- *****");
			return "productRegister";
		}
	}
	
	// 상품 삭제 	
	@PostMapping("/remove")
	public String removeProduct(int pcode) {
		log.info("---- " + pcode + "번 상품 삭제 진행중... ----");
		productService.removeProduct(pcode);
		
		return "redirect:productList";
	}
	
	
	
	// 상품 단일 조회, 상품 수정  
	@GetMapping({"/productDetail", "/productEdit"})
	public void productSelect(int pcode, Model model) {
		log.info("---- 게시글 "+ pcode +"번 상세 페이지로 이동중 ... ----");
		
		ProductVO selectProduct = productService.getProduct(pcode);
		
		model.addAttribute("selectProduct", selectProduct);
	}
	
	@PostMapping("/productEdit")
	public String updatePost(ProductVO product, RedirectAttributes rttr) {
		log.info("---- 상품 수정 실행중 ... ----" + product);
		
		productService.updateProduct(product);

		return"redirect:productList";
	}
	
	// 상품 전체 리스트
	
	@GetMapping("/productList")
	public void allList(Model model, Criteria cri) {
		log.info("---- 상품 전체 리스트 가져오기 ... ----");
		
		List<ProductVO> list = productService.getProductList(cri);
		model.addAttribute("listProduct", list);
	}
}
