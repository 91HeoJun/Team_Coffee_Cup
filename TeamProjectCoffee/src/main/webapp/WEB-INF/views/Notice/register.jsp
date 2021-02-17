<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

		<div class="col-lg-12">
			<h2 class="page-header-detail">공지사항 작성</h2>
		</div>

		<div class="" id="accordionExample">
			<form action="/Notice/register" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">공지사항 제목</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">공지사항 내용</p>
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
				<div class="regist-buttons">
			    	<button type="submit" class="btn btn-outline-success">작성</button>              			
	                <button type="reset" class="btn btn-outline-danger" onclick="location.href='list'">취소</button>       
	            </div>
			</form>
		</div>			
		
<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>

<script src="/resources/js/Notice_js/register.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>