<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<link href="/resources/css/signin.css" rel="stylesheet" />
	<div class="title">
		<h1>${regist.name}님 환영합니다.</h1>
	</div>
	<div class="login">
		<button class="btn btn-primary" id="login" onclick="location.href='/mypage/signin'">
	        로그인
	    </button>
	</div>
	

<%@include file="../footer.jsp" %>
</body>
</html>