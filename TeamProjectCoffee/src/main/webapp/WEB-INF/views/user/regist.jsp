<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../header.jsp" %>
<link href="/resources/css/signin.css" rel="stylesheet" />
    <!-- <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    /> -->
	<div class="title">
	    <label for="textarea1" id="textarea1">Join</label>
	</div>
      <form class="regist" id="regist" method="post">
    	<div class="input">
        <div class="form-group row justify-content-center">
          <label id="label" for="userid" class="col-sm-2 col-form-label">아이디</label>
          <div class="col-sm-6">
            <input
              type="text"
              name="userid"
              id="userid"
              class="form-control"
              placeholder="아이디를 입력하세요"
            />
            <small id="userid" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label id="label" for="pass1" class="col-sm-2 col-form-label">비밀번호</label>
          <div class="col-sm-6">
            <input
              type="password"
              name="password"
              id="password"
              class="form-control"
              placeholder="비밀번호를 입력하세요"
            />
            <small id="password" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label id="label" for="pass2" class="col-sm-2 col-form-label"
            >비밀번호 확인
          </label>
          <div class="col-sm-6">
            <input
              type="password"
              name="confirm_password"
              id="confirm_password"
              class="form-control"
              placeholder="비밀번호를 다시 입력하세요"
            />
            <small id="confirm_password" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label id="label" for="username" class="col-sm-2 col-form-label">이름 </label>
          <div class="col-sm-6">
            <input
              type="text"
              name="name"
              id="name"
              class="form-control"
              placeholder="이름을 입력하세요"
            />
            <small id="name" class="text-info"></small>
          </div>
          </div>
          <div class="form-group row justify-content-center">
          <label id="label" for="addr" class="col-sm-2 col-form-label">주소 </label>
          	<div class="col-sm-6">
				<input type="text" name="postCode" id="sample6_postcode" placeholder="우편번호">
				<input type="button" class="postbtn" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
				<small id="postCode" class="text-info"></small>
				<input type="text" name="address" id="sample6_address" class="form-control" placeholder="주소"><br>
				<small id="address" class="text-info"></small>
				<input type="text" name="detailAddress" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
				<br/>
				<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목">
			</div>
          </div>		
        <div class="form-group row justify-content-center">
          <label id="label" for="email" class="col-sm-2 col-form-label">이메일</label>
          <div class="col-sm-6">
            <input
              type="email"
              name="email"
              id="email"
              class="form-control"
              placeholder="example@gmail.com"
            />
            <small id="email" class="text-info"></small>
          </div>
        </div>
        <div class="form-group row justify-content-center">
          <label id="label" for="tel" class="col-sm-2 col-form-label">모바일 </label>
          <div class="col-sm-6">
            <input
              type="text"
              name="tel"
              id="tel"
              class="form-control"
              placeholder="모바일을 입력하세요"
            />
            <small id="tel" class="text-info"></small>
          </div>
        </div>

        <div class="form-group text-center">
          <button type="submit" class="btn btn-primary">회원가입</button>
          <button type="reset" class="btn btn-secondary">취소</button>
        </div>
    	</div>
    	<!-- security : 이대우 -->
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
 	<!-- <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script> -->
	<script src="/resources/js/join.js"></script>
<%@include file="../footer.jsp" %>
</body>
</html>