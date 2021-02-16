<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="/resources/css/signin.css" rel="stylesheet" />
</head>
<body>
<div class="container">
<form action="step2" method="post">	
	<div class="form-group">
		<div class="title">
	    	<label for="textarea1" id="textarea1">개인정보 수집 및 이용 동의</label>
	    </div>
	    <textarea class="form-control" id="textarea1" rows="20">
수집하는 개인정보 항목

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

ο 수집항목 : 이름, 생년월일, 로그인ID, 비밀번호, 비밀번호 질문과 답변, 자택 주소, 휴대전화번호, 이메일 서비스 이용기록, 접속 로그, 접속 IP 정보, 결제기록

ο 개인정보 수집방법 : 홈페이지(회원가입), 서면양식



개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송

ο 회원 관리

회원제 서비스 이용에 따른 본인확인, 개인 식별, 연령확인, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 고지사항 전달

ο 마케팅 및 광고에 활용

접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계



개인정보의 보유 및 이용기간

회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
    
</textarea>
</div>
<label id="textarea1" style="font-size:16px;">
<input type="checkbox" id="agree" name="agree" value="true"> 약관동의
</label>
<!-- security : 이대우 -->
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="submit" class="btn btn-primary btn-sm" value="다음단계">
</form>	
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.js" integrity="sha256-DrT5NfxfbHvMHux31Lkhxg42LY6of8TaYyK50jnxRnM=" crossorigin="anonymous"></script>
<script>
$(function(){
	$('.btn').click(function(e){
		e.preventDefault();
		var check=$("#agree").is(":checked");
		if(!check){
			alert("약관에 동의를 해주세요");
			return;
		}else{
			$("form").submit();
		}
	})
	
})
</script>
<%@include file="../footer.jsp" %>
</body>
</html>

