<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="../ClientBoard/boardHeader.jsp" %>

		<div class="col-lg-12">
			<h2 class="page-header-detail">자주하는 질문 작성</h2>
		</div>

		<div class="" id="accordionExample">
			<form action="/FAQ/register" method="post" role="form">
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

				<div class="regist-buttons">
			    	<button type="submit" class="btn btn-outline-success">작성</button>              			
	                <button type="reset" class="btn btn-outline-danger" onclick="location.href='list'">취소</button>       
	            </div>
			</form>
		</div>			
					
<script src="/resources/js/FAQ_js/register.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>