<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

			<div class="col-lg-12">
				<h2 class="list-page-header"> 공지사항 </h2>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<!--search Form-->
					<form action="" id="searchForm" class="search-options">
						<select name="type" id="">
							<option value=""> --------------- </option>
							<option value="T"<c:out value="${pageVO.cri.type=='T'?'selected':''}"/>> 제목 </option>
							<option value="C"<c:out value="${pageVO.cri.type=='C'?'selected':''}"/>> 내용 </option>
							<option value="W"<c:out value="${pageVO.cri.type=='W'?'selected':''}"/>> 작성자 </option>
							<option value="TC"<c:out value="${pageVO.cri.type=='TC'?'selected':''}"/>> 제목 or 내용</option>
						</select>
												
						<input type="text" id="keyword" name=keyword value="${pageVO.cri.keyword}" />
						<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
						<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
			
						<button type="button" class="btn btn-outline-dark" id="board-finder">검색</button>       		
					</form>
				</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="table-No">No.</th>
                                        <th class="table-Title">제 목</th>
                                        <th class="table-Writer">작성자</th>
                                        <th class="table-Date">작성일</th>
                                        <th class="table-Date">수정일</th>
                                    </tr>									
                                </thead>

                               <tbody>
                               
								<!-- 게시판 리스트 반복문 -->
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="table-No">${vo.bno}</td>
											<td><a href="${vo.bno}" class="move">${vo.title}</a></td>
											<td class="table-Writer">${vo.writer}</td>
											<td class="table-Date"><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
											<td class="table-Date"><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</tbody>
                            </table>

								<div class="col-md-12">
								
									<div class="col-md-2 col-md-offset-2">

			                            <!--페이지 목록 갯수 지정하는 폼-->
			                            <select class="amount-form-control" id="amount">
			                            	<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
			                            	<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
			                            	<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
			                            	<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
			                            </select>
									</div>
									
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
								
									<div class="col-md-8">
										<sec:authentication property="principal" var="info"/>
										<sec:authorize access="isAuthenticated()">
											<c:if test="${info.username == 'testadmin'}">	
												<button id='regBtn' type="button" class="btn btn-outline-dark" onclick="location.href='register'">공지사항 작성</button>
											</c:if>
										</sec:authorize>
									</div>
	
								</div> <!-- end search -->
                        </div>
			</div>



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
	        <p> 요청이 처리되었습니다. </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal"> 확인 </button>
	      </div>
	    </div>
	  </div>
	</div>

<script> var result = '${result}';</script>
<script src="/resources/js/Notice_js/list.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>