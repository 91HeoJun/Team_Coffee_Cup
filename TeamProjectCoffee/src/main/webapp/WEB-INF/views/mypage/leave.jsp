<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
<%@include file="../footer.jsp" %>