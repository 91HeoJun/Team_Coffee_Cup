/**
 * 	List 자바스크립트
 */

$(function() {
	
	checkModal(result);
	
	// history 재지정
	history.replaceState({}, null, null);
	
	// 작성완료 모달
	function checkModal(result) {
		if(result == '' || history.state) {
			return;
		}
		
		if(parseInt(result)>0){
			$(".modal-body").html(result + "번 문의가 등록되었습니다.");
		}
		
		$("#myModal").modal("show");
	}
	
	// 페이지 이동시 사용할 폼
	var actionForm = $("#actionForm");
	
	// 제목 내용으로 상세 이동
	$(".move").click(function(e){
		e.preventDefault();
	
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "select");

		actionForm.submit();
	})
	

	
})