/**
 *  update 자바스크립트
 */

$(function() {
	var form = $("#myform");
	
	$("button").click(function(e){
		e.preventDefault(); // 서브밋 기능 막기
		
		var oper = $(this).data("oper");
		console.log(oper);
		
		if (oper == 'remove') {	// 삭제
			console.log("삭제까지는 들어왔음");
			form.attr("action", "remove");
			
		
		} else if(oper =='update'){	// 수정
			form = $("form[role='form']");
		
		
		}else if(oper =='list'){	// 리스트
			form.attr("action", "list")
				.attr("method", "get");
		
			// 폼 안의 bno 삭제하기
			form.find("input[name='bno']").remove();
		}
		
		form.submit();
	})
})
