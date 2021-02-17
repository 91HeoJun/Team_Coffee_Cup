/**
 * 	파일첨부와 관련된 스크립트
 */



$(function() {

	
	// 게시글 등록시 첨부파일 히든태그로 추가
	$("button[type='submit']").click(function(e) {
		e.preventDefault();
		
		var str ="";
		// 첨부파일 영역에 정보 수집
		$(".uploadResult ul li").each(function(idx, obj) {
			var job = $(obj);
		
			str+= "<input type='hidden' name='attachList["+idx+"].uuid' value='"+job.data("uuid")+"'>"
			str+= "<input type='hidden' name='attachList["+idx+"].uploadPath' value='"+job.data("path")+"'>"
			str+= "<input type='hidden' name='attachList["+idx+"].fileName' value='"+job.data("filename")+"'>"
			str+= "<input type='hidden' name='attachList["+idx+"].fileType' value='"+job.data("type")+"'>"
		})
		console.log(str);
		
		// 1. 게시글 등록 후 폼 가져오기
		var form = $("form");
		// 2. 폼에 추가하기 
		form.append(str);
		// 3. 전송
		form.submit();
	})
	
	// 파일버튼이 클릭되어 변화가 일어나는 경우
	// 현재 목록의 파일을 서버로 보내서 저장하기
	$("input[type='file']").change(function() {
		console.log("upload 호출");
		
		var inputFile= $("input[name='uploadFile']");
		console.log(inputFile);

		// 첨부 파일 목록
		var files= inputFile[0].files;
		console.log(files);
      
		// <form> ~ </form> 대체로 ajax로 데이터를 쉽게 전송할 수 있도록 해줌
		var formData= new FormData();

		// 객체 안에 요소 추가
		for(var i=0; i<files.length; i++){
			formData.append("uploadFile",files[i]);
		}

		$.ajax({
			url: "/productAttach/upload/files",
			type: "post",
			processData: false,         //데이터를 query string 형태로 보낼 것인지. 결정(기본 application/x-www-form-urlencoded임)
			contentType: false,        //기본값은 application/x-www-form-urlencoded(파일 첨부 이므로 multipart/form-data 로 보내야함)
			data:formData,
			success: function(result) {
				console.log(result);
				showUploadedFile(result);
				$("input[name='uploadFile']").val("");
			},
			error: function(xhr,status,error) {
				console.log(status);
			}
		}) 
	}) // 파일 첨부 종료

	function showUploadedFile(uploadResultArr) {

	//결과를 보여줄 영역 가져오기
		var uploadResult = $(".uploadResult ul");
		var str= "";
		$(uploadResultArr).each(function(idx,obj) {  //idx ==index  obj 행
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
				str+="<img src='/productAttach/upload/productDisplay?fileName="+fileCallPath+"'><div>"+obj.fileName+"";
				str+="<button type='button' style='font-size:0.5em; color:white; padding:0px' class='btn btn-warning btn-circle' data-file='";
				str+=fileCallPath+"' data-type='image'>";
				str+="삭제";
				str+="</button>"
				str+="</div></li>";
			}else{
				//일반 파일 경로
				var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
				str+="<li style='list-style-type : none' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' ";
				str+="data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
				str+="<a href='/productAttach/upload/productDownload?fileName="+fileCallPath+"'>";
				str+="<img src='/resources/img/product/file.jpg'><div>"+obj.fileName+"</a>";
				str+="<button type='button' style='font-size:0.5em; color:white; padding:0px' data-file='";
				str+=fileCallPath+"' data-type='file'>";
				str+="삭제";
				str+="</button>"
				str+="</div></li>";
			}
		});
		uploadResult.append(str);
	} // 첨부파일 가져오기 종료

	$(".uploadResult").on("click", "button", function() {
		
		// 해당 파일 경로 / 타입 가져오기
		var targetFile = $(this).data("file");
		var targetType = $(this).data("type");

		// span 태그가 속한 부모 <li> 가져오기
		var targetLi = $(this).closest("li");

		// 화면 목록에서 제거 / 서버 폴더에서 제거
		$.ajax({
			url: '/productAttach/upload/productDeleteFile',
			type: 'post',
			data: {
				fileName: targetFile,
				type: targetType
			},
			success: function(result) {
				console.log(result);
				targetLi.remove();
			}
		})
	}) // x버튼 종료
})