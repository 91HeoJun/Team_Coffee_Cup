<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>

<div class="panel-heading">
	<button id='regBtn' type="button" class="btn btn-warning" onclick="location.href='productRegister'">상품 등록</button>
</div>
	<div class="row row-cols-1 row-cols-md-2">
	
		<c:forEach var="vo" items="${listProduct}">
			<div class="col mb-4">
		    <div class="card">
		    <img src="..." class="card-img-top" alt="...">
		    <div>
		    <a href="${vo.pCode}" class="move">${vo.pCode}</a>
		    <h5 class="card-title">${vo.product}</h5>
		    <p class="card-text">
		        ${vo.pcontent} <br/>
		        ${vo.origin } <br/>
				로스팅(제조)일: <fmt:formatDate value="${vo.pdate}" pattern="yyyy-MM-dd"/> <br/>
				${vo.price} <br/>
			</p>
			</div>
			<button type="button" class="btn btn-outline-primary">장바구니 담기</button>
			</div>
			</div>
		</c:forEach>
	</div>
	
<%-- 		<c:forEach var="vo" items="${listProduct}">
		 <div class="col mb-4">
		    <div class="card">
		      <a href="" class="move"> <img src="..." class="card-img-top" alt="...">
		      <div class="card-body"> 
		        
		        <p class="card-text">
		        ${vo.pcontent} <br/>
		        ${vo.origin } <br/>
				로스팅(제조)일: <fmt:formatDate value="${vo.pdate}" pattern="yyyy-MM-dd"/> <br/>
				${vo.price} <br/>
				</p> </a>
				<button type="button" class="btn btn-outline-primary">장바구니 담기</button>
				</div>
			</div>
			</div>
		</c:forEach>
	</div> --%>
	
 	<form action="" id="actionForm">

<%--  		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		<input type="hidden" name="type" value="${pageVO.cri.type}" />
		<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" /> --%>
	</form>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="/resources/js/Product_js/productList.js"></script>

<%@include file="../footer.jsp" %>
