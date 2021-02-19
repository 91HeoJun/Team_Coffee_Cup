<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="productHeader.jsp" %>
	<style>	
	a {
	color: black;
	}
	a:hover {
    color: #666666;
   	text-decoration:none;
	}
	</style>

<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->


<div class="row row-cols-1 row-cols-md-2" style="margin-top:20px;margin-right: 45px; margin-left: 45px;">
<c:forEach var="vo" items="${listProduct}">
 <div class="col mb-4">
    <div class="card">
    	<!-- 수정 예정 -->
      <a href="/product/productDetail?pcode=${vo.pcode}&amount=${pageVO.cri.amount}&pageNum=${pageVO.cri.pageNum}">          
      <img src="/resources/productimg/<c:out value="${vo.attach.uuid}"/>_<c:out value="${vo.attach.fileName}"/>" class="card-img-top" alt="...">      
      <div class="card-body">
	        <h5 class="card-title">${vo.product}</h5>
	        <p class="card-text">
		        ${vo.pcontent} <br/>
		        ${vo.origin} <br/>
				로스팅(제조)일: <fmt:formatDate value="${vo.pdate}" pattern="yyyy-MM-dd"/> <br/>
				${vo.price}원<br/>
			</p>
       </div></a>
     </div>
   </div>
</c:forEach>
</div>		
<!-- 페이지나누기 -->
<div class="text-center">
	<ul class="pagination justify-content-center">
		<c:if test="${pageVO.previous}">
			<li class="page-item"><a class="page-link" href="${pageVO.startPage-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		</c:if>
		<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
			<li class="page-item ${pageVO.cri.pageNum==idx?'active':''}"><a class="page-link" href="${idx}">${idx}</a></li>
		</c:forEach>
		<c:if test="${pageVO.next}">
			<li class="page-item"><a class="page-link" href="${pageVO.endPage+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		</c:if>
	</ul>
</div><!-- 페이지 링크 값을 넘기기 위한 폼 -->
<form action="" id="actionForm">
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	<input type="hidden" name="type" value="${pageVO.cri.type}" />
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
</form>

<script src="/resources/js/Product_js/productList.js"></script>
<div id="topBtn">TOP</div>
<%@include file="../footer.jsp" %>



