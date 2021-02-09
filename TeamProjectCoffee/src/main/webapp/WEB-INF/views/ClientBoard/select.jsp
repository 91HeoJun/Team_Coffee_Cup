<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

           <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> 1:1문의 게시판 </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="/ClientBoard/select" role="form">
                				<div class="form-group">
                					<label> 번호 </label>
                					<input class="form-control" name="bno" readonly="readonly" value="${selectBoard.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label> 제목 </label>
                					<input class="form-control" name="title" readonly="readonly" value="${selectBoard.title}">                				
                				</div>  
                				<div class="form-group">
                					<label> 내용 </label>
                					<textarea class="form-control" rows="3" name="content" readonly="readonly">${selectBoard.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label> 작성자 </label>
                					<input class="form-control" name="writer" readonly="readonly"  value="${selectBoard.writer}">                				
                				</div>  
                				<button type="button" class="btn btn-default" > 수정 </button>     			
                				<button type="reset" class="btn btn-info"> 목록으로 </button>
                			</form>
                		</div>
                	</div>
                	
                	<%-- 첨부파일 --%>					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading"><i class="fa fas fa-file"></i> 첨부 파일</div>
								<div class="panel-body">
									<div class="uploadResult">
										<ul></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
                	
            		<!-- 댓글 리스트 -->
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="bi bi-chat-right-text"></i>
									댓글
									<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 쓰기</button>
								</div>
								<div class="panel-body">
									<ul class="chat">
									
									<!-- 댓글 리스트 내용 -->
									
									</ul>
								</div>
								<div class="panel-footer"></div>
							</div>
						</div>
					</div> <!-- 댓글 리스트 end -->
            
					<!-- 댓글 등록 버튼 누르면  Modal -->
					<!-- 댓글 등록 모달 -->
					<div class="modal" tabindex="-1" role="dialog" id="replyModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					        <h5 class="modal-title">Reply</h5>
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
					        <button type="button" class="btn btn-warning" id="modalRegisterBtn">등록</button>
					        <button type="button" class="btn btn-success" id="modalModifyBtn">수정</button>
					        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
					        <button type="button" class="btn btn-primary"  id="modalCloseBtn" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 댓글 등록 Modal end -->
						
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
<%@include file="../footer.jsp" %>