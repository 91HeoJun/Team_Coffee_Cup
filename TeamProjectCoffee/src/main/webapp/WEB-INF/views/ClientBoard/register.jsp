<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

		<div class="col-lg-12">
			<h2 class="page-header-detail">1:1 문의 게시판 - 문의글 작성</h2>
		</div>

		<div class="accordion" id="accordionExample">
			<form action="/ClientBoard/register" method="post" role="form">
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0">글 제목</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="title"> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingTwo">
						<p class="mb-0">내용</p>
					</div>
					<div class="card-body">
						<textarea class="form-control" rows="5" name="content"></textarea> 
					</div>
				</div>
			  
				<div class="card">
					<div class="card-header" id="headingThree">
						<p class="mb-0">작성자</p>
					</div>
					<div class="card-body">
						<input class="form-control" name="writer">
					</div>
				</div>
				
				<div class="card">
					<div class="card-header" id="headingOne">
						<p class="mb-0"> 파일 첨부 </p>
					</div>
						
					<div class="card-body">
	 					<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" id="" multiple />
						</div>
						<div class="uploadResult">
							<ul class="attach-position"></ul>
						</div>
	
					</div>
				</div>

				<div class="regist-buttons">
			    	<button type="submit" class="btn btn-outline-success">작성</button>              			
	                <button type="reset" class="btn btn-outline-danger" onclick="location.href='list'">취소</button>       
	            </div>
			</form>
		</div>			
				
				
<!--
			1차
			<div class="card">
				<div class="card-header" id="headingOne">
					<p class="mb-0"> 파일 첨부 </p>
				</div>
					
				<div class="card-body">
				
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="inputGroupFileAddon01">파일</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="uploadFile" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" multiple>
				    <label class="custom-file-label" for="inputGroupFile01">파일 선택</label>
				  </div>
				  
				  <div class="uploadResult">
					<ul></ul>
				  </div>
				</div>
					
					본판
 					<div class="form-group uploadDiv">
						<input type="file" name="uploadFile" id="" multiple />
					</div>
					<div class="uploadResult">
						<ul></ul>
					</div> 
				</div>-->

		
<!-- 		<div class="accordion" id="accordionExample">
			<div class="card">
					  
				<div class="card-header" id="headingOne">
					<p class="mb-0"> 파일 첨부 </p>
				</div>
					
				<div class="card-body">
					<div class="form-group uploadDiv">
						<input type="file" name="uploadFile" id="" multiple />
					</div>
					<div class="uploadResult">
						<ul></ul>
					</div>
				</div>
			</div>
		</div> -->


<!--                 	<div class="panel panel-default">          
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
                				<button type="submit" class="btn btn-outline-success">작성</button>              			
                				<button type="reset" class="btn btn-outline-danger" onclick="location.href='list'">취소</button>              			
                			</form>
                		</div>
                	</div> -->
                	

					
					



					<%-- 파일 등록 --%>
 				<!--<div class="attach-aria">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading"> 파일 첨부하기</div>
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
					</div> -->				
					
<script src="/resources/js/Board_js/register.js"></script>
<%@include file="../footer.jsp" %>