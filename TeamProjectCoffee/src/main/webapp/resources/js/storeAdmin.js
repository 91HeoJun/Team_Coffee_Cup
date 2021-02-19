/**
 *	storeAdmin 관련 js
 */
$(function(){
	
	
	
	//매장 리스트에서 첨부물 보여주기
	$(".storeRows input[type='file']").each(function(){
		var code = $(this).data("code");
		//첨부물 리스트 가져오기	
		$.getJSON({
			url:"/store/getAttachList",
			data:{
				code:code
			},
			success:function(data){
				console.log(data);
				showUploadedFile(data, "#thumbnailPic"+code+" ul");				
			}
		});
		
	})
		
	//매장 추가 버튼의 collapse 기능을 위한 스크립트(완료)
	$("#collapse").click(function(){
		//if($("#collapse").data("status")=='hide'){
		if($(this).data("status")=='hide'){
			//console.log("show collapse");
			$("#addMarket").collapse("show");
			$(this).data("status", "show");
		}
		//if($("#collapse").data("status")=='show'){
		if($(this).data("status")=='show'){
			//console.log("hide collapse");
			$("#addMarket").collapse("hide");
			$(this).data("status", "hide");
		}
	})
	
	//게시글 등록 버튼 동작시
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
		var code = $(this).data("code");
		
		var str="";
		//첨부파일 영역의 정보 수집
		$("#thumbnailPic"+code+" ul li").each(function(idx, obj){
			var job=$(obj);
			console.log("첨부 파일 영역 정보 : "+job);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
		})
		console.log(str);
		
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1) 게시글 등록 폼 가져오기
		var form = $("#Form"+code);
		//2) 폼에 추가
		form.append(str);
		//3)전송
		form.submit();
	})
	
	//파일 버튼이 클릭되어 변화가 일어나는 경우(완료)
	//현재 목록의 파일을 서버로 보내 저장하기
	$("input[type='file']").change(function(){
		console.log("업로드 호출");
		
		var code = $(this).data("code");
		console.log("code : "+code);
		
		var inputFile=$(this);
		console.log(inputFile);
		
		//첨부파일 목록
		var files = inputFile[0].files;
		console.log(files);
		
		//ajax로 서버에 첨부파일 목록을 보내줌 : <form>~</form>을 대체
		var formData = new FormData();
		//객체 안에 요소 추가
		for(var i=0; i<files.length;i++){
			formData.append("uploadFile",files[i]);
		}
		$(this).val("");
		//게시물 등록 전 : 첨부 파일은 먼저 서버에 저장된다.
		$.ajax({
			url:'/upload/files',
			type:'post',
			processData:false,	//데이터를 query string 형태로 보낼 것인지 결정(기본값 : application/x-www-form-urlencoded)
			contentType:false,	//기본값 : application/x-www-form-urlencoded(파일 첨부이므로 multipart/form-data로 보내야 함)
			data:formData,
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				showUploadedFile(result, "#thumbnailPic"+code+" ul");
				
			},
			error:function(xhr,status,error){
				console.log(status);
			}
		})
	})
	//첨부파일 보여주기
	function showUploadedFile(uploadResultArr, id){
		//결과를 보여줄 영역 가져오기
		var uploadResult = $(id);
		var str="";
		$(uploadResultArr).each(function(idx, obj){
			if(obj.fileType){			
				//썸네일 이미지 경로
				//자바스크립트 : 인코딩함수 - encodeURIComponent();
				//경로 생성 시 (한글 포함 가능) 인코딩 필요
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\s_"+obj.uuid+"_"+obj.fileName);
				//원본 이미지 경로
				var originPath = obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName;
				
				//???
				originPath = originPath.replace(new RegExp(/\\/g), "/");
				
				str+="<li style='list-style-type : none' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' ";
				str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				//str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">";
				str+="<img src='/upload/display?fileName="+fileCallPath+"'><div>"+obj.fileName+"";
				str+="<button type='button' style='font-size:0.5em;color:white; padding:0px' class='btn btn-circle xbtn' data-file='";
				str+=fileCallPath+"' data-type='image'>";
				str+="삭제";
				str+="</button>"
				str+="</div></li>";
			}else{
				//일반 파일 경로
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
				str+="<li style='list-style-type : none' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' ";
				str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str+="<a href='/download?fileName="+fileCallPath+"'>";
				str+="<img src='/resources/img/file.jpg'><div>"+obj.fileName+"</a>";
				str+="<button type='button' style='font-size:0.5em;color:white; padding:0px' class='btn btn-circle xbtn' data-file='";
				str+=fileCallPath+"' data-type='file'>";
				str+="삭제";
				str+="</button>"
				str+="</div></li>";
			}
		});
		uploadResult.append(str);
	}//showUploadedFile close
	
	//x 버튼 시작
	$("#thumbnailPic0").on("click", "button", function(){
		console.log("첨부 파일 삭제");
		//해당 파일 경로 가져오기
		var targetFile=$(this).data("file");
		//파일 타입 가져오기(image - 썸네일, 원본 삭제/file - 원본 삭제)
		var type=$(this).data("type");
		//span 태그가 속한 부모 li 태그 가져오기
		var targetLi=$(this).closest("li");
		
		//서버 폴더에서 제거
		$.ajax({
			url:'/upload/deleteFile',
			type:'post',
			data:{
				fileName:targetFile,
				type:type
			},
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			success:function(result){
				console.log(result);
				//화면 목록에서 제거
				targetLi.remove();
			}
		})	
	})//x버튼 종료
	
	//x 버튼 시작 - 이벤트 위임
	$(".thumbnailList").on("click", "button", function(e){
		//이벤트 전파 막기
		e.stopPropagation();
		
		if(confirm("정말로 파일을 삭제하시겠습니까?")){			
			//span 태그가 속한 부모 li 태그 가져오기
			var targetLi=$(this).closest("li");
			targetLi.remove();
		}	
	})//x버튼 종료
	
	//수정 버튼 누름
	/*$(".modify").click(function(){
		
		var code = $(this).data("code");
		var btnText = $(this).text();
		
		if(btnText=='수정'){
			$(this).text('완료');
		}else{
			$(this).text('수정');			
		}	
		
		//해당 버튼 위치 code값 가져오기
		$("#pic"+code).toggle();		
	});*/

	$(".modify").click(function(){
		//현재 버튼		
		var btn = $(this);
		//해당 버튼 위치 code값 가져오기
		var code = $(this).data("code");
		console.log("modify : "+code);
		//현재 버튼 상태
		var btnTxt = $(this).text();
		
		//매장 데이터 영역 가져오기
		var name = $("#modifyName"+code);
		var address = $("#modifyAddress"+code);
		
		//if($("#collapse").data("status")=='hide'){
		if(btnTxt=='수정'){
			btn.text("완료");
			//console.log("show collapse");
			$("#pic"+code).toggle();
			$("#cancel"+code).toggle();
			btn.data("status", "complete");
			
			//수정 가능한 상태로 바꾸기
			name.attr("readonly", false).focus();
			address.attr("readonly", false);
		}
		//if($("#collapse").data("status")=='show'){
		if(btnTxt=='완료'){//완료 버튼을 눌렀을 때
			var code = $(this).data("code");
		
			var str="";
			//첨부파일 영역의 정보 수집
			$("#thumbnailPic"+code+" ul li").each(function(idx, obj){
				var job=$(obj);
				console.log("첨부 파일 영역 정보 : "+job);
				//수집된 정보를 hidden 태그로 작성
				str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
				str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
			})
			
			var form = $("#Form"+code);
			//2) 폼에 추가
			form.append(str);
			//3)전송
			form.submit();			
		}
				
	})
	
	//게시물 삭제
	$(".delete").click(function(){
		//삭제할 code 가져오기
		var code = $(this).data("code");
		console.log("매장 삭제 버튼 클릭 : "+code);
		
		$.ajax({
			url:"/store/"+code,
			type:'delete',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			success:function(data){
				if(data=="success"){
					location.href="/store/admin";
				}else{
					alert("delete fail");
				}
			}
		})
	})
	
})
function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', height:'100%'}, 1000);
}
