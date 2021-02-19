<%@page import="com.company.domain.RegisterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<head>
<fmt:requestEncoding value="utf-8"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!--  <link rel="stylesheet" href="/resources/css/changeInfo.css">-->

<%-- validate 코드  --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
<script src="/resources/js/changeInfo.js"></script>
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">

</div>
</head>
<style>
#left_bar{
border: 2px solid;
border-radius: 10px;
}
#left_bar > li{
border-bottom: 1px solid;
}

.eTooltip {
    position: relative;
    display: inline-block;
}
.ec-base-tooltip {
    z-index: 2;
    position: absolute;
    background: #fff;
}
.ec-base-tooltip.typeUpper {
    top: auto;
    left:100px;
    bottom: 10px;
    width: 250px;
}
.ec-base-tooltip .txtWarn {
    font: 0.75em Verdana,Dotum,AppleGothic,sans-serif;
    color: #f65b54 !important;
}

.ec-base-tooltip .btnClose {
    position: absolute;
    right: 14px;
    top: 14px;
}
.ec-base-table.typeWrite img {
    max-width: 100% !important;
    height: auto !important;
}

.nav-link {
color:black !important;
}
</style>
<body>
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
	<div class="title">
		<h1 class="form-group row justify-content-center">c h a n g e I n f o</h1>
	</div>
			<form action="changeInfo" name="_frmForm" id="_frmForm" method="post">
					<div class="form-group row justify-content-center">
                    <label for="userid" class="col-sm-2 col-form-label" >아이디</label>
                    <div class="col-sm-6">
                        <input type="text" name="userid" id="userid" class="form-control" value="${regist.userid}" readonly/>
                         <small id="userid" class="text-info"></small>
                    </div>
                </div>
                <div class="form-group row justify-content-center">
                    <label for="name" class="col-sm-2 col-form-label">이름 </label>
                    <div class="col-sm-6">
                        <input type="text" name="name" id="name" class="form-control" value="${regist.name}" readonly/>
                        <small id="name" class="text-info"></small>
                    </div>
                </div>
                <input type="hidden" name="password" value="password"/>
			  	<!--<div class="form-group row justify-content-center">
					<label for="password" class="col-sm-2 col-form-label">현재 비밀번호</label>
					<div class="col-sm-6">
						<input type="password" name="password"
							id="password" class="form-control"
							value="${regist.password}"/> <small id="password"
							class="text-info"></small>
					</div>
				</div>-->
           <div class="form-group row justify-content-center">
           <label for="password" class="col-sm-2 col-form-label">새 비밀번호</label>
           <div class="col-sm-6">
					<div class="eTooltip">
						<input type="password" name="new_password" id = "new_password" class="form-control" placeholder="새 비밀번호 입력" style="width:390px;"/>
                      <div class="ec-base-tooltip typeUpper" style="display:none;">
                            <div class="content">
                                <strong class="txtWarn">※ 비밀번호 입력 조건</strong>
                                <ul class="ec-base-help typeDash gBlank10 txtWarn">
                                    
                - 영대소문자, 숫자, 특수문자<br>
                - 조합으로 8~15자리<br>
                - 입력 가능 특수문자 <br>
                &nbsp;  !  @  #  $   %  ^ *<br>
                - 공백 입력 불가능                                </ul>
                            <a href="#none" class="btnClose"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close_tip.gif" alt="닫기"/></a>
                            <span class="edge"></span>
                        </div>
                    </div>
					</div>
					 </div>
                </div>

				<div class="form-group row justify-content-center">
					<label for="email" class="col-sm-2 col-form-label">비밀번호
						확인</label>
					<div class="col-sm-6">
						<input type="password" name="confirm_password"
							id="confirm_password" class="form-control"
							placeholder="새 비밀번호 확인" /> <small id="confirm_password"
							class="text-info"></small>
					</div>
				</div>

				<div class="form-group row justify-content-center">
                    <label for = "email" class="col-sm-2 col-form-label" >이메일</label>
                    <div class="col-sm-6">
                        <input type="email" name="email" id="email" class="form-control" value="${regist.email}"/>
                        <small id="email" class="text-info"></small>
                    </div>
                </div>
                
                <div class="form-group row justify-content-center">
                    <label for="tel" class="col-sm-2 col-form-label">전화번호 </label>
                    <div class="col-sm-6">
                        <input type="text" name="tel" id="tel" class="form-control" value="${regist.tel}" />
                        <small id="tel" class="text-info"></small>
                    </div>
                </div>
				<!-- 주소API-->
					<div class="form-group row justify-content-center">
					<label for="addr" class="col-sm-2 col-form-label" >우편번호 </label>
     				 <div class="col-sm-6">
						<input type="text" name="postCode" id="sample2_postcode" placeholder="우편번호" value="${regist.postCode}" style="width:250px; padding-left: 10px !important;">
						<input type="button" class="btn_s_gray btn_100_41" onclick="sample2_execDaumPostcode()" value="주소검색" size="15" style="padding-left: 0 !important;">
	                </div>
               </div>
                    <div class="form-group row justify-content-center">
                    <label for="addr" class="col-sm-2 col-form-label">주소 </label>
                    <div class="col-sm-6">
						<input type="text" name="address" id="sample2_address"   class="form-control" placeholder="주소" value="${regist.address}" data-msg="주소" >
				</div> 
				</div>
				  <div class="form-group row justify-content-center">
                    <label for="addr" class="col-sm-2 col-form-label">상세주소 </label>
                    <div class="col-sm-6">
					<input type="text" name="detailAddress" id="sample2_detailAddress"  class="form-control" placeholder="상세주소" value="${regist.detailAddress}" >
					<input type="hidden" id="sample2_extraAddress" placeholder="참고항목" size="20">				
				</div> 
				</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-secondary" id="_btnInfo">확인</button>
				<button type="button" class="btn btn-secondary" id="changecancel" onclick="location.href='/mypage/myPageGo'">취소</button>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			</form>
			</div>
		</div>
</div>

<script>
 
    $(".eTooltip").find('input').focus(function(){
    	 var targetName = returnTagetName(this);
    	    targetName.siblings('.ec-base-tooltip').show();
    	});
    $('.eTooltip').find('input').focusout(function() {
        var targetName = returnTagetName(this);
        targetName.siblings('.ec-base-tooltip').hide();
    });
    function returnTagetName(_this){
        var eplacename = $(_this).parent().attr("class");
        var targetName;
        if(eplacename == "ePlaceholder"){
            targetName = $(_this).parents();
        }else{
            targetName = $(_this);
        }
        return targetName;
    }
</script>
 <script>
$("#_btnInfo").click(function(){
	if(confirm("회원정보를 수정하시겠습니까?") == true){
		$('#_frmForm').submit();
		alert("완료되었습니다. 다시 로그인해주세요.");
	} else{
		return false;
	}
});
</script>



<!-- 다음 주소 API -->
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }

</script>
</body>

<%@ include file="../footer.jsp" %> 