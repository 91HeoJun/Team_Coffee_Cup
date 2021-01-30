<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${auth.name}회원님의 상세정보 페이지 입니다.</h1>

<div>이곳에 가입된 회원정보 보여줄 예정</div>

<button type="submit" class="btn btn-primary" onclick="location.href='/mypage/changeInfo'">정보수정</button>
<button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	

</body>
</html>