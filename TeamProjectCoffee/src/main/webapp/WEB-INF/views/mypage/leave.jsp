<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
.menu li {
	background-color: #f5c669;
	font-size: 0.8em;
}

.list-group-item.activated{
	background-color: #f7f2cd;
}
.menu li a{
	color: #000;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <div class="container">
        <!-- Stack the columns on mobile by making one full-width and the other half-width -->
        <div class="row">
          <div class="col-md-2" style="background-color: none;">
            <ul class="list-group list-group-flush float-left menu">
				<li class="list-group-item activated" id="list1"><a href="../">HOME</a></li>
				<li class="list-group-item" id="list2"><a href="/mypage/userInfo">회원정보 조회</a></li>
				<li class="list-group-item" id="list3"><a href="/mypage/changeInfo">회원정보 수정</a></li>
				<li class="list-group-item" id="list4"><a href="/mypage/leave">회원탈퇴</a></li>
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
					<input type="text" name="userid" id="userid" class="form-control" value="${auth.userid}" readonly/>
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
		
</form>
</div>
</div>
</div>

<script>
$("#leave").click(function(){

	if(confirm("정말 탈퇴하시겠습니까?") == true){
		
		$('#leaveform').submit();
		alert("탈퇴되었습니다. 그동안 이용해 주셔서 감사합니다.");
	} else{
		return false;
	}
});
</script>
<script>
$(function() {
	$( document ).ready(function() {
	$('#cssmenu > ul > li > a').click(function() {
	  $('#cssmenu li').removeClass('active');
	  $(this).closest('li').addClass('active');	
	  var checkElement = $(this).next();
	  if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
	    $(this).closest('li').removeClass('active');
	    checkElement.slideUp('normal');
	  }
	  if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
	    $('#cssmenu ul ul:visible').slideUp('normal');
	    checkElement.slideDown('normal');
	  }
	  if($(this).closest('li').find('ul').children().length == 0) {
	    return true;
	  } else {
	    return false;	
	  }		
	});
	});
	});

</script>
<%@include file="../footer.jsp" %>