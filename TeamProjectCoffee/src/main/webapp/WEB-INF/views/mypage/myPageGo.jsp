<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
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
	<link rel="stylesheet" href="/resources/css/store.css" />
    <div class="container">
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
            <form id="mypageGO" action="">
	<div class="title" style="color:#000;">
		mypage main
	</div>
                <div class="form-group row justify-content-center">
                    <label for="userid" class="col-sm-2 col-form-label" >미정</label>
                    <div class="col-sm-4">
                        <input type="text" name="userid" id="userid" class="form-control" value="${regist.userid}" readonly/>
                         <small id="userid" class="text-info"></small>
                    </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="name" class="col-sm-2 col-form-label">미정 </label>
                    <div class="col-sm-4">
                        <input type="text" name="name" id="name" class="form-control" value="${regist.name}" readonly/>
                        <small id="name" class="text-info"></small>
                    </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for = "email" class="col-sm-2 col-form-label" >미정 </label>
                    <div class="col-sm-4">
                        <input type="email" name="email" id="email" class="form-control" value="${regist.email}"readonly/>
                        <small id="email" class="text-info"></small>
                    </div>
                </div>
                
                <div class="form-group row justify-content-center">
                    <label for="tel" class="col-sm-2 col-form-label">미정  </label>
                    <div class="col-sm-4">
                        <input type="text" name="tel" id="tel" class="form-control" value="${regist.tel}" readonly/>
                        <small id="tel" class="text-info"></small>
                    </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="addr" class="col-sm-2 col-form-label">미정  </label>
                    <div class="col-sm-4">
                        <input type="text" name="postCode" id="postCode" class="form-control" value="${regist.postCode}" readonly/>
                        <small id="postCode" class="text-info"></small>
                </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="addr" class="col-sm-2 col-form-label">미정  </label>
                    <div class="col-sm-4">
                        <input type="text" name="address" id="address" class="form-control" value="${regist.address}" readonly/>
                        <small id="address" class="text-info"></small>
                    </div>
                </div>
                
                <div class="form-group row justify-content-center">
                    <label for="addr" class="col-sm-2 col-form-label">미정  </label>
                    <div class="col-sm-4">
                        <input type="text" name="detailAddress" id="detailAddress" class="form-control" value="${regist.detailAddress}" readonly/>
                        <small id="detailAddress" class="text-info"></small>
                    </div>
                </div> 
                <div></div>
<!--                  <div class="form-group text-center">
				<button type="submit" class="btn btn-primary" onclick="location.href='/mypage/changeInfo'">정보변경하기</button>
				<button type="submit" class="btn btn-danger" onclick="location.href='/mypage/leave'">탈퇴하기</button>	
					</div>  -->
            </form>
</div>
</div>
</div>
</html>
<%@ include file="../footer.jsp" %>