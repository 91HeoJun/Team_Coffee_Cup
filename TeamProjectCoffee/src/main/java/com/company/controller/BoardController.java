package com.company.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.BoardFileAttach;
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
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void register() {
		log.info("---- 게시글 작성 페이지로 이동중 ... ----");
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String registPost(BoardVO board, RedirectAttributes rttr) {
		log.info("---- 게시글 작성 실행중 ... ----");
		
		if (boardService.regist(board)) {
			log.info("---- 게시글번호 : " +board.getBno()+ " 작성중 ... ----");
			rttr.addFlashAttribute("result", board.getBno());
			return "redirect:list";

		} else {
			return "register";
		}
	}

	@PostMapping("/remove")
	@PreAuthorize("#writer == principal.username")
	public String removePost(int bno, Criteria cri, RedirectAttributes rttr) {
		log.info("---- " + bno + "번 게시물 삭제 진행중... ----");
		
		List<BoardFileAttach> attachList = boardService.AttachList(bno);
		
		if (boardService.remove(bno)) {
			fileDelete(attachList);
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
		
		BoardVO selectBoard = boardService.getRow(bno);
		
		model.addAttribute("selectBoard", selectBoard);
		
	}
	
	@PostMapping("/update")
	@PreAuthorize("#board.writer == principal.username")
	public String updatePost(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("---- 게시글 수정 실행중 ... ----" + board);
		
		// 파일 첨부 확인
		if (board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(""+attach));
		}
		
		boardService.modify(board);

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
		
		List<BoardVO> list = boardService.getList(cri);
		
		int total = boardService.getTotalCnt(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageVO", new pageVO(cri, total));
	
	}
	
	private void fileDelete(List<BoardFileAttach> attachList) {
		if (attachList == null || attachList.size() <= 0) {
			return;
		}
		
		for (BoardFileAttach attach : attachList) {
			Path path = Paths.get("c:\\ClientUpload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
	
			try {
				Files.deleteIfExists(path);
				if (Files.probeContentType(path).startsWith("image")) {
					Path thumb = Paths.get("c:\\ClientUpload\\", attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
				
					Files.delete(thumb);
				}
				
			} catch (IOException e) {
				e.printStackTrace();
			}	
		}
	} // fileDelete
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BoardFileAttach>> getAttachList(int bno){
		return new ResponseEntity<List<BoardFileAttach>>(boardService.AttachList(bno), HttpStatus.OK);
	}
	
	
	@GetMapping("/PG_Test")
	public void PGTest() {
		log.info("PG_Test 호출중 ....");
	};

}
