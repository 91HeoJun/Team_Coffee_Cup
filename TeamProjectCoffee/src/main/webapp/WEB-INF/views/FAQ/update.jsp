<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>


 		<div class="col-lg-12">
			<h2 class="page-header-detail">자주하는 질문</h2>
		
			<div class="regist-buttons">
             <sec:authentication property="principal" var="info"/>
              <sec:authorize access="isAuthenticated()">
                <c:if test="${info.username == selectBoard.writer}">
                <button type="submit" data-oper='update' class="btn btn-outline-dark">수정하기</button>              			
                <button type="submit" data-oper='remove' class="btn btn-outline-dark">삭제하기</button>              			
				</c:if>
               </sec:authorize> 
                <button type="submit" data-oper='list' class="btn btn-outline-dark">목록으로</button>  
	        </div>
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
<script src="/resources/js/FAQ_js/update.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>