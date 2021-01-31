<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${regist.name}회원님의 상세정보 페이지 입니다.</h1>


<form action="">
		<div>이름 : <input type="text" name="name" id="name" value="${regist.name}" readonly="readonly"> </div>
		<div>아이디 : <input type="text" name="userid" id="id" value="${regist.userid}" readonly="readonly"> </div>
		<div>이메일 : <input type="text" name="email" id="id" value="${regist.email}" readonly="readonly"> </div>
		<div>핸드폰번호 : <input type="text" name="tel" id="id" value="${regist.tel}" readonly="readonly"> </div>
		<div>주소 : <input type="text" name="addr" id="id" value="${regist.addr}" readonly="readonly"> </div>
</form>
<div>
<button type="submit" class="btn btn-primary" onclick="location.href='/mypage/changeInfo'">정보수정</button>
<button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	
</div>
</body>
</html>