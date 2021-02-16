package com.company.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.info("로그인 성공");
		List<String> roleNames = new ArrayList<>();
		authentication.getAuthorities().forEach(auth ->{
			roleNames.add(auth.getAuthority());
		});
		
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
