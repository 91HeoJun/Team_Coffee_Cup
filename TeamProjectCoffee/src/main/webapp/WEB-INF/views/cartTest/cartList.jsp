<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../header.jsp" %>
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
<script>
$(function(){
	$("button").click(function(){
		location.href="/cart";
	})
})
</script>
<%@include file="../footer.jsp" %>