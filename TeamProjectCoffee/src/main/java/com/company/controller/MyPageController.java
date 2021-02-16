package com.company.controller;
//MyPage- 회원정보 수정, 회원탈퇴 관련 컨트롤러-은주

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.AuthVO;
import com.company.domain.LoginVO;
import com.company.domain.RegisterVO;
import com.company.domain.ChangeVO;
import com.company.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

//정보 수정 요청 : singin(로그인)-> myPageGo(마이페이지 메인)-> changeInfo(수정폼)-> 변경완료시 userInfo(회원상세정보)
//singin(로그인)-> userInfo(회원상세정보)-> changeInfo(수정폼) -> 수정완료
@Controller
@Slf4j
@RequestMapping("/mypage/*")
public class MyPageController {

	@Autowired
	private MyPageService service;
	
	//로그인 - siginin 보여주기
	@GetMapping("/signin")
	public void login() {
		log.info("===login 페이지 요청");
	}
	//로그인 정보(아이디, 비밀번호)를 가져오는 컨트롤러
	@PostMapping("/signin")
	public String loginPost(LoginVO login, HttpSession session, RedirectAttributes rttr) {
		log.info("===로그인 페이지 요청..."+login);
		
		AuthVO auth=service.isLogin(login); //LoginVO AuthVO에 담기
		RegisterVO regist=service.getId(login);
		
		if(auth!=null) {
			session.setAttribute("auth", auth);
			session.setAttribute("regist", regist);
			return "redirect:/";
		}else { //userid,password가 틀려서 로그인을 못한경우
			rttr.addFlashAttribute("error","입력한 정보가 일치 하지 않습니다.\n 다시 시도해주세요.");	
			return "redirect:signin";
		}
	}
	
	@GetMapping("/myPageGo")
	public String myPageGo(HttpSession session) {
		log.info("===마이페이지 요청...");

		RegisterVO regist =(RegisterVO) session.getAttribute("regist");
		if(regist!=null) { //로그인 정보가 있을경우 마이페이지 메인
			return "/mypage/myPageGo";
		}else { //로그인 정보가 없을경우 로그인페이지로 이동
			return "redirect:signin";
		}
	}
	
	//마이 페이지 메인 보여주기-(회원상세정보)
	@GetMapping("/userInfo")
	public void userInfo() {
		log.info("===회원정보페이지 보여주기");
	}
	

	//회원탈퇴 폼 보여주기
	@GetMapping("/leave")
	public void leaveGet() {
		log.info("회원탈퇴 폼 보여주기");
	}
	
	//회원탈퇴 - 회원삭제하고 성공하면 세션해제후 index이동
	@PostMapping("/leave")
	public String leavePost(LoginVO login, HttpSession session) {
		log.info("회원탈퇴 요청"+login);
		
		if(service.leave(login)) { //비밀번호가 맞은경우
			//auth : userid, name
			session.invalidate();
			return "redirect:/";
		}else { //비밀번호가 틀린경우
			return "redirect:leave";
		}
	}
	//회원정보 수정 폼 보여주기
	@GetMapping("/changeInfo")
	public void changeInfo() {
		log.info("회원정보 수정 폼 보여주기");
	}
	
	@PostMapping("/changeInfo")
	public String changePost(ChangeVO change,@SessionAttribute AuthVO auth,LoginVO login,HttpSession session,RedirectAttributes rttr) {
		//회원정보 수정 - change(password, new_password, confirm_password)
		log.info("회원정보 수정"+change);
		//userid 세션에서 가져와서 change에 담기
		change.setUserid(auth.getUserid());
		
		//service에 회원정보 변경 요청
		if(service.update(change)) {//성공 => 회원상세정보 페이지 이동
//			session.invalidate();
			RegisterVO regist=service.getId(login);
			session.setAttribute("regist", regist);
			return "redirect:userInfo";
		}else {//실패 => 회원정보 변경 폼 보여주기
			rttr.addFlashAttribute("error","입력한 정보가 틀립니다!!");				
		} return "redirect:changeInfo";	
	}
	
	
}
