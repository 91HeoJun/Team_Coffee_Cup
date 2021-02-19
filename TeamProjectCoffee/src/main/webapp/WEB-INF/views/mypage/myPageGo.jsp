<%@page import="com.company.domain.ChangeVO"%>
<%@page import="com.company.domain.RegisterVO"%>
<%@page import="com.company.domain.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style>
.container{
margin-top: 100px;
}
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

<div class="container">
	<div class="row">
		<div class="col-md-2" >
			<ul class="nav flex-column" id="left_bar" >
				<li class="nav-item" ><a class="nav-link active" href="../" >HOME</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../calendar">출석체크</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/mypage/userInfo">회원정보 조회</a></li>
				<li class="nav-item"><a class="nav-link" href="/mypage/leave">회원탈퇴</a>
				</li>
			</ul>
		</div>
		<div class="col-3 col-md-9">
			<form id="myPageGO" action="">

				<div class="form-group row justify-content-center">

					<h1>*** ${regist.name}님 반갑습니다.***</h1>
				</div>
				<div>

				</div>

				<div class="form-group row justify-content-center">
					<label for="point" class="col-sm-2 col-form-label">적립 포인트</label>
					<div class="col-sm-4">
						<input type="text" name="point" id="postCode" class="form-control"
							value="${regist.point}" readonly /> <small id="point"
							class="text-info"></small>
					</div>
				</div>
				<div>
					<br>
				</div>
				<div>
					<br>
				</div>
				<div>
					<br>
				</div>
				<div class="form-group text-center">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='/mypage/changeInfo'">정보변경하기</button>
					<!-- 	<button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	 -->
				</div>
					     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
		</div>
	</div>
</div>
</html>

<%@ include file="../footer.jsp" %>