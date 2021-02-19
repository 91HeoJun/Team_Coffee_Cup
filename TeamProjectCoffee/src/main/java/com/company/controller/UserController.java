package com.company.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.RegisterVO;
import com.company.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user/*")
public class UserController {
	@Autowired 
	private UserService service;
	 
	@GetMapping("/step1")
	public void agree1() {
		log.info("step1 이용약관---------");
	}
	@PostMapping("/step1")
	public String goStep2(boolean agree,RedirectAttributes rttr) {
		log.info("step2 이동------------");
		
		//사용자가 체크한 값이 없다면 step1 되돌려보내기
		if(!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/user/step1";
		}
		return "/user/step2";
	}
	
	@GetMapping("/step2")
	public void agree2() {
		log.info("step2 이용약관---------");
	}
	@PostMapping("/step2")
	public String agree2(boolean agree,RedirectAttributes rttr) {
		log.info("step2 회원가입 페이지 요청"+agree);
		
		if(!agree) {
			rttr.addFlashAttribute("check", "false");
			return "redirect:/user/step2";
		}
		return "redirect:/user/regist";
	}
	
	 //중복아이디 검사 
	 @ResponseBody //보내는 리턴값은 실제 값임
	 @PostMapping("/checkId") 
	 public String checkId(String userid) {
		 log.info("중복 아이디 검사 요청.."+userid); 
		 
		 RegisterVO dupId=service.selectById(userid); 
		 if(dupId!=null) { 
			 return "false"; 
		 } 
		 return "true"; 
	}
	 
	 @GetMapping("/regist")
	 public void regist() {
		 log.info("회원가입 페이지");
	 }
	 
	 @PostMapping("/regist")
		public String signin(@ModelAttribute("regist")RegisterVO regist) {
			log.info("회원가입 요청"+regist);
			
//			if(service.register(regist)) {
//				log.info("회원가입 완료");
//				return "/user/step3";
//			}else {
//				log.info("회원가입 실패");
//				return "/user/register";
//			}
			//security 적용
			BCryptPasswordEncoder encorder = new BCryptPasswordEncoder();
			String password_encoded = encorder.encode(regist.getPassword());
			log.info("비밀번호 인코딩 : "+password_encoded);
			regist.setPassword(password_encoded);
			if(service.register(regist)) {
				log.info("회원가입 완료");
				return "/user/step3";
			}else {
				log.info("회원가입 실패");
				return "/user/register";
			}
		}

	// @GetMapping("/logout")
	 public String logout(HttpSession session) {
		 log.info("로그아웃-----------");
		 return "/";
	 }
	 
}