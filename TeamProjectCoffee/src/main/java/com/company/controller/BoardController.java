package com.company.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardVO;
import com.company.domain.Criteria;
import com.company.domain.pageVO;
import com.company.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ClientBoard/*")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시글 작성 - 완료 --------------------------------------------------------------
	@GetMapping("/register")
	public void register() {
		log.info("---- 게시글 작성 페이지로 이동중 ... ----");
	}
	
	@PostMapping("/register")
	public String registPost(BoardVO board, RedirectAttributes rttr) {
		log.info("---- 게시글 작성 실행중 ... ----");
		
		if (boardService.regist(board)) {
			log.info("---- 게시글번호 : " +board.getBno()+ " 작성중 ... ----");
			rttr.addFlashAttribute("result", board.getBno());
			return "redirect:list";

		} else {
			log.info("***** ---- 게시글 입력 실패 ---- *****");
			return "register";
		}
	}
	
	// -----------------------------------------------------------------------
	// 게시글 삭제 --------------------------------------------------------------
	
	@PostMapping("/remove")
	public String removePost(int bno) {
		log.info("---- " + bno + "번 게시물 삭제 진행중... ----");
		boardService.remove(bno);
		
		return "redirect:list";
	}
	
	
	// -----------------------------------------------------------------------
	// 게시글 수정, 게시글 단일 조회 폼  ----------------------------------------------
	@GetMapping({"/select", "/update"})
	public void selectForm(int bno, Model model) {
		log.info("---- 게시글 "+ bno +"번 상세 페이지로 이동중 ... ----");
		
		BoardVO selectBoard = boardService.getRow(bno);
		
		model.addAttribute("selectBoard", selectBoard);
		
	}
	
	@PostMapping("/update")
	public String updatePost(BoardVO board, RedirectAttributes rttr) {
		log.info("---- 게시글 수정 실행중 ... ----" + board);
		
		boardService.modify(board);

		return"redirect:list"; // read로 갈 경우도 생각중.
		
	}
	
		
		
		
		
	
	
	
	
	// -----------------------------------------------------------------------
	// 게시글 전체 조회 - 2차 완료 -----------------------------------------------------------
	
	@GetMapping("/list")
	public void allList(Model model, Criteria cri) {
		log.info("---- 전체 리스트 가져오기 ... ----");
		
		List<BoardVO> list = boardService.getList(cri);
		
		int total = boardService.getTotalCnt(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new pageVO(cri, total));
	
	}
	
	// -----------------------------------------------------------------------
	//  -----------------------------------------------------------
	
	
	
	
	// -----------------------------------------------------------------------

}
