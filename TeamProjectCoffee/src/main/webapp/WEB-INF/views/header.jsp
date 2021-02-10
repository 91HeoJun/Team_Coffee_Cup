<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<html lang="kr">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />

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
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/">Logo</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	<li>
            		<c:choose>
	            		<c:when test="${sessionScope.userid eq null}">
	            			<a class="dropdown-toggle" href="/mypage/signin">
		                       login
		                    </a>  
	            		</c:when>
	            		<c:otherwise>
	            			<a class="dropdown-toggle" href="/user/logout">
		                       logout
		                    </a>  
	            		</c:otherwise>
            		</c:choose>
            	</li>
                <li >
                    <a class="dropdown-toggle" href="/mypage/myPageGo">
                        mypage
                    </a>
                </li>
                
                <li >
                    <a class="dropdown-toggle" href="#">
                        cart
                    </a>
                   
                </li>
            </ul>
            <!-- /.navbar-static-side -->
        </nav>
        <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
      <div class="container">
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link dropdown-toggle active dropdown-toggle" href="/about" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">소개</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="/about">about us</a></li>
            <li><a class="dropdown-item" href="/coffeeStory">coffee story</a></li>
            <li><a class="dropdown-item" href="#">recipe</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link dropdown-toggle dropdown-toggle" href="/product/productList" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">상품</a>
       	  <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">라이트 </a></li>
            <li><a class="dropdown-item" href="#">미디엄 </a></li>
            <li><a class="dropdown-item" href="#">다크</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/store/list">매장</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle dropdown-toggle" href="/news/news" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            소식
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">공지사항</a></li>
            <li><a class="dropdown-item" href="#">이벤트</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link dropdown-toggle dropdown-toggle" href="/ClientBoard/list" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">고객</a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="#">FAQ</a></li>
            <li><a class="dropdown-item" href="#">1:1</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
        </div>
      </div>
    </nav>
        
      <div id="menu">
      	<ul class="main">
      		<li class="toggle"><a href="#">소개</a>
      			<ul class="sub">
      				<li><a href="/about">about us</a></li>
      				<li><a href="/coffeeStory">coffee story</a></li>
      				<li><a href="#">recipe</a></li>
      			</ul>
      		</li>
      		<li class="toggle"><a href="#">상품</a>	
      		</li>
      		<li class="toggle"><a href="/store/list">매장</a>
      		</li>
      		<li class="toggle"><a href="/news/news">소식</a>
      			<ul class="sub">
      				<li><a href="#">공지사항</a></li>
      				<li><a href="#">이벤트</a></li>
      			</ul>
      		</li>
      		<li class="toggle"><a href="/ClientBoard/list">고객</a>
      			<ul class="sub">
      				<li><a href="#">FAQ</a></li>
      				<li><a href="#">1:1</a></li>
      			</ul>
      		</li>
      	</ul>
      </div>      
   </div>
        <div id="page-wrapper">
     
       