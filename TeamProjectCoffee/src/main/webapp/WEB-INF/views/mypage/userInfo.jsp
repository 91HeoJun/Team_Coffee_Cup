<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html>
<head>
<title>회원관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<%-- view 폴더 아래에 있는 jsp 페이지가 포함해서 보여줘야 하는 페이지이기 때문에 경로설정은 아래와 같이  --%>
<link href="../css/starter-template.css" rel="stylesheet">
<link href="../css/floating-labels.css" rel="stylesheet">

</head>
<body style="background-color:#F5F5F5;">

<div class="form-group text-center" style="margin-top:40px">
<h1 style="color:#ffffff;">${regist.name}회원님의 상세정보 페이지 입니다.</h1>
</div>
<main role="main" class="container">
<div class="container" style="margin-top:40px">
<form id="userInfo" action="">

	<div class="form-group row justify-content-center">
		<label for="userid" class="col-sm-2 col-form-label" style="color:#ffffff;">아이디</label>
		<div class="col-sm-6">
			<input type="text" name="userid" id="userid" class="form-control" value="${regist.userid}" readonly/>
			 <small id="userid" class="text-info"></small>
		</div>
	</div>
	<div class="form-group row justify-content-center">
		<label for="name" class="col-sm-2 col-form-label" style="color:#ffffff;">이름 </label>
		<div class="col-sm-6">
			<input type="text" name="name" id="name" class="form-control" value="${regist.name}" readonly/>
			<small id="name" class="text-info"></small>
		</div>
	</div>
	<div class="form-group row justify-content-center">
		<label for = "email" class="col-sm-2 col-form-label" style="color:#ffffff;">이메일</label>
		<div class="col-sm-6">
			<input type="email" name="email" id="email" class="form-control" value="${regist.email}"readonly/>
			<small id="email" class="text-info"></small>
		</div>
	</div>
	
	<div class="form-group row justify-content-center">
		<label for="tel" class="col-sm-2 col-form-label" style="color:#ffffff;">전화번호 </label>
		<div class="col-sm-6">
			<input type="text" name="tel" id="tel" class="form-control" value="${regist.tel}" readonly/>
			<small id="tel" class="text-info"></small>
		</div>
	</div>
	<div class="form-group row justify-content-center">
		<label for="addr" class="col-sm-2 col-form-label" style="color:#ffffff;">우편번호 </label>
		<div class="col-sm-6">
			<input type="text" name="postCode" id="postCode" class="form-control" value="${regist.postCode}" readonly/>
			<small id="postCode" class="text-info"></small>
	</div>
	</div>
	<div class="form-group row justify-content-center">
		<label for="addr" class="col-sm-2 col-form-label" style="color:#ffffff;">주소 </label>
		<div class="col-sm-6">
			<input type="text" name="address" id="address" class="form-control" value="${regist.address}" readonly/>
			<small id="address" class="text-info"></small>
		</div>
	</div>
	
	<div class="form-group row justify-content-center">
		<label for="addr" class="col-sm-2 col-form-label" style="color:#ffffff;">상세주소 </label>
		<div class="col-sm-6">
			<input type="text" name="detailAddress" id="detailAddress" class="form-control" value="${regist.detailAddress}" readonly/>
			<small id="detailAddress" class="text-info"></small>
		</div>
	</div> 

</form>
	<div class="form-group text-center">
<button type="submit" class="btn btn-primary" onclick="location.href='/mypage/changeInfo'">정보수정</button>
<button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	
	</div>
	</div>
</main>

</body>
</html>
