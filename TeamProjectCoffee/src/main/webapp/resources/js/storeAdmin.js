/**
 *	storeAdmin 관련 js
 */
$(function(){
	
	//매장 추가 버튼의 collapse 기능을 위한 스크립트

	$("#collapse").click(function(){
		if($("#collapse").data("status")=='hide'){
			//console.log("show collapse");
			$("#addMarket").collapse("show");
			$("#collapse").data("status", "show");
		}
		if($("#collapse").data("status")=='show'){
			//console.log("hide collapse");
			$("#addMarket").collapse("hide");
			$("#collapse").data("status", "hide");
		}
	})
	
	//게시글 등록 버튼 동작시
	$("button[type='submit']").click(function(e){
		e.preventDefault();
		
		var str="";
		//첨부파일 영역의 정보 수집
		$(".uploadResult ul li").each(function(idx, obj){
			var job=$(obj);
			//수집된 정보를 hidden 태그로 작성
			str+="<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>";
			str+="<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>";
		})
		console.log(str);
		
		//hidden 태그를 게시글 등록 폼에 추가한 후 폼 전송하기
		//1) 게시글 등록 폼 가져오기
		var form = $("form");
		//2) 폼에 추가
		form.append(str);
		//3)전송
		form.submit();
	})
	
	//파일 버튼이 클릭되어 변화가 일어나는 경우
	//현재 목록의 파일을 서버로 보내 저장하기
	$("input[type='file']").change(function(){
		console.log("업로드 호출");
		
		var inputFile=$(this);
		
		//첨부파일 목록
		var files = inputFile[0].files;
		
		//ajax로 서버에 첨부파일 목록을 보내줌 : <form>~</form>을 대체
		var formData = new FormData();
		//객체 안에 요소 추가
		for(var i=0; i<files.length;i++){
			formData.append("uploadFile",files[i]);
		}
	
		//게시물 등록 전 : 첨부 파일은 먼저 서버에 저장된다.
		$.ajax({
			url:'/upload/files',
			type:'post',
			processData:false,	//데이터를 query string 형태로 보낼 것인지 결정(기본값 : application/x-www-form-urlencoded)
			contentType:false,	//기본값 : application/x-www-form-urlencoded(파일 첨부이므로 multipart/form-data로 보내야 함)
			data:formData,
//			beforeSend:function(xhr){
//				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
//			},
			success:function(result){
				showUploadedFile(result);
				$(this).val("");
			},
			error:function(xhr,status,error){
				console.log(status);
			}
		})
	})
	function showUploadedFile(uploadResultArr){
		//결과를 보여줄 영역 가져오기
		var uploadResult = $("#thumbnailPic ul");
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
				str+="<a href=\"javascript:showImage(\'"+originPath+"\')\">";
				//str+="<a href='javascript:showImage("+originPath+")'>";
				str+="<img src='/upload/display?fileName="+fileCallPath+"'><div>"+obj.fileName+"</a>";
				str+="<button type='button' class='btn btn-warning btn-circle' data-file='";
				str+=fileCallPath+"' data-type='image'>";
				str+="<i class='fa fa-times'></i>";
				str+="</button>"
				str+="</div></li>";
			}else{
				//일반 파일 경로
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
				str+="<li style='list-style-type : none' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' ";
				str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str+="<a href='/download?fileName="+fileCallPath+"'>";
				str+="<img src='/resources/img/file.jpg'><div>"+obj.fileName+"</a>";
				str+="<button type='button' class='btn btn-warning btn-circle' data-file='";
				str+=fileCallPath+"' data-type='file'>";
				str+="<i class='fa fa-times'></i>";
				str+="</button>"
				str+="</div></li>";
			}
		});
		uploadResult.append(str);
	}//showUploadedFile close
	
	//x 버튼 시작
	$("#thumbnailPic").on("click", "button", function(){
		//해당 파일 경로 가져오기
		var targetFile=$(this).data("file");
		//파일 타입 가져오기(image - 썸네일, 원본 삭제/file - 원본 삭제)
		var type=$(this).data("type");
		//span 태그가 속한 부모 li 태그 가져오기
		var targetLi=$(this).closest("li");
		
		//서버 폴더에서 제거
		$.ajax({
			url:'/deleteFile',
			type:'post',
			data:{
				fileName:targetFile,
				type:type
			},
			success:function(result){
				console.log(result);
				//화면 목록에서 제거
				targetLi.remove();
			}
		})
		
	})//x버튼 종료
	
	//크게 열린 이미지 다시 닫기
	$(".bigPictureWrapper").click(function(){
		$(".bigPicture").animate({width:'0%', height:'0%'}, 1000);
		setTimeout(function(){
			$(".bigPictureWrapper").hide();
		}, 1000);
	})//이미지 닫기 종료
})
function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display", "flex").show();
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
					.animate({width:'100%', height:'100%'}, 1000);
}
