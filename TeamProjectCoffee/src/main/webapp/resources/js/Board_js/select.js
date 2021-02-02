/**
 * 	Select 자바스크립트
 */

$(function() {

	// Hidden 폼
	// 페이지 나누기 후 재활성화 필요
//	showList(1);

	var form = $("#myform");
	
	// 수정버튼 submit
	$(".btn-default").click(function() {
		form.submit();
	})
	
	// 목록으로 버튼 활성화
	$(".btn-info").click(function() {
		form.find("input[name='bno']").remove();
		form.attr('action', 'list');

		form.submit();
	})

	
})
