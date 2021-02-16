/**
 * 	Select 자바스크립트
 */

$(function() {
	
	// Hidden 폼
	var form = $("#myform");
	
	// 수정버튼 submit
	$("#modify-button").click(function() {
		form.submit();
	})
	
	// 목록으로 버튼 활성화
	$("#gotolist-button").click(function() {
		form.find("input[name='bno']").remove();
		form.attr('action', 'list');

		form.submit();
	})

})
