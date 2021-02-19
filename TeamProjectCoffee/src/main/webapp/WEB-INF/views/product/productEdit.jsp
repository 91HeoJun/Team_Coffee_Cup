<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<%@ include file="../header.jsp" %>

</head>
<body style="margin-top:20px;margin-left:100px;margin-right:100px">
    <h2>상품 정보 수정</h2>   
    <!-- 파일 업로드를 하기위한 타입, 필수로 작성해야 한다.-->
      <div class="panel-body" style="margin-top:20px;">
   			<form action="" role="form" method="post" enctype="multipart/form-data">
   				<div class="form-group">
   					<label>상품코드</label>
   					<input class="form-control" name="pcode" value="${selectProduct.pcode}" readonly="readonly">                				
   				</div> 
   				<div class="form-group">
   					<label>상품 종류</label>
   					<input class="form-control" name="pcategory" value="${selectProduct.pcategory}" readonly="readonly">                				
   				</div>  
   				<div class="form-group">
   					<label>상품명</label>
   					<textarea class="form-control" rows="3" name="product" readonly="readonly">${selectProduct.product}</textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>로스팅일(제조일)</label>
   					<textarea class="form-control" rows="3" name="pdate" readonly="readonly"> <fmt:formatDate value="${selectProduct.pdate}" pattern="yyyy-MM-dd"/></textarea>               				
   				</div> 
   				<div class="form-group">
   					<label>무게</label>
   					<textarea class="form-control" rows="3" name="pamount" readonly="readonly" >${selectProduct.pamount}</textarea>               				
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
   					<img src="" style="width:100px;height:100px" id="productimg">    					      				
   				</div> 
   				<div>
   					<input type="file" name="image"/>  
   				</div>
   				<div class = "buttons" style = "margin-top:5px" >
					<button type="button" class="btn btn-warning" id="modify">수정</button>
                	<button type="button" class="btn btn-outline-danger"  id="delete">삭제</button>    
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" value="${selectProduct.pcode}" name="pcode"/>
                	<input type="hidden" value="${cri.pageNum}" name="pageNum" />
                </div>            	
   		 </form>   
   	</div>
</body>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>

var pcode= ${selectProduct.pcode};	
</script>
<script src="/resources/js/Product_js/productEdit.js"></script>
</html>
