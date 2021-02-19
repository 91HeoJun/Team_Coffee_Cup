<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<style>
	.btn-outline-secondary{
		color:"black";
	}
</style>
<!-- css 따로 뺴서 반영할것. / header, footer includ 완료 -->
<!-- <link href="/resources/css/business-casual.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>

<!-- 상품 종류별 리스트 -->
<div class="row  justify-content-between" style="margin-left: 80px; margin-right:50px;">
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
	  <button type="button" name="options" id="option1" value="" class="btn btn-outline-dark"> 전체</button>
	  <button type="button" name="options" id="option2" value="싱글 오리진" class="btn btn-outline-dark"> 싱글 오리진</button>
	  <button type="button" name="options" id="option3" value="블렌드" class="btn btn-outline-dark"> 블렌드</button>
	  <button type="button" name="options" id="option4" value="드립백" class="btn btn-outline-dark"> 드립백</button>
	
	</div>
	<div style="margin-right: 30px;">
		 <sec:authentication property="principal" var="info"/>
		 <sec:authorize access="isAuthenticated()">
			<c:if test="${info.username == 'testadmin'}">	
				<button id='regBtn' type="button" class="btn btn-outline-danger" onclick="location.href='productRegister'">상품 등록</button> 
			</c:if>
		 </sec:authorize>
		 <div class="btn-group btn-group-toggle">  
		  <!-- <label class="btn btn-outline-secondary">
		    <input type="radio" name="options" id="cart" value="cart">장바구니 가기
		  </label>	 -->  
		  <button class="btn btn-outline-secondary" style="color:black;" id="cart">장바구니 가기</button>
		</div>
	</div>	
</div>