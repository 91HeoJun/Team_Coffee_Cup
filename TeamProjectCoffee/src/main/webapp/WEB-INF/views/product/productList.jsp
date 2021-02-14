<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>


<div class="panel-heading">

	<button id='regBtn' type="button" class="btn btn-default" onclick="location.href='productRegister'">상품 등록</button>
 
</div>
<div class="row row-cols-1 row-cols-md-2">
<c:forEach var="vo" items="${listProduct }">
 <div class="col mb-4">
    <div class="card">
    	<!-- 수정 예정 -->
      <a href="/product/productDetail?pcode=${vo.pcode }"><img src="/resources/img/product/${vo.pcode }.jpg" class="card-img-top" alt="...">
      <div class="card-body">
	        <h5 class="card-title">${vo.product }</h5>
	        <p class="card-text">
		        ${vo.pcontent } <br/>
		        ${vo.origin } <br/>
				로스팅(제조)일: <fmt:formatDate value="${vo.pdate }" pattern="yyyy-MM-dd"/> <br/>
				${vo.price } <br/>
			</p>
		<button type="button" class="btn btn-outline-primary">장바구니 담기</button>
       </div></a>
     </div>
   </div>
</c:forEach>
</div>

<div class="col-md-12"> <!-- start search -->
	<div class="col-md-8">
		
				<!--search Form-->
			<form action="" id="searchForm">
					<select name="type" id="">
						<option value=""> ----- </option>
						<option value="T"<c:out value="${pageVO.cri.type=='P'?'selected':''}"/>> 상품 </option>
						<option value="C"<c:out value="${pageVO.cri.type=='C'?'selected':''}"/>> 내용 </option>
					</select>
											
				    	<input type="text" id="keyword" name=keyword value="${pageVO.cri.keyword}" />
						<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
						<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		
						<button type="button" class="btn btn-default">검색</button>       		
			</form>
		
	</div>
		
			                            <!--페이지 목록 갯수 지정하는 폼-->
			                            <select class="form-control" id="amount">
			                            	<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
			                            	<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
			                            	<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
			                            	<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
			                            </select>
		
									</div>
								 <!-- end search -->
		
							<!-- 페이지나누기 -->
							<div class="text-center">
								<ul class="pagination">
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
                        </div>
			</div>


<!-- 페이지 링크 값을 넘기기 위한 폼 -->
	<form action="" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		<input type="hidden" name="type" value="${pageVO.cri.type}" />
		<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	</form>


<%@include file="../footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- </body>
 -->
</html>