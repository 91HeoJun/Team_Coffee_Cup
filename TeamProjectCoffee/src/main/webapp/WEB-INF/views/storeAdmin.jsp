<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp"%>


<section class="page-section cta">
	<div class="container">
		<p>
  <button class="btn" style="background-color:#d19a3b" type="button" id="collapse" data-status="hide">매장 추가</button>
</p>
<div class="collapse" id="addMarket">
  <div class="card card-body">
    <div>
    	<label for="">매장 이름</label>
    	<input type="text" name="storeName" id="storeName" />
    </div>
    <div>
    	<label for="">매장 주소</label>
    	<input type="text" name="storeAddress" id="storeAddress" />
    </div>
    <div>
    	<label for="">매장 사진</label>
    	<input type="file" name="storePic" id="storePic" />
    </div>
  </div>
</div>

<script>
//매장 추가 버튼의 collapse 기능을 위한 스크립트
$(function(){
	$("#collapse").click(function(){
		if($("#collapse").data("status")=='hide'){
			//console.log("show collapse");
			$("#addMarket").collapse("show");
			$("#collapse").data("status", "show");
		}
		if($("#collapse").data("status")=='show'){
			//console.log("hide collapse");
			$("#addMarket").collapse("hide");
			$("#collapse").data("status", "hide");
		}
	})
})
</script>

		<div class="row">

			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">code</th>
						<th scope="col">지점</th>
						<th scope="col">주소</th>
						<th scope="col">기타</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>Larry</td>
						<td>the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>

		</div>
	</div>
</section>

<section class="page-section about-heading">
	<div class="container"></div>
</section>

<%@ include file="footer.jsp"%>