<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

           <div class="row">
                <div class="col-lg-12">
                    <h2 class="page-header">1:1문의 게시판</h2>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           문의 글 작성
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="/ClientBoard/register" method="post" role="form">
                				<div class="form-group">
                					<label>글 제목</label>
                					<input class="form-control" name="title">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="5" name="content"></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="writer">                				
                				</div>  
                				<button type="submit" class="btn btn-default">작성</button>              			
                				<button type="reset" class="btn btn-default" onclick="location.href='list'">취소</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
            
			<%-- 파일 등록 --%>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">File Attach</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name="uploadFile" id="" multiple />
							</div>
							<div class="uploadResult">
								<ul></ul>
							</div>
						</div>
					</div>
				</div>
			</div>

<script src="/resources/js/Board_js/register.js"></script>
<%@include file="../footer.jsp" %>