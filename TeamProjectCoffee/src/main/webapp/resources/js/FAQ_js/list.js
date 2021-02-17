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
			$(".modal-body").html(result + "번 내용이 등록되었습니다.");
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
	
	// 페이지 번호 클릭 submit
	$(".page-item a").click(function(e){
		e.preventDefault();
		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		actionForm.submit();
	})
	
	// 글 개수 반영
	$(".amount-form-control").change(function(){
		actionForm.find("input[name='amount']").val($(this).val());
		
		actionForm.submit();
	})
	
	// 검색 버튼 활성화
	$("#board-finder").click(function(){
		var searchData = $("#searchForm");
		
		var type = $("input[name='type']").val();
		var keyword = $("input[name='keyword']").val();
		
		if(type == '') {
			alert("검색 타입을 지정해주세요.");
			return false;
		} else if(keyword == '') {
			alert("검색어를 입력해주세요");
			return false;
		}
		
		searchData.find("input[name=pageNum]").val("1");
		searchData.submit();
		
	})
		
})