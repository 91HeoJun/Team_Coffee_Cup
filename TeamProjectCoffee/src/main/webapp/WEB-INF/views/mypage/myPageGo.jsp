<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
<body>
<div class="form-group text-center" style="margin-top:40px">
<h1 style="color:black;">${auth.name}님 환영합니다.</h1>
</div>
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
            <li><a href="/mypage/changeInfo"><i class="fas fa-pencil-alt icon" ></i> 회원정보</a></li>
            <li><a href="/mypage/leave"><i class="fas fa-paper-plane icon" ></i> 회원탈퇴</a></li>
          </ul>
        </li>
      </ul>
  </div>
</div>
</div>

</body>
</html>