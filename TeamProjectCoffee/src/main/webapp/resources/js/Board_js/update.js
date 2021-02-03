/**
 *  update 자바스크립트
 */

$(function() {
	var form = $("#myform");
	
	$("button").click(function(e){
		e.preventDefault();
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if (oper == 'remove') {
			form.attr("action", "remove");
			
		
		} else if(oper =='update') {
			form = $("form[role='form']");
		
		
		}else if(oper =='list') {
			form.attr("action", "list")
				.attr("method", "get");
		
			// 폼 안의 bno 삭제하기
			form.find("input[name='bno']").remove();
		}
		
		form.submit();
	})
})
