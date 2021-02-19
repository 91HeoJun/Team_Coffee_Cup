<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<%@ include file="../header.jsp" %>
<!--     Bootstrap core CSS
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    /> -->
    <link href="/resources/css/signin.css" rel="stylesheet" />
    <form class="form-signin" method="post" action="/login">
		<div class="title">
	    	<h1 class="h3 mb-3 font-weight-normal">Login</h1>
	    </div>
      <div class="input">
	      <label for="inputId" class="sr-only">아이디</label>
	      <!-- 이대우 : name : userid -> username -->
	      <input
	        type="text"
	        id="inputId"
	        name="username"
	        class="form-control"
	        placeholder="아이디"
	        required
	        autofocus
	      />
	      <br/>
	      <label for="inputPassword" class="sr-only">비밀번호</label>
	      <input
	        type="password"
	        id="inputPassword"
	        name="password"
	        class="form-control"
	        placeholder="비밀번호"
	        required
	      />
	      <div class="checkbox mb-3">
	        <label>
	          <input type="checkbox" name="remember-me"/> 자동 로그인
	        </label>
	        <!-- <a class="pwSearch navbar-right" href="/user/pwSearch">비밀번호 찾기</a> -->
	      </div>
	      <div>
	        <p style="color: red !important;">${error}</p>
	      </div>
	      <button class="btn btn-lg btn-primary btn-block" type="submit">
	        로그인
	      </button>
	      <button class="btn btn-lg btn-secondary btn-block" onclick ="location.href='/user/step1'">
	        회원가입
	      </button>
	     <!-- security - 이대우 --> 
	     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </div>
    </form>
  </body>
</html>
<script>
$(function(){
	var error ='${error}';
	if(error!=''){
		alert(error);
	}
})
</script>
<%@include file="../footer.jsp" %>
























