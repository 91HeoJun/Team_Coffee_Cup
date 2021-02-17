/**
 * 
 */

$(function(){
		//페이지 불러올 때 페이지 리스트 가져오기
		$.getJSON({
			url:"/store/storeList",
			success:function(data){
				
				console.log(data);
				
				var str="";
				
				$(data).each(function(idx, obj){
					str+="<li id='list"+idx+"' class='storemenu' data-code='"+obj.code+"'><a>"+obj.name+"</a></li>";
				})
				$(".menu").append(str);
				
				$("#list0").attr("class", "storemenu activated");
				var code = $("#list0").data("code");
				console.log("code : "+code);
				setStoreInfo(code);
			}
		})
		
		function setStoreInfo(code){
		
		$.getJSON({
			url:"/store/getStore",
			data:{
				code:code
			},
			success:function(data){
				
				console.log("data : "+data);
				
				var str = "";
				
				$(data.attachList).each(function(idx, obj){
					var fileCallPath = encodeURIComponent(obj.uploadPath+"\\"+obj.uuid+"_"+obj.fileName);
					str+="<img class='rounded store-img' alt='' src='/upload/display?fileName="+fileCallPath+"' style='width: 100%; height: auto'>"
				})
				
				str+="<h3 class='name' style='font-size: 1em; margin-top: 1em'>"+data.name+"</h3>"	
				str+="<h3 class='address' style='font-size: 1em; margin-top: 1em'>"+data.address+"</h3>"
				
				$(".storeInfo").html(str);
				
				searchMap();
			}
		})
	}
		//sidebar toggle
		$("#sidebarCollapse").click(function(){
			$("#sidebar").toggle();
		})
		
		
		//리스트 클릭 시 해당 매장 정보 보여주기
		//이벤트(리스트 클릭 시)
		$(".menu").on("click", "li",function(){
			//리스트 activated
			$(".storemenu").attr("class", "storemenu");
			$(this).attr("class", "storemenu activated");
			//해당 매장의 정보 보여주기
			var code = $(this).data("code");
			setStoreInfo(code);
		})
	
		//카카오맵 api	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		//주소값을 가져옵니다.
		var address = $(".address").text();
		console.log("address : "+address);
		var name = $(".name").text();
		console.log("name : "+name);
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address,function(result, status) {
														
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								console.log("검색 완료");
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
		});
		
	
	//1) 코드를 받아 작동하는 메서드
	//2) 매장 정보를 받아옴
	//3) 매장 정보를 화면에 기입함
	//4) 기입한 정보를 기반으로 맵을 보여줌
	
	
	//카카오 맵 - 검색하여 지도에 표시
	function searchMap(){
		// 주소-좌표 변환 객체를 생성합니다
//		var geocoder = new kakao.maps.services.Geocoder();
		//주소값을 가져옵니다.
		address = $(".address").text();
		console.log("address : "+address);
		name = $(".name").text();
		console.log("name : "+name);
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address,function(result, status) {
														
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								console.log("검색 완료");
								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
		});
	}
	
})