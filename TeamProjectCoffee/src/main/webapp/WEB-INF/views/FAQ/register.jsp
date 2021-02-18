<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

		<h2 class="col-4 sub_tit_wrap h2">자주하는 질문 - 작성</h2>

		<div class="" id="accordionExample">
			<form action="/FAQ/register" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">자주하는 질문 내용</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">질문 답변</p>
					</div>
					<div class="card-body">
						<textarea class="form-control" rows="5" name="content"></textarea> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingThree">
						<p class="mb-0">작성자</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="writer" value='<sec:authentication property="principal.member.userid"/>' readonly>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		</div>
			<div class="row">
				<div class="col order-1" style="text-align: right;">
					<div class="regist-buttons">
				    	<button type="submit" class="btn btn-outline-secondary">작성</button>              			
		                <button type="reset" class="btn btn-outline-secondary" onclick="location.href='list'">취소</button>       
		            </div>
	            </div>
		</div>			
		
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>

<script src="/resources/js/FAQ_js/register.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>