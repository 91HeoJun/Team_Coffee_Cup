<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<form class="cart" action="">
		<div>
			<label for="">상품 코드</label>
			<input type="text" name="pcode" id="" />
		</div>
		<div>
			<label for="">상품 이름</label>
			<input type="text" name="pname" id="" />
		</div>
		<div>
			<label for="">가격</label>
			<input type="text" name="price" id="" />
		</div>
		<div>
			<label for="">수량</label>
			<input type="text" name="amount" id="" />
		</div>
		<button id="inputCart" type="button">장바구니 담기</button>
		<button id="confirmCart" type="button">장바구니 확인</button>
	</form>
	<hr />
	
	
</body>
<script>
$(function(){
	
	$("#inputCart").click(function(data){
		var data = {
				pcode:$("input[name='pcode']").val(),
				pname:$("input[name='pname']").val(),
				price:$("input[name='price']").val(),
				amount:$("input[name='amount']").val()
		}
		console.log(data);
		
		$.ajax({
			type:'post',
			url:'/cart',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			success:function(result){
				console.log(result);
				if(result == "fail"){
					alert("재고가 부족합니다.");
				}
			}
		})
	})
	
	$("#confirmCart").click(function(){
		location.href="/confirmCart";
	})
})
</script>
</html>