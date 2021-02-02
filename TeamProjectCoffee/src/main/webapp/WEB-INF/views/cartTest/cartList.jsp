<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 리스트</h1>
	<hr />
	<c:forEach items="${cartList}" var="cart">
		<div>
			<label for="">상품 코드</label>
			<input type="text" id="" value='<c:out value="${cart.pcode}"></c:out>'/>
		</div>
		<div>
			<label for="">상품 이름</label>
			<input type="text" id="" value='<c:out value="${cart.pname}"></c:out>'/>
		</div>
		<div>
			<label for="">가격</label>
			<input type="text"  id="" value='<c:out value="${cart.price}"></c:out>'/>
		</div>
		<div>
			<label for="">수량</label>
			<input type="text" id="" value='<c:out value="${cart.amount}"></c:out>'/>
		</div>
		<hr />
	</c:forEach>
	<div>
		<button type="button">상품 담기</button>
	</div>
</body>
<script>
$(function(){
	$("button").click(function(){
		location.href="/cart";
	})
})
</script>
</html>