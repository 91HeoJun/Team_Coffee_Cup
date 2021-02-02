<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">문의글 수정 페이지</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>번호</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${selectBoard.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title" value="${selectBoard.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content">${selectBoard.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${selectBoard.writer}">                				
                				</div>  
                				<button type="submit" data-oper='update' class="btn btn-default">수정하기</button>              			
                				<button type="submit" data-oper='remove' class="btn btn-danger">삭제하기</button>              			
                				<button type="submit" data-oper='list' class="btn btn-info">목록으로</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>

<!-- 페이지 나누기를 위한 세팅값 -->
<form action="" id="myform" method="post">
	<input type="hidden" name="bno" value="${selectBoard.bno}" />
<%--  	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />	
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
</form>

<script> let bnoVal = ${selectBoard.bno}; </script>
<script src="/resources/js/Board_js/update.js"></script>
<%@include file="../footer.jsp" %>