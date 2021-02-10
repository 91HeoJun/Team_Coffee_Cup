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
    <form class="form-signin" method="post">
		<div class="title">
	    	<h1 class="h3 mb-3 font-weight-normal">Login</h1>
	    </div>
      <div class="input">
	      <label for="inputId" class="sr-only">아이디</label>
	      <input
	        type="text"
	        id="inputId"
	        name="userid"
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
	        <label id="remember">
	          <input type="checkbox" value="remember-me" /> 아이디 저장
	        </label>
	      </div>
	      <div>
	        <p style="color: red;">${error}</p>
	      </div>
	      <button class="btn btn-lg btn-primary btn-block" type="submit">
	        로그인
	      </button>
	      <button class="btn btn-lg btn-secondary btn-block" onclick ="location.href='/user/step1'">
	        회원가입
	      </button>
      </div>
    </form>
  </body>
</html>
<%@include file="../footer.jsp" %>