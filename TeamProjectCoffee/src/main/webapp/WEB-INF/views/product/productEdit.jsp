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
      <div class="panel-body">
   			<form action="" role="form" method="">
   				<div class="form-group">
   					<label>상품코드</label>
   					<input class="form-control" name="pcode" value="${selectProduct.pcode}" >                				
   				</div> 
   				<div class="form-group">
   					<label>상품 종류</label>
   					<input class="form-control" name="pcategory" value="${selectProduct.pcategory}" >                				
   				</div>  
   				<div class="form-group">
   					<label>상품명</label>
   					<textarea class="form-control" rows="3" name="product">${selectProduct.product}</textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>로스팅일(제조일)</label>
   					<textarea class="form-control" rows="3" name="pdate"> <fmt:formatDate value="${selectProduct.pdate}" pattern="yyyy-MM-dd"/></textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>무게</label>
   					<textarea class="form-control" rows="3" name="pamount" >${selectProduct.pamount}</textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>상세 설명</label>
   					<textarea class="form-control" rows="3" name="pcontent" >${selectProduct.pcontent}</textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>가격</label>
   					<textarea class="form-control" rows="3" name="price" >${selectProduct.price}</textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>상품이미지</label>
   					<img src="/resources/productimg/<c:out value="${selectProduct.attach.uuid}"/>_<c:out value="${vo.attach.fileName}"/>" style="width:100px;height:100px">            				
   				</div> 
					<button type="button" class="btn btn-outline-primary" id="modify">수정</button>
                	<button type="button" class="btn btn-outline-danger"  id="delete">삭제</button>                	
    </form>
</body>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
	
	var pcode= ${selectProduct.pcode};
	
}
	
	$("#modify").click(function(){
		
	})
	
	$("#delete").click(function(){
		
	})
	
</script>
</html>
