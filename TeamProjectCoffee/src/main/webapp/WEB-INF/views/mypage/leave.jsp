<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
<meta charset="UTF-8">
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

</head>
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
<div>&nbsp;</div>
<div>&nbsp;</div>
    <div class="container">
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
<form id="leaveform" action="" method="post">
	<div class="card"  style="width: 40rem;margin:40px auto;">	
		<div class="card-header">
	    	<h4>회원탈퇴</h4>
	  	</div>
	 	<div class="card-body">	
			<div class="form-group row justify-content-center">		
				<div class="col-sm-10">	
					<input type="text" name="userid" id="userid" class="form-control" value="${regist.userid}" readonly/>
			 		<small id="userid" class="text-info"></small>		
				</div>
			</div>	
			<div class="form-group row justify-content-center">		
				<div class="col-sm-10">	
					<input type="password" name="password" id = "password" class="form-control" placeholder="비밀번호를 입력해주세요" autofocus="autofocus"/>
					<small id="password" class="text-info"></small>
				</div>	
			</div>				
			<div class="form-group text-center">		
				<button type="submit" class="btn btn-danger" id="leave">탈퇴</button>
			    <button type="button" class="btn btn-secondary" id="leavecancel" onclick="location.href='/mypage/myPageGo'">취소</button>		
			</div>
		</div>
	</div>	
			     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

</div>
</div>
</div>

<script>
$("#leave").click(function(){

	if(confirm("탈퇴시 적립된 포인트는 복구 할 수 없습니다. \n정말 탈퇴하시겠습니까?") == true){
		
		$('#leaveform').submit();
		alert("탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.");
	} else{
		return false;
	}
});
</script>

<%@include file="../footer.jsp" %>