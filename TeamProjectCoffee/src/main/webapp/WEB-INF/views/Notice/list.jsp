<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

			<div class="row justify-content-between">
				<h2 class="col-4 sub_tit_wrap h2"> 공지사항 </h2>

				<div class="col-4 panel-heading" style="text-align: right;">
					<!--search Form-->
					<form action="" id="searchForm" class="search-options">
						<input type="hidden" name="type" value="TC"/>						
						<input type="text" id="keyword" name=keyword value="${pageVO.cri.keyword}" placeholder="검색어를 입력하세요"/>
						<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
						<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
			
						<button type="button" class="btn btn-outline-secondary" id="board-finder">검색</button>       		
					</form>
				</div>
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

							<div class="row justify-content-end">
									<!-- 페이지나누기 -->
									<div class="col-md-4">
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
									</div>	
								
									<div class="col-lg-4" style="text-align: right;">
										<sec:authentication property="principal" var="info"/>
										<sec:authorize access="isAuthenticated()">
											<c:if test="${info.username == 'testadmin'}">	
												<button id='regBtn' type="button" class="btn btn-outline-secondary" onclick="location.href='register'">공지사항 작성</button>
											</c:if>
										</sec:authorize>
									</div>
	
								</div> <!-- end search -->
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
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal"> 확인 </button>
	      </div>
	    </div>
	  </div>
	</div>

<script> var result = '${result}';</script>
<script src="/resources/js/Notice_js/list.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>