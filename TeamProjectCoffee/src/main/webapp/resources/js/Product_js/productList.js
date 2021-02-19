/**
 *  Product List Java Script File
 */

$(function() {
	

	var actionForm = $("#actionForm");

	$(".move").click(function(e){
		e.preventDefault();
	
		actionForm.append("<input type='hidden' name='pcode' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "productDetail");

		actionForm.submit();
	})
	
	
	
	//페이지 번호 클릭시 동작
	$(".page-item a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
		//pageNum의 값을 사용자가 선택한 값으로 변경
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})
	
	
	
	$(".roast a").click(function(e){
		//a 태그의 기능을 중지
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='type']").val("g");
		actionForm.find("input[name='keyword']").val($(this).data("roast"));
		actionForm.submit();
	})	

	//type=> pconent(c), pcategory(g)
	//keyword => 메뉴명
	$("#option1,#option2,#option3,#option4").click(function(){
		console.log("상품 종류별 클릭");
		console.log($(this).val());
		
		
		actionForm.find("input[name='pageNum']").val("1");
		actionForm.find("input[name='type']").val("c");
		actionForm.find("input[name='keyword']").val($(this).val());
		actionForm.attr("action", "productList");
		actionForm.submit();
	});
	
	
	$("#cart").click(function(){
		location.href="/cart/cartList";
	});
})

