package com.company.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.company.domain.RegisterVO;
import com.company.mapper.MyPageMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private MyPageMapper mapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		
		log.info("로그인 성공");
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(auth ->{
			roleNames.add(auth.getAuthority());
		});
		
		String name = authentication.getName();
		log.info("login-username : "+name);
		RegisterVO vo = mapper.getId(name);
		session.setAttribute("regist", vo);
		//세션 객체에 유저 정보 담기
		//RegisterVO vo = mapper.getId();
		//session.setAttribute("register", vo);
		
//		log.info("roleNmaes : "+ roleNames);
		
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/");
//			return;
//		}
//		if(roleNames.contains("ROLE_MANAGER")||roleNames.contains("ROLE_MEMBER")) {
//			response.sendRedirect("/");
//			return;
//		}
		response.sendRedirect("/");

	}

}
