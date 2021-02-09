<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

		<!-- <div class="row"> -->
		<div class="row">
		
			<!-- <div class="col-lg-12"> -->
			<div class="col-lg-12">
				<h2 class="page-header">1:1문의 게시판</h2>
			</div>
			<div class="panel panel-default">
			<div class="panel-heading">
				<button id='regBtn' type="button" class="btn btn-warning" onclick="location.href='register'">문의글 작성</button>
			</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>문의 번호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>									
                                </thead>

                               <tbody>
								<!-- 게시판 리스트 반복문 -->
									<c:forEach var="vo" items="${list}">
										<tr>
											<td>${vo.bno}</td>
											<td><a href="${vo.bno}" class="move">${vo.title}</a>[${vo.replyCnt}]</td>
											<td>${vo.writer}</td>
											<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</tbody>
                            </table>
                            
							<div class="row"> <!-- start search -->
								<div class="col-md-12">
									<div class="col-md-8">
		
										<!--search Form-->
										<form action="" id="searchForm">
											<select name="type" id="">
												<option value=""> ----- </option>
												<option value="T"<c:out value="${pageVO.cri.type=='T'?'selected':''}"/>> 제목 </option>
												<option value="C"<c:out value="${pageVO.cri.type=='C'?'selected':''}"/>> 내용 </option>
												<option value="W"<c:out value="${pageVO.cri.type=='W'?'selected':''}"/>> 작성자 </option>
												<option value="TC"<c:out value="${pageVO.cri.type=='TC'?'selected':''}"/>> 제목 or 내용</option>
											</select>
											
											<input type="text" id="keyword" name=keyword value="${pageVO.cri.keyword}" />
											<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
											<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		
											<button type="button" class="btn btn-default">검색</button>       		
										</form>
		
									</div>
									<div class="col-md-2 col-md-offset-2">
		
			                            <!--페이지 목록 갯수 지정하는 폼-->
			                            <select class="form-control" id="amount">
			                            	<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
			                            	<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
			                            	<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
			                            	<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
			                            </select>
		
									</div>
								</div>
							</div><!-- end search -->
		
							<!-- start Pagination -->
							<div class="text-center">
								<ul class="pagination">
									<c:if test="${pageVO.previous}">
										<li class="paginate_button previous"><a href="${pageVO.startPage-1}">Previous</a>
									</c:if>
									<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
										<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a>
									</c:forEach>
									<c:if test="${pageVO.next}">
										<li class="paginate_button next"><a href="${pageVO.endPage+1}">Next</a>
									</c:if>
								</ul>
							</div>
							<!-- end Pagination -->   

                        </div>
			</div><!-- end panel-body -->
		</div><!-- end panel -->		



<!-- 페이지 링크 값을 넘기기 위한 폼 -->
	<form action="" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		<input type="hidden" name="type" value="${pageVO.cri.type}" />
		<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	</form>

<!-- Modal 추가 -->
	<div class="modal" tabindex="-1" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">게시글 등록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p> 게시글이 등록되었습니다. </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal"> 확인 </button>
	      </div>
	    </div>
	  </div>
	</div>

<script> var result = '${result}';</script>
<script src="/resources/js/Board_js/list.js"></script>
<%@include file="../footer.jsp" %>