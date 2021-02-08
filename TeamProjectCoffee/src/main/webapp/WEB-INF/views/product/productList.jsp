<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>
<!-- 
<!DOCTYPE html> -->
<html lang="en">

<head>

<!--   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Business Casual - Start Bootstrap Theme</title>

  Bootstrap core CSS
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  Custom fonts for this template
  <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

  Custom styles for this template
  <link href="css/business-casual.min.css" rel="stylesheet"> -->

</head>

<!--  
<body>
 -->
<div class="panel-heading">
	<button id='regBtn' type="button" class="btn btn-warning" onclick="location.href='productRegister'">상품 등록</button>
</div>
<div class="row row-cols-1 row-cols-md-2">
<c:forEach var="vo" items="${listProduct}">
 <div class="col mb-4">
    <div class="card">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${vo.product}</h5>
        <p class="card-text">
        ${vo.pcontent} <br/>
        ${vo.origin } <br/>
		<fmt:formatDate value="${vo.pdate}" pattern="yyyy-MM-dd"/> <br/>
		${vo.price} <br/>
		</p>
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button>
      </div>
    </div>
  </div>
</c:forEach>
</div>

<%-- <div class="row row-cols-1 row-cols-md-2">

  <div class="col mb-4">
    <div class="card">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${vo.product}</h5>
        <p class="card-text">
        ${vo.pContent}
		${vo.pDate}
		${vo.price}
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button></p>
      </div>
    </div>
  </div>
  
  <div class="col mb-4">
    <div class="card">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${vo.product}</h5>
        <p class="card-text">
        ${vo.pContent}
		${vo.pDate}
		${vo.price}
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button></p>
      </div>
    </div>
  </div>
  
  <div class="col mb-4">
    <div class="card">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${vo.product}</h5>
        <p class="card-text"> 
        ${vo.pContent}
		${vo.pDate}
		${vo.price}
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button></p>
      </div>
    </div>
  </div>
  
  <div class="col mb-4">
    <div class="card">
      <img src="..." class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title">${vo.product}</h5>
        <p class="card-text">
        ${vo.pContent}
		${vo.pDate}
		${vo.price}
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button></p>
      </div>
    </div>
  </div>
  
</div> --%>


<!--   <footer class="footer text-faded text-center py-5">
    <div class="container">
      <p class="m-0 small">Copyright &copy; Your Website 2020</p>
    </div>
  </footer> -->

<%@include file="../footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- </body>
 -->
</html>
