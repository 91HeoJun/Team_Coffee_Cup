<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

		<div class="row justify-content-between">
			<h2 class="col-6 sub_tit_wrap h2">자유 게시판 - 게시글</h2>
	    </div>
		<div class="accordion" id="accordionExample">
			<form action="/ClientBoard/register" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">${selectBoard.bno}번 글 제목</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title" readonly="readonly" value="${selectBoard.title}"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">내용</p>
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
				
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0"> 파일 첨부 </p>
					</div>
						
					<div class="card-body">
						<div class="uploadResult">
							<ul class="row row-cols-1 row-cols-sm-2 row-cols-md-4 attach-position"></ul>
						</div>
	
					</div>
				</div>

			</form>
			
			<div class="row" style="padding-top: 2px;">
				<div class="col order-1" style="text-align: right;">
				<sec:authentication property="principal" var="info"/>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${info.username == selectBoard.writer}">
					    <button type="button" class="btn btn-outline-secondary" id="modify-button"> 수정 </button>
					</c:if>    
				</sec:authorize>
		            <button type="reset" class="btn btn-outline-secondary" id="gotolist-button"> 목록으로 </button>
		        </div>
	        </div>
			
			<div><br /></div>
 			<div class="card">
				<div class="card-header" id="headingThree">
					<p class="mb-0">댓글</p>
				</div>
				<div class="card-body">
					<ul class="chat">			
					<!-- 댓글 리스트 내용 -->				
					</ul>
					<div class="panel-footer"></div>
				</div>
			</div>			
		</div>		
		<div><br /></div>	
			<div class="reply-button" style="text-align: right;">
					<button id="addReplyBtn" class="btn btn-outline-secondary">댓글 쓰기</button>
			</div>

			<!-- 이동값 히든폼 -->
			<form action="update" id="myform">
				<input type="hidden" name="bno" value="${selectBoard.bno}" />
				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="type" value="${cri.type}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" />
			</form>

					<!-- 댓글 등록 버튼 누르면  Modal -->
					<!-- 댓글 등록 모달 -->
					<div class="modal" tabindex="-1" role="dialog" id="replyModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					        <h5 class="modal-title">댓글 입력</h5>
					      </div>
					      <div class="modal-body">
					        <div class="form-group">
					        	<label for="">댓글내용</label>
					        	<input type="text" class="form-control" name="reply" value="댓글내용"/>
					        </div>
					        <div class="form-group">
					        	<label for="">작성자</label>
					        	<input type="text" class="form-control" name="replyer" value="작성자"/>
					        </div>
					        <div class="form-group">
					        	<label for="">작성일</label>
					        	<input type="text" class="form-control" name="replyDate" value="작성일"/>
					        </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-outline-secondary" id="modalRegisterBtn">등록</button>
					        <button type="button" class="btn btn-outline-secondary" id="modalModifyBtn">수정</button>
					        <button type="button" class="btn btn-outline-secondary" id="modalRemoveBtn">삭제</button>
					        <button type="button" class="btn btn-outline-secondary" id="modalCloseBtn" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 댓글 등록 Modal end -->

<script>
	var bnoVal = ${selectBoard.bno};
	
	// 댓글 리스트 가져올 영역 가져오기
	let replyUl = $(".chat");
	
	// 모달 영역 가져오기
	let modal = $(".modal");
	
	// 모달 내용
	let modalInputReply = modal.find("input[name='reply']");
	let modalInputReplyer = modal.find("input[name='replyer']");
	let modalInputReplyDate = modal.find("input[name='replyDate']");

	let modalModBtn = $("#modalModifyBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn");
	
	// 댓글 페이지 영역 가져오기
	let replyPageFooter = $(".panel-footer");
</script>

<script>
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	// 댓글 작성자 보여주기 - 회원제 게시판일 경우
	var replyer = null;
	
	<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username"/>'
	</sec:authorize>
</script>

<script src="/resources/js/Board_js/select.js"></script>
<script src="/resources/js/Board_js/reply.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>