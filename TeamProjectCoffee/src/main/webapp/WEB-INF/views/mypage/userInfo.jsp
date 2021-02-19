<%@page import="com.company.domain.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<% RegisterVO regist = (RegisterVO)session.getAttribute("regist"); %>
<!DOCTYPE html>
<style>
#left_bar{
border: 2px solid;
border-radius: 10px;
}
#left_bar > li{
border-bottom: 1px solid;
}
.nav-link {
color:black !important;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<div>&nbsp;</div>
    <div class="container">
        <!-- Stack the columns on mobile by making one full-width and the other half-width -->
        <div class="row">
		<div class="col-md-2">
			<ul class="nav flex-column" id="left_bar">
				<li class="nav-item"><a class="nav-link active" href="../">HOME</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../calendar">출석체크</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/mypage/userInfo">회원정보 조회</a></li>
				<li class="nav-item"><a class="nav-link" href="/mypage/leave">회원탈퇴</a>
				</li>
			</ul>
		</div>
		
          <div class="col-3 col-md-9" >
          	<div class="title">
		<h1 class="form-group row justify-content-center">u s e r  I n f o</h1>
	</div>
			<form id="userInfo" action="/changeInfo" method="post">

				<div class="form-group row justify-content-center">
					<label for="userid" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-6">
						<input type="text" name="userid" id="userid" class="form-control"
							value="${regist.userid}" readonly /> <small id="userid"
							class="text-info"></small>
					</div>
				</div>
				<div class="form-group row justify-content-center">
					<label for="name" class="col-sm-2 col-form-label">이름 </label>
					<div class="col-sm-6">
						<input type="text" name="name" id="name" class="form-control"
							value="${regist.name}" readonly /> <small id="name"
							class="text-info"></small>
					</div>
				</div>
				<div class="form-group row justify-content-center">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-6">
						<input type="email" name="email" id="email" class="form-control"
							value="${regist.email}" readonly /> <small id="email"
							class="text-info"></small>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label for="tel" class="col-sm-2 col-form-label">전화번호 </label>
					<div class="col-sm-6">
						<input type="text" name="tel" id="tel" class="form-control"
							value="${regist.tel}" readonly /> <small id="tel"
							class="text-info"></small>
					</div>
				</div>
				<div class="form-group row justify-content-center">
					<label for="addr" class="col-sm-2 col-form-label">우편번호 </label>
					<div class="col-sm-6">
						<input type="text" name="postCode" id="postCode"
							class="form-control" value="${regist.postCode}" readonly /> <small
							id="postCode" class="text-info"></small>
					</div>
				</div>
				<div class="form-group row justify-content-center">
					<label for="addr" class="col-sm-2 col-form-label">주소 </label>
					<div class="col-sm-6">
						<input type="text" name="address" id="address"
							class="form-control" value="${regist.address}" readonly /> <small
							id="address" class="text-info"></small>
					</div>
				</div>

				<div class="form-group row justify-content-center">
					<label for="addr" class="col-sm-2 col-form-label">상세주소 </label>
					<div class="col-sm-6">
						<input type="text" name="detailAddress" id="detailAddress"
							class="form-control" value="${regist.detailAddress}" readonly />
						<small id="detailAddress" class="text-info"></small>
					</div>
				</div>
				<div class="form-group row justify-content-center">
					<label for="point" class="col-sm-2 col-form-label">적립된 포인트
					</label>
					<div class="col-sm-6">
						<input type="text" name="point" id="point" class="form-control"
							value="${regist.point}" readonly /> <small id="point"
							class="text-info"></small>
					</div>
				</div>
				<div>&nbsp;</div>

				<div class="form-group text-center">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/mypage/changeInfo'"">정보변경하기</button>
					<!-- <button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	 -->
				</div>
			</form>

		</div>
</div>
</div>
</html>
<%@ include file="../footer.jsp" %>
