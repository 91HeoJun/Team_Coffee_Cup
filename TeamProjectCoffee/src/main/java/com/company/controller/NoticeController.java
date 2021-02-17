package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.pageVO;
import com.company.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	@GetMapping("/register")
	public void register() {
		log.info("---- 게시글 작성 페이지로 이동중 ... ----");
	}
	
	@PostMapping("/register")
	public String registPost(BoardVO board, RedirectAttributes rttr) {
		log.info("---- 게시글 작성 실행중 ... ----");
		
		if (noticeService.regist(board)) {
			log.info("---- 게시글번호 : " +board.getBno()+ " 작성중 ... ----");
			rttr.addFlashAttribute("result", board.getBno());
			return "redirect:list";

		} else {
			return "register";
		}
	}

	@PostMapping("/remove")
	public String removePost(int bno, Criteria cri, RedirectAttributes rttr) {
		log.info("---- " + bno + "번 게시물 삭제 진행중... ----");
		
		if (noticeService.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		return "redirect:list";
	}
	
	@GetMapping({"/select", "/update"})
	public void selectForm(int bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("---- 게시글 "+ bno +"번 상세 페이지로 이동중 ... ----");
		
		BoardVO selectBoard = noticeService.getRow(bno);
		
		model.addAttribute("selectBoard", selectBoard);
		
	}
	
	@PostMapping("/update")
	public String updatePost(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("---- 게시글 수정 실행중 ... ----" + board);
		
		// 파일 첨부 확인
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		noticeService.modify(board);

		rttr.addFlashAttribute("result", "success");
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		return"redirect:list";
	}

	@GetMapping("/list")
	public void allList(Model model, Criteria cri) {
		log.info("---- 전체 리스트 가져오기 ... ----" + cri);
		
		List<BoardVO> list = noticeService.getList(cri);
		
		int total = noticeService.getTotalCnt(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new pageVO(cri, total));
	
	}
		
	
	
}
