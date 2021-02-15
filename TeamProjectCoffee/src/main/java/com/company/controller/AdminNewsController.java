package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.NewsVO;
import com.company.domain.pageVO;
import com.company.service.BoardService;
import com.company.service.NewsService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping
public class AdminNewsController {

	@Autowired
	private NewsService newsService;
	
	@GetMapping("/adminnews/regist")
	public void newsRegist() {
		log.info("----admin뉴스작성페이지----");
	}
	
	@PostMapping("/adminnews/regist")
	public String registPost(NewsVO news, RedirectAttributes rttr) {
		log.info("----admin뉴스 등록----");
		newsService.insertNews(news);
		rttr.addFlashAttribute("result","regSuccess");
		
		return "redirect:/adminnews";

	}

	@PostMapping("/adminnews/remove")
	public String removePost(int newsno,  RedirectAttributes rttr) {
		log.info("----" + newsno + "번 게시물 삭제----");
		
		newsService.deleteNews(newsno);
		rttr.addAttribute("result", "modSuccess");
		
		return "redirect:/adminnews";
	}
	
	@GetMapping("/adminnews/read")
	public String modifyGet(@RequestParam("newsno") int newsno, Model model) {
		log.info("----게시글"+ newsno +"번 상세 페이지로 이동중----");
				
		model.addAttribute("result",newsService.detailNews(newsno));
		return "/adminnews/modify";
		
	}
	
	@PostMapping("/adminnews/modify")
	public String updatePost(NewsVO news, RedirectAttributes rttr) {
		log.info("---- 게시글 수정 실행중 ... ----" );
		
		newsService.updateNews(news);

		rttr.addFlashAttribute("result", "modSuccess");		
		return"redirect:/adminnews";
	}

	@GetMapping("/adminnews")
	public String newsList(Model model) {
		log.info("----admin 뉴스 리스트----");
				
		model.addAttribute("list", newsService.listNews());
		return "/adminnews/list";
	
	}

}