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
<!--                         <div class="panel-heading">
                           문의 글 작성
                        </div> -->
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
                </div>
            </div>

<form action="update" id="myform">
	<input type="hidden" name="bno" value="${selectBoard.bno}" />
	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" />
</form>

<script> var bnoVal = ${selectBoard.bno}; </script>
<script src="/resources/js/Board_js/select.js"></script>
<%@include file="../footer.jsp" %>