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
<div class="row  justify-content-between" style="margin-left: 30px;">
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
	  <label class="btn btn-outline-secondary  ${pageVO.cri.keyword==''?'active':''}" style="color:black;">
	    <input type="radio" name="options" id="option1" value=""> 전체
	  </label>
	  <label class="btn btn-outline-secondary ${pageVO.cri.keyword=='싱글 오리진'?'active':''}" style="color:black;">
	    <input type="radio" name="options" id="option1" value="싱글 오리진"> 싱글 오리진
	  </label>
	  <label class="btn btn-outline-secondary ${pageVO.cri.keyword=='블렌드'?'active':''}" style="color:black;">
	    <input type="radio" name="options" id="option2" value="블렌드"> 블렌드
	  </label>
	  <label class="btn btn-outline-secondary  ${pageVO.cri.keyword=='드립백'?'active':''}" style="color:black;">
	    <input type="radio" name="options" id="option3" value="드립백"> 드립백
	  </label>
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