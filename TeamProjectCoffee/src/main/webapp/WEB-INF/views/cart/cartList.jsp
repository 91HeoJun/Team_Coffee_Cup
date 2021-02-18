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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
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
   
  </head>

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
						<a class="nav-toggle" href="/user/logout">logout</a>
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
                    <a class="nav-toggle" href="/cart">
                        cart
                    </a>              
                </li>
            </ul>
        </nav>
        <div class="navbar-header">
        	<a href="/"><img class="logo" src="/resources/Logo/blackbeanlogo4.jpg" style="width:200px; hieght:100px;"></a>
        </div>
 
<div class="container" style="margin-top:70px">
<h1 style="font-family: 'Black Han Sans', sans-serif; font-size:30px;" >장바구니</h1>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">상품코드</th>
	      <th scope="col">상품이름</th>
	      <th scope="col">가격</th>
	      <th scope="col">수량</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:forEach items="${cartList}" var="cart">
	    <tr>
	      <td scope="row"><c:out value="${cart.pcode}"></c:out></td>
	      <td><c:out value="${cart.product}"></c:out></td>
	      <td><c:out value="${cart.price}"></c:out></td>
	      <td><c:out value="${cart.price}"></c:out></td>
	    </tr>	
	</c:forEach>
	 </tbody>
</table>
	<div>
		<button type="button" class="btn btn-outline-secondary">결제하기</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/product/productList'">쇼핑 계속하기</button>
	</div>
</div>
<script>
$(function(){
	$("button").click(function(){
		location.href="/cart";
	})
})
</script>
<%@include file="../footer.jsp" %>