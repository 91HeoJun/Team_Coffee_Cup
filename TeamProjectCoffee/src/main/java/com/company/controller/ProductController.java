package com.company.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardFileAttach;
import com.company.domain.Criteria;
import com.company.domain.ProductFileAttach;
import com.company.domain.ProductVO;
import com.company.domain.pageVO;
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
	public String removeProduct(int pcode, Criteria cri, RedirectAttributes rttr) {
		log.info("---- " + pcode + "번 상품 삭제 진행중... ----");

		List<ProductFileAttach> attachList = productService.AttachList(pcode);
		
		if (productService.removeProduct(pcode)) {
			fileDelete(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		
		return "redirect:productList";
	}
	

	// 상품 단일 조회, 상품 수정  
	@GetMapping({"/productDetail", "/productEdit"})
	public void productSelect(int pcode, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("---- 게시글 "+ pcode +"번 상세 페이지로 이동중 ... ----");
		
		ProductVO selectProduct = productService.getProduct(pcode);
		
		model.addAttribute("selectProduct", selectProduct);
	}
	
	@PostMapping("/productEdit")
	public String updatePost(ProductVO product, Criteria cri, RedirectAttributes rttr) {
		log.info("---- 상품 수정 실행중 ... ----" + product);
		
		// 파일 첨부 확인
		if (product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(""+attach));
		}
				
		productService.updateProduct(product);
		
		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());

		return"redirect:productList";
	}
	
	// 상품 전체 리스트
	
	@GetMapping("/productList")
	public void allList(Model model, Criteria cri) {
		log.info("---- 상품 전체 리스트 가져오기 ... ----");
		
		List<ProductVO> list = productService.getProductList(cri);
		
		int total = productService.getProductCnt(cri);
		model.addAttribute("listProduct", list);
		model.addAttribute("pageVO", new pageVO(cri, total));
	}
	
	private void fileDelete(List<ProductFileAttach> attachList) {
		if (attachList == null || attachList.size() <= 0) {
			return;
		}
		
		for (ProductFileAttach attach : attachList) {
			Path path = Paths.get("c:\\ProductUpload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
	
			try {
				Files.deleteIfExists(path);
				if (Files.probeContentType(path).startsWith("image")) {
					Path thumb = Paths.get("c:\\ProductUpload\\", attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
				
					Files.delete(thumb);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
	}
}
