<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<section class="page-section cta">
	<div class="container">
		
			<div>
		 		<button class="btn" style="background-color:lightgray" type="button" id="collapse" data-status="hide">매장 추가</button>
			</div>
			<div style="background-color:#d19a3b" class="collapse" id="addMarket">
		  		<div class="card card-body">
				  	<div class="col">
					  	<form id="Form0" action="/store/add" method="post">
						    <div>
						    	<label for="">매장 이름</label>
						    	<input type="text" name="name" id="storeName" />
						    </div>
						    <div>
						    	<label for="">매장 주소</label>
						    	<input type="text" name="address" id="storeAddress" />
						    </div>
						    <div>
						    	<label for="">매장 사진</label>
						    	<input type="file" name="pic" data-code="0" id="storePic" />
						    </div>
						    <div>
						    	<button data-code="0" class="btn btn-primary" type="submit" id="addStore">입력</button>
						    	<button class="btn" type="reset">취소</button>
						    </div>
					  	</form>
					</div>
				  	<div id="thumbnailPic0">
				 		<ul>
				 		</ul>
				  	</div>
		  		</div>
			</div>
		


		<div class="row">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">code</th>
						<th scope="col">지점</th>
						<th scope="col">주소</th>
						<th scope="col">사진</th>
						<th scope="col">기타</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${list}">
						<tr class="storeRows">
							<form id="Form${vo.code}" method="post" action="/store/modify">
								<td>${vo.code}</td>
								<td><input name="name" id="modifyName${vo.code}" value="${vo.name}" type="text" readonly/></td>
								<td><input name="address" id="modifyAddress${vo.code}" value="${vo.address}" size="35" type="text" readonly/></td>
								<td>
									<c:forEach var="attach" items="${vo.attachList}">
										<p><a data-code="${vo.code}">${attach.fileName}</a></p>
										<div id="pic${vo.code}" style="display:none">
											<p><input type="file" data-code="${vo.code}"></p>
											<div class="thumbnailList" id="thumbnailPic${vo.code}">
												<ul></ul>
											</div>
										</div>
									</c:forEach>
								</td>
								<td>
									<input type="hidden" name="code" value="${vo.code}"/>
									<button class="btn btn-primary modify" data-status="modify" data-code="${vo.code}" type="button">수정</button>
									<button id="cancel${vo.code}" style="display:none" class="btn btn-warning" type="reset" onclick="location.href='/store/admin'">취소</button>
									<button type="button" class="btn btn-danger delete" data-code="${vo.code}">삭제</button>
								</td>
							</form>							
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</section>

<section class="page-section about-heading">
	<div class="container"></div>
</section>
<script src="/resources/js/storeAdmin.js"></script>
<%@ include file="../footer.jsp"%>