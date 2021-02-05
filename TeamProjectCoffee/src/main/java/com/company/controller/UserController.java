package com.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.domain.RegisterVO;
import com.company.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/user/*")
public class UserController {
	@Autowired 
	private UserService service;
	 
	@GetMapping("/regist")
	public void login() {
		log.info("회원가입 페이지");
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
	 
	 @PostMapping("/signin")
		public String signin(@ModelAttribute("regist")RegisterVO regist) {
			log.info("회원가입 요청"+regist);
			
			if(service.register(regist)) {
				log.info("회원가입 완료");
				return "/user/step3";
			}else {
				log.info("회원가입 실패");
				return "register";
			}
		}
	
}
