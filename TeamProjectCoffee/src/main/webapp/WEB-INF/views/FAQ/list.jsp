<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="FAQHeader.jsp" %>

		<div class="col-md-8">
			<button id='regBtn' type="button" class="btn btn-outline-dark" onclick="location.href='register'">문의글 작성</button>
		</div>
		
		<div class="accordion" id="accordionExample">
			<c:forEach var="faqVO" items="${list}">
			  <div class="card">
			    <div class="card-header" id="headingOne">
			      <h2 class="mb-0">
			        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			          ${faqVO.title}
			        </button>
			      </h2>
			    </div>
			
			    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
			      <div class="card-body">
			        ${faqVO.content}
			      </div>
			    </div>
			  </div>
			</c:forEach>
		  
		</div>

<script src="/resources/js/Board_js/faqList.js"></script>
<%@include file="FAQFooter.jsp" %>