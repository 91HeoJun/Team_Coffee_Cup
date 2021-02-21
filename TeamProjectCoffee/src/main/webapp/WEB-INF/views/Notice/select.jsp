<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

			<h2 class="col-6 sub_tit_wrap h2">공지사항</h2>
		
		<div class="accordion" id="accordionExample">
			<form action="/Notice/register" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">질문 내용</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title" readonly="readonly" value="${selectBoard.title}"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">답변 내용</p>
					</div>
					<div class="card-body">
						<textarea class="form-control" rows="5" name="content" readonly="readonly">${selectBoard.content}</textarea> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingThree">
						<p class="mb-0">작성자</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="writer" readonly="readonly"  value="${selectBoard.writer}">
					</div>
				</div>

			</form>
		</div>	
		
		<div class="row" style="padding-top: 2px;">
				<div class="col order-1" style="text-align: right;">
			<sec:authentication property="principal" var="info"/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${info.username == selectBoard.writer}">
			    <button type="button" class="btn btn-outline-dark" id="modify-button"> 수정 </button>
				</c:if>    
			</sec:authorize>
	            <button type="reset" class="btn btn-outline-dark" id="gotolist-button"> 목록으로 </button>
	        </div>
		</div>
				

			<!-- 이동값 히든폼 -->
			<form action="update" id="myform">
				<input type="hidden" name="bno" value="${selectBoard.bno}" />
				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="type" value="${cri.type}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" />
			</form>

<script>
	var bnoVal = ${selectBoard.bno};
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";	
	
</script>

<script src="/resources/js/Notice_js/select.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>