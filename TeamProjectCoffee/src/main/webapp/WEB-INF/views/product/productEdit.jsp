<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<%@ include file="../header.jsp" %>

</head>
<body>
    <h2>상품 정보 편집</h2>
   <form action="/product/productEdit" method="post" role="form">
        <!-- 파일 업로드를 하기위한 타입, 필수로 작성해야 한다.-->
        <table>
            <!-- 관리자로그인을 한 후에 들어갈 수 있는 상품정보 편집정보 -->
            <!-- 해당되는 자료들은 dto에서 가져와서 보여준다. -->
              <tr>
                <td>상품명</td>
                <td><input name="product"></td>
            </tr>
             <tr>
                <td>로스팅/제조일</td>
                <td><input type="date" name="pdate"></td>
            </tr>
             <tr>
                <td>상품종류</td>
                <td><input name="pcategory"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input name="price"></td>
            </tr>
            <tr>
                <td>상품상세</td>
                <td><textarea rows="5" cols="60" name="pcontent" id="pcontent"></textarea></td>
            </tr>
            <tr>
                <td>상품무게</td>
                <td><input id="pamount" name="pamount"/></td>
            </tr>  
             <tr>
                <td>상품원산지</td>
                <td><input id="origin" name="origin"/></td>
            </tr>      
            <tr>
                <td>상품이미지</td>
                <td><input type="file" name="image"></td>
            </tr>
        </table>
        <%-- 파일 등록 --%>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading"> 파일 첨부하기</div>
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name="uploadFile" id="" multiple />
									</div>
									<div class="uploadResult">
										<ul></ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button type="button" class="btn btn-outline-primary" id="modify">수정</button>
                	<button type="button" class="btn btn-outline-danger"  id="delete">삭제</button>                	
    </form>
</body>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
	
	$("#modify").click(function(){
		
	})
	
	$("#delete").click(function(){
		
	})
	
</script>
</html>
