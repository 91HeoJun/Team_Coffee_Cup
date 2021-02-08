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
#cssmenu,
#cssmenu ul,
#cssmenu li,
#cssmenu a {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  font-weight: normal;
  text-decoration: none;
  line-height: 1;
  font-family: 'Open Sans', sans-serif;
  font-size: 14px;
  position: relative;

}
#cssmenu a {
  line-height: 1.3;
}
#cssmenu {
  width: 200px;
  background: #fff;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  padding: 3px;
  -moz-box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
  -webkit-box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.6);
  position: relative;
  left:200px;
  top:100px;
}
#cssmenu > ul > li {
  margin: 0 0 2px 0;
}
#cssmenu > ul > li:last-child {
  margin: 0;
}
#cssmenu > ul > li > a {
  font-size: 15px;
  display: block;
  color: #ffffff;
  text-shadow: 0 1px 1px #000;
  background: #565656;
  background: -moz-linear-gradient(#565656 0%, #323232 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #565656), color-stop(100%, #323232));
  background: -webkit-linear-gradient(#565656 0%, #323232 100%);
  background: linear-gradient(#565656 0%, #323232 100%);
  border: 1px solid #000;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
}
#cssmenu > ul > li > a > span {
  display: block;
  border: 1px solid #666666;
  padding: 6px 10px;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  font-weight: bold;
}
#cssmenu > ul > li > a:hover {
  text-decoration: none;
}
#cssmenu > ul > li.active {
  border-bottom: none;
}
#cssmenu > ul > li.active > a {
  background: #97be10;
  background: -moz-linear-gradient(#97be10 0%, #79980d 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #97be10), color-stop(100%, #79980d));
  background: -webkit-linear-gradient(#97be10 0%, #79980d 100%);
  background: linear-gradient(#97be10 0%, #79980d 100%);
  color: #fff;
  text-shadow: 0 1px 1px #000;
  border: 1px solid #79980d;
}
#cssmenu > ul > li.active > a span {
  border: 1px solid #97be10;
}
#cssmenu > ul > li.has-sub > a span {
  background: url(../resources/img/icon_plus.png) 98% center no-repeat;
}
#cssmenu > ul > li.has-sub.active > a span {
  background: url(../resources/img/icon_minus.png) 98% center no-repeat;
}
/* Sub menu */
#cssmenu ul ul {
  padding: 5px 12px;
  display: none;
}
#cssmenu ul ul li {
  padding: 3px 0;
}
#cssmenu ul ul a {
  display: block;
  color: #595959;
  font-size: 13px;
  font-weight: bold;
}
#cssmenu ul ul a:hover {
  color: #79980d;
}

</style>
<body id="body1">
<div id='cssmenu'>
<ul>
   <li class='active'><a href='../'><span>Home</span></a></li>
   <li class='has-sub'><a href='#'><span>회원정보</span></a>
      <ul>
         <li><a href='/mypage/userInfo'><span>회원정보 조회</span></a></li>
         <li><a href='/mypage/changeInfo'><span>회원정보 수정</span></a></li>
         <li class='last'><a href='/mypage/leave'><span>회원탈퇴</span></a></li>
      </ul>
   </li>
<!--    <li class='has-sub'><a href='#'><span>About</span></a>
      <ul>
         <li><a href='#'><span>Company</span></a></li>
         <li class='last'><a href='#'><span>Contact</span></a></li>
      </ul>
   </li>
   <li class='last'><a href='#'><span>Contact</span></a></li> -->
</ul>
</div>

</body>
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