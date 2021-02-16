<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

		<div class="col-lg-12">
			<h2 class="page-header-detail">1:1 문의 게시판 - 문의글 작성</h2>
		
			<div class="regist-buttons">
			    <button type="button" class="btn btn-outline-dark" id="modify-button"> 수정 </button>
	            <button type="reset" class="btn btn-outline-dark" id="gotolist-button"> 목록으로 </button>
	        </div>
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
							<ul class="attach-position"></ul>
						</div>
	
					</div>
				</div>

			</form>
			
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
			<div class="reply-button">
				<button id="addReplyBtn" class="btn btn-outline-dark">댓글 쓰기</button>
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
					        <button type="button" class="btn btn-outline-dark" id="modalRegisterBtn">등록</button>
					        <button type="button" class="btn btn-outline-dark" id="modalModifyBtn">수정</button>
					        <button type="button" class="btn btn-outline-dark" id="modalRemoveBtn">삭제</button>
					        <button type="button" class="btn btn-outline-dark"  id="modalCloseBtn" data-dismiss="modal">닫기</button>
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

<script src="/resources/js/Board_js/select.js"></script>
<script src="/resources/js/Board_js/reply.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>