<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>

<!-- css 따로 뺴서 반영할것. / header, footer includ 완료 -->
<link href="/resources/css/business-casual.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/board.css" />

	<!-- 상품 종류별 리스트 -->
	<div class="btn-group btn-group-toggle" data-toggle="buttons">
	  <label class="btn btn-secondary active">
	    <input type="radio" name="options" id="option1" checked> 싱글 오리진
	  </label>
	  <label class="btn btn-secondary">
	    <input type="radio" name="options" id="option2"> 블렌드
	  </label>
	  <label class="btn btn-secondary">
	    <input type="radio" name="options" id="option3"> 드립백
	  </label>
	</div>