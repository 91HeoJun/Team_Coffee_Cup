package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.company.domain.Criteria;
import com.company.domain.ReplyPageVO;
import com.company.domain.ReplyVO;
import com.company.service.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/replies/*")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;

	// 새 댓글
	@PostMapping("/newReply")
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> replyCreate(@RequestBody ReplyVO rep) {
		log.info("---- 댓글 삽입중 ... ----" + rep);
		return replyService.replyAdd(rep)? new ResponseEntity<String>("Add success", HttpStatus.OK):
			new ResponseEntity<String>("Add Fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 단일
	@GetMapping(value="/{rno}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyVO> select(@PathVariable("rno") int rno) {
		
		return new ResponseEntity<ReplyVO>(replyService.get(rno), HttpStatus.OK);
	}

	//전체 댓글
	@GetMapping(value="/pages/{bno}/{page}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<ReplyPageVO> allList(@PathVariable("bno") int bno, @PathVariable("page")int page) {
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<ReplyPageVO>(replyService.getList(cri, bno), HttpStatus.OK);
	}
	
	// 댓글 수정
	@PutMapping("/{rno}")
	@PreAuthorize("principal.username == #rep.replyer")
	public ResponseEntity<String> replyModify(@PathVariable("rno") int rno, @RequestBody ReplyVO rep){
		
		rep.setRno(rno);
		
		return replyService.replyUpdate(rep)? new ResponseEntity<String>("Modify Scuccess", HttpStatus.OK):
			new ResponseEntity<String>("Modify Fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 삭제
	@DeleteMapping("/{rno}")
	@PreAuthorize("principal.username == #vo.replyer")
	public ResponseEntity<String> replyRemove(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		
		return replyService.replyDelete(rno)? new ResponseEntity<String>("Remove Success", HttpStatus.OK):
			new ResponseEntity<String>("Remove Fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
