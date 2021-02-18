<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>


		<div class="row justify-content-between">
			<h2 class="col-6 sub_tit_wrap h2"> 자유 게시판 - 수정</h2>
	    </div>
		<div class="accordion" id="accordionExample">
			<form action="" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">${selectBoard.bno}번 글 제목</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title" value="${selectBoard.title}"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">내용</p>
					</div>
					<div class="card-body">
						<textarea class="form-control" rows="3" name="content">${selectBoard.content}</textarea> 
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
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
				
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0"> 파일 첨부 </p>
					</div>
						
					<div class="card-body">
						<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" id="" />
						</div>
						<div class="uploadResult">
							<ul class="row row-cols-1 row-cols-sm-2 row-cols-md-4 attach-position"></ul>
						</div>
					</div>
				</div>
		</div>
		
			<div class="row">
				<div class="col order-1" style="text-align: right;">
	             <sec:authentication property="principal" var="info"/>
	              <sec:authorize access="isAuthenticated()">
	                <c:if test="${info.username == selectBoard.writer}">
						<button type="submit" data-oper='update' class="btn btn-outline-secondary">수정하기</button>              			
						<button type="submit" data-oper='remove' class="btn btn-outline-secondary">삭제하기</button>   
					</c:if>
	               </sec:authorize> 			
	                <button type="submit" data-oper='list' class="btn btn-outline-secondary">목록으로</button>  
		        </div>
	        </div>

<!-- 페이지 나누기를 위한 세팅값 -->
<form action="" id="myform" method="post">
	<input type="hidden" name="bno" value="${selectBoard.bno}" />
  	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />

	<!-- 시큐리티를 위한 추가내용 -->
	<input type="hidden" name="writer" value="${getBoard.writer}" />
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

</form>

<script>
	let bnoVal = ${selectBoard.bno};
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
</script>
<script src="/resources/js/Board_js/update.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>