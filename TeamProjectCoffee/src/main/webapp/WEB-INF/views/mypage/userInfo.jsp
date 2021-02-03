<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<html>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto');
a {
	text-decoration:none;
	color: #FFFFFF;
}
.container{
  padding: 50px;
}

.card{
  width: 200px;
  height: 320px;
  background-color: #1E2B32;
  border-radius: 10px 10px;
  border : 1px, #000000;
}

.header{
  border-radius: 10px 10px 0px 0px;
  padding: 5px;
  background-color: #2A3942;
}

h3{
  color: #FFFFFF;
  font-family: 'Roboto', sans-serif;
  margin-left: 1rem;
}

.iconM{
  font-size: 18px;
  margin-left: 170px;
  color: #2f89fc;
}

.icon{
  margin-right: 8px;
}

.body li{
  transition: 1s all;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  padding: 15px;
  margin-left: -40px;
  margin-top: 0px;
  color: #fff;
  list-style: none;
  display: block;
  border-top-right-radius: 10px 10px;
  border-bottom-right-radius: 10px 10px;
}

li:hover{
  transition: 1s all;
  color: #2f89fc;
  background-color: rgba(42, 56, 65, 0.82);
  border-top-right-radius: 10px 10px;
  border-bottom-right-radius: 10px 10px;
  cursor: pointer;
}

.body > li{
  float: left;
}

.body li ul{
  background: #1E2B32;
  margin-left: 180px;
  margin-top: -38px;
  display: none;
  position: absolute;
  border-top-right-radius: 15px 15px;
  border-bottom-right-radius: 15px 15px;
}

.body li:hover > ul{
	display:block;
 	cursor: pointer;
}

</style>
<head>
<title>회원관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<%-- view 폴더 아래에 있는 jsp 페이지가 포함해서 보여줘야 하는 페이지이기 때문에 경로설정은 아래와 같이  --%>
<link href="../css/starter-template.css" rel="stylesheet">
<link href="../css/floating-labels.css" rel="stylesheet">

</head>
<div class="container">
  <div class="card">
    <div class="header">
      <h3>My Page<i class="fas fa-angle-down iconM"></i></h3>
    </div>
    <div class="body">
      <ul>
        <li><a href="../index"><i class="fas fa-home icon"></i> Home</a></li>
        <li><a href="/mypage/userInfo"><i class="fab fa-wpforms icon"></i> 회원정보</a>
          <ul>
            <li><a href="/mypage/changeInfo"><i class="fas fa-pencil-alt icon" ></i> 회원정보변경</a></li>
            <li><a href="/mypage/leave"><i class="fas fa-paper-plane icon" ></i> 회원탈퇴</a></li>
          </ul>
        </li>
      </ul>
  </div>
</div>
</div>
<body style="background-color:#F5F5F5;">

<div class="form-group text-center" style="margin-top:40px">
<h1 style="color:#ffffff;"> u s e r I n f o</h1>
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
<button type="submit" class="btn btn-primary" onclick="location.href='/mypage/changeInfo'">정보변경하기</button>
<!-- <button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	 -->
	</div> 
	</div>
</main>

</body>
</html>
