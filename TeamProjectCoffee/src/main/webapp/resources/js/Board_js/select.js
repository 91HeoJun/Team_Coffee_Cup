/**
 * 	Select 자바스크립트
 */

$(function() {
	
	showList(1);
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
	
	// 댓글작성 활성화
	$("#addReplyBtn").click(function() {
		
		// 기본 디자인에서 댓글 입력을 위한 화면으로 변경
		modal.find("input").val("");
		
		// 댓글 작성 페이지의 readonly 속성 없애기
		modalInputReplyer.prop("readonly", "");
		// 작성일자 요소 숨기기
		modalInputReplyDate.closest("div").hide();
		// modal 닫기 버튼 이외 모든 버튼 숨김
		modal.find("button[id!='modalCloseBtn']").hide();
		// 추가버튼 보이기
		modalRegisterBtn.show();

		modal.modal("show");
		
	}) // 댓글 선택창 기본 end

	// 삽입(bno, reply, replyer)
	modalRegisterBtn.click(function() {
		
		var reply = {bno:bnoVal, reply:modalInputReply.val(), replyer:modalInputReplyer.val()};
		
		replyService.add(reply, function(result) {
			if(result) {
				//alert("result : " + result);

				// 성공메시지가 돌아오면
				// 모달창 내용 지우기
				modal.find("input").val();
				// 모달창 닫기
				modal.modal("hide");
				// 리스트 보여주기
				showList(-1);
			}
		});
	}) // add end

	// 댓글 리스트 가져오기 - 58/1
	function showList(page) {
		replyService.getList({bno:bnoVal, page:page}, function(total, data) {
			console.log(data);

			// 새글 작성시 http://localhost:8080/replies/pages/-1
			if(page == -1) {	// 마지막 페이지를 알아내기 위한 작업
				pageNum = Math.ceil(total/10.0);
				showList(pageNum);
				return;
			}
			
			// 보여줄 댓글이 없다면
			if(data == null || data.lenght == 0) {
				replyUl.html("");
				return;
			}

			// 보여줄 댓글이 존재한다면
			let str = "";
			for(var i=0, len=data.length||0;i<len; i++) {
				str += '<li class="left cearfix" data-rno="'+ data[i].rno +'">';
				str += '<div><div class="header">';
				str += '<strong class="primary-front">'+ data[i].replyer +'</strong>';
				str += '<small class="pull-right text-muted">'+ replyService.displayTime(data[i].replyDate) +'</small>';
				str += '<p>'+ data[i].reply +'</p>';
				str += '</div></div></li>';
			}
			replyUl.html(str);
			showReplyPage(total);
		});
	} // showList end
	
	// 댓글 페이지 영역
	var pageNum = 1;
	function showReplyPage(total) {
		console.log("total : " + total);
		
		// 마지막 페이지 / 시작페이지
		var endPage = Math.ceil(pageNum/10.0) * 10;
		var startPage = endPage - 9;
		var prev = startPage != 1;
		var next = false;

		if(endPage*10 >= total) {
			endPage = Math.ceil(total/10.0);
		}
		if(endPage*10 < total) {
			next = true;
		}

		var str = "<ul class='pagination pull-right'>";
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href='"+ (startPage-1) +"'>";
			str += "Previous</a></li>";
		}
		
		for(var i=startPage; i<=endPage; i++) {
			var active = pageNum == i?"active":"";
			str += "<li class='page-item "+ active +"'>"
			str += "<a class='page-link' href='"+ i +"'>"+ i +"</a></li>";
		}
		
		if(next) {
			str += "<li class='page-item'><a class='page-link' href='"+ (endPage-1) +"'>";
			str += "next</a></li>";
		}
		str +="</ul>";
		replyPageFooter.html(str);
	}

	// 댓글 페이지 번호 나누기 클릭 시 동작
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault();

		pageNum = $(this).attr("href");
		showList(pageNum);
	})

	// 댓글 삭제 - rno
	$(modalRemoveBtn).click(function() {
		
		// 로그인 여부 확인
		if(!replyer) {
			alert("로그인이 필요합니다.");
			modal.modal("hide");
			
			return;
		}
		
		// 로그인이 되었다면 로그인한 사용자와 모당창에 있는 사용자가 같은지 확인
		var originalReplyer = modalInputReplyer.val();
		
		if(originalReplyer != replyer) {
			alert("자신이 작성한 댓글만 삭제 가능합니다.")
			modal.modal("hide");
			
			return;
		}
		
		replyService.remove(modal.data("rno"), function(result) {
			if(result) {
				modal.modal("hide");
				showList(1);
			}
		});
	}) //remove end

	// 댓글 수정
	$(modalModBtn).click(function() {
		
		var modReply = {
			
			rno:modal.data("rno"), 
			reply:modalInputReply.val(), 
			replyer:modalInputReplyer.val()
			
			};
			
		// 로그인 여부 확인
		if(!replyer) {
			alert("로그인이 필요합니다.");
			modal.modal("hide");
			
			return;
		}
		
		// 로그인이 되었다면 로그인한 사용자와 모당창에 있는 사용자가 같은지 확인
		var originalReplyer = modalInputReplyer.val();
		
		if(originalReplyer != replyer) {
			alert("자신이 작성한 댓글만 수정이 가능합니다.")
			modal.modal("hide");
			
			return;
		}
		
		replyService.update(modReply, function(result) {
			if(result){
				//alert("result : " + result);
			
				modal.modal("hide");
				showList(pageNum);
			}
		});	
	}) // update end
	
	// 댓글 하나 가져오기
	// ******************** 이벤트 위임 : li태그는 나중에 생기는 요소이기 때문에,
	// ******************** 현재 있는 요소에 이벤트를 걸고 나중에 li 태그를 넘겨주는 방식
	$(replyUl).on("click", "li", function(){
		var rno = $(this).data("rno");
		console.log("rno : " + rno);

		replyService.get(rno, function(data) {
			if(data!=null) {
				console.log(data);
				
				//요청한 댓글 화면에 보여주기
				modalInputReply.val(data.reply);
				modalInputReplyer.val(data.replyer).attr("readonly", "readonly");
				modalInputReplyDate.val(replyService.displayTime(data.replyDate)).attr("readonly", "readonly");
				
				modal.data("rno", data.rno);
				
				// 숨겨졌던 작성 날짜 영역 다시 보이기
				modalInputReplyDate.closest("div").show();
				modal.find('button').show();
				modal.find("button[id='modalRegisterBtn']").hide();
				modal.modal("show");	
			}
		});
	}) //get end

	//첨부물
	// .read == 문서가 준비가 되면 이후 function 진행 
	$(document).ready(function() {
		
		var uploadResult = $(".uploadResult ul");
		
		$.getJSON({
			url: '/ClientBoard/getAttachList',
			data: {
				bno: bnoVal
				},
			success: function(data) {
				console.log(data);

				var str ="";
				
				$(data).each(function(idx,obj){
					if(obj.fileType) {
						//썸네일 이미지 경로
						var fileCallPath= encodeURIComponent(obj.uploadPath +"\\s_"+obj.uuid+"_"+obj.fileName);
						
						str+= "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
						str+= "<img src='/boardAttach/upload/boardDisplay?fileName="+fileCallPath+"'><div>"+obj.fileName;
						str+= "</div></li>";
						
					} else {						

						str+= "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
        				str+= "<img src='/resources/img/file.jpg'><div>"+obj.fileName+"</a>";
						str+= "</div></li>";

					}
				}) // each문 종료
				uploadResult.append(str)
			}
		}) // getJSON 종료
		
		// 이미지 클릭 시 원본 이미지 보여주기, 일반파일은 다운로드
		$(uploadResult).on("click", "li", function() {
			var liObj = $(this);
			var path = encodeURIComponent(liObj.data("path")+"\\"+liObj.data("uuid")+"_"+liObj.data("filename"));

				location.href = "/boardAttach/upload/boardDownload?fileName="+path;
		})
		
	})

})
