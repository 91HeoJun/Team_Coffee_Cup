<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<html lang="kr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

<!-- 파비콘 -->
<link rel="shortcut icon" href="/resources/Logo/bean.ico" type="image/x-icon">
<link rel="icon" href="/resources/Logo/img/bean.ico" type="image/x-icon">

	<title>Business Casual - Start Bootstrap Theme</title>
	
	<!-- Bootstrap CDN -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet" />

    <!-- Custom styles for this template -->
<!--     <link href="/resources/css/business-casual.min.css" rel="stylesheet" /> -->
   
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
   
   
  </head>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function () {
    $(".toggle").mouseenter(function(){
        $(".sub").stop().slideUp();
        $(this).find(".sub").slideDown(200);
    })
    $(".toggle").mouseleave(function(){
        $(".sub").stop().slideUp(200);
    })
});
</script>
<script src="/resources/js/topBtn.js"></script>
  <body>
	<div class="all">
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar-static-top" role="navigation" >
            <ul class="nav navbar-top-links navbar-right">
            	<li>
            		<sec:authorize access="isAnonymous()">
						<a class="nav-toggle" href="/mypage/signin">login</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a class="nav-toggle" href="" id="logout">logout</a>
							<form action="/user/logout" method="post" id="logoutForm">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							</form>
						<script>
							$("#logout").click(function(e){
								e.preventDefault();
								$("#logoutForm").submit();
							})
						</script>
					</sec:authorize>
            		<%-- <c:choose>
	            		<c:when test="${empty sessionScope.regist}">
	            			<a class="nav-toggle" href="/mypage/signin">
		                      login
		                    </a>  
	            		</c:when>
	            		<c:otherwise>
	            		 	 ${regist.userid}님
	            			<a class="nav-toggle" href="/user/logout">
		                    	logout
		                    </a>  
	            		</c:otherwise>
            		</c:choose> --%>
            	</li>
                <li>
                    <a class="nav-toggle" href="/mypage/myPageGo">
                        mypage
                    </a>
                </li>
                <li>
                    <a class="nav-toggle" href="/cart/cartList">
                        cart
                    </a>              
                </li>
            </ul>
        </nav>
        <div class="navbar-header">
        	<a href="/"><img class="logo" src="/resources/Logo/blackbeanlogo4.jpg" style="width:200px; hieght:100px;"></a>
        </div>
        <!-- Navigation -->      
      <div id="menu">
      	<ul class="main">
      		<li class="toggle"><a href="/about">소개</a>
      			<ul class="sub">
      				<li><a href="/about">about us</a></li>
      				<li><a href="/coffeeStory">coffee story</a></li>
      			</ul>
      		</li>
      		<li class="toggle"><a href="/product/productList">상품</a>
      			<ul class="sub">
      				<li class='roast'><a href="/product/productList?pageNum=1&amount=10&type=g&keyword=라이트" onmouseover="this.innerText='라이트 로스트'" onmouseout="this.innerText='Light Roast'" data-roast='라이트'>Light Roast</a></li>
      				<li class='roast'><a href="/product/productList?pageNum=1&amount=10&type=g&keyword=미디엄" onmouseover="this.innerText='미디엄 로스트'" onmouseout="this.innerText='Medium Roast'" data-roast='미디엄'>Medium Roast</a></li>
      				<li class='roast'><a href="/product/productList?pageNum=1&amount=10&type=g&keyword=다크" onmouseover="this.innerText='다크 로스트'" onmouseout="this.innerText='Dark Roast'" data-roast='다크'>Dark Roast</a></li>
      			</ul>
      		</li>
      		<li class="toggle"><a href="/store/list">매장</a>
      		</li>
      		<li class="toggle"><a href="/Notice/list">고객센터</a>
      			<ul class="sub">
      				<li><a href="/Notice/list">공지사항</a></li>
      				<li><a href="/FAQ/list">FAQ</a></li>
      				<li><a href="/ClientBoard/list">자유게시판</a></li>
      			</ul>
      		</li>
      	</ul>
      </div>      
   </div><!-- wrapper end -->
        <div id="page-wrapper">   