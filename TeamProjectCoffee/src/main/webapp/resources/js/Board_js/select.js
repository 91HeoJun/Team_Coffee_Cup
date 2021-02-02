/**
 * 	Select 자바스크립트
 */


/* 작업해야함 0202*/
$(function() {

	showList(1);
	var form = $("#myform");
	
	$(".btn-default").click(function() {
		form.submit();
	})
	
	$(".btn-info").click(function() {
		form.find("input[name='bno']").remove();
		form.attr('action', 'list');

		form.submit();
	})

	
})
