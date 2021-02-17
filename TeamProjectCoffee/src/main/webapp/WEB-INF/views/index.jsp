<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>부트스트랩Carousel</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
body {
	z-index: -1;
}

.carousel-inner>.carousel-item>img {
	overflow: hidden;
	width: 80%;
	height: 600px;
}

#topBtn {
	display: none;
	position: fixed;
	bottom: 10px;
	right: 10px;
	width: 50px;
	height: 50px;
	border: 1px solid #fff;
	color: #9999cc;
	text-align: center;
	line-height: 50px;
	border-radius: 10px;
	background-color: #9999cc; /*버튼 색상*/
	transition: background 0.2s;
	cursor: pointer;
}

#topBtn:hover {
	background-color: #9999dd; /*마우스 올렸을 때 버튼 색상*/
}

.carousel-control-prev, .carousel-control-next {
	height: 50%;
	margin: auto 0;
}
.btn-primary {
	background-color: #9999cc;
}
.btn-primary:hover{
	background-color: #9999dd; !important;
}
img {
    vertical-align: top;
    max-width: 100%;
}
    div.cfs01_bottom { background:#f4f4f2; width:100%; padding:40px 0 100px 0; }
    div.cfs01_bottom ul.cfs01_bottom_list { margin-left:-25px; }
    div.cfs01_bottom ul.cfs01_bottom_list:after { content:""; display:block; clear:both; }

    ul.cfs01_bottom_list li { float:left; width:350px; margin-left:25px; list-style:none;}
    ul.cfs01_bottom_list li p.img{ position:relative; width:350px; height:150px; margin-bottom:300px; }

    ul.cfs01_bottom_list li p.img span.dim_txt1{ display:block; width:341px; height:35px; position:absolute; left:0; bottom:0px;background:#9b704d; border-bottom-left-radius:3px; border-bottom-right-radius:3px; font-size:16px; color:#ffffff; line-height:29px; padding-left:9px;}
    ul.cfs01_bottom_list li p.img span.dim_txt1 span{ font-size:14px; color:#fff; line-height:600px; }
    ul.cfs01_bottom_list li p.img span.dim_txt2{ display:block; width:341px; height:35px; position:absolute; left:0; bottom:0;background:#9b704d; border-bottom-left-radius:3px; border-bottom-right-radius:3px; font-size:16px; color:#ffffff; line-height:29px; padding-left:9px; }
    ul.cfs01_bottom_list li p.img span.dim_txt2 span{ font-size:14px; color:#fff; line-height:35px; }
    ul.cfs01_bottom_list li p.img span.dim_txt3{ display:block; width:341px; height:35px; position:absolute; left:0; bottom:0;background:#9b704d; border-bottom-left-radius:3px; border-bottom-right-radius:3px; font-size:16px; color:#ffffff; line-height:29px; padding-left:9px; }
    ul.cfs01_bottom_list li p.img span.dim_txt3 span{ font-size:14px; color:#fff; line-height:35px; }
    
    ul.cfs01_bottom_list li p.img span.dim_txt4{ display:block; width:341px; height:35px; position:absolute; left:0; bottom:0;background:#9b704d; border-bottom-left-radius:3px; border-bottom-right-radius:3px; font-size:16px; color:#ffffff; line-height:29px; padding-left:9px; }
    ul.cfs01_bottom_list li p.img span.dim_txt4 span{ font-size:14px; color:#fff; line-height:35px; }
    
    
    ul.cfs01_bottom_list li dl.cfs01_text dt h4{ font-size:14px; color:#222; margin-bottom:15px; }
    ul.cfs01_bottom_list li dl.cfs01_text dd p{ font-size:14px; color:#666; line-height:1.6; }
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
		<!-- <script src="http://caffebene.com/common/js/imagesloaded.pkgd.js"></script> -->
<script src="http://caffebene.com/common/js/imagesloaded.pkgd.min.js"></script>
	<script>
		$('.carousel').carousel({
			interval : 1000
		//1초
		})
	</script>
	<div class="container_s"></div>
	<div id="demo" class="carousel slide" data-ride="carousel">

		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100" src="/resources/img/espreso.jpg"
					alt="First slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/img/coffee-latte.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/img/20181127_224153.png"
					alt="Third slide">
			</div>

			<!-- / 슬라이드 쇼 끝 -->

			<!-- 왼쪽 오른쪽 화살표 버튼 -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<!-- <span>Previous</span> -->
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<!-- <span>Next</span> -->
			</a>
			<!-- / 화살표 버튼 끝 -->

			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
	</div>
	<!-- 점보트론 시작 -->
	<div class="jumbotron">
		<h1 class="display-4">Black Bean</h1>
		<p class="lead">스페셜티 문화를 창조하는 회사입니다.</p>
		<hr class="my-4">
		<p>우리의 열정과 노력으로 그 가치가 빛날 수 있도록 최선을 다합니다.</p>
		<a class="btn btn-primary btn-lg" href="/about" role="button" >Our Story</a>
	</div>
		<!-- 점보트론 끝 -->
		<!-- 이미지 이거나 동영상 -->
							<div class="cfs01_bottom">
								<div class="coffee_content">
									<ul class="cfs01_bottom_list">
										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list02.jpg" alt="은은하고 부드러운 맛 Subtle & Mellow">
												<span class="dim_txt1">에디오피아 예가체프<span class="en">Subtle &amp; Mellow</span></span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>홍차에 레몬을 띄운 것 같은 향미</h4></dt>
												<dd>
													<p>한국인이 좋아하는 원두 1위,<br>여성분들이 좋아하는 원두 1위! <br>부드러운 신맛과 달콤한 향으로 <br>깔끔하고 맛 좋은 커피입니다.</p>
												</dd>
											</dl>											
										</li>

										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list02.jpg" alt="부드럽고 균형 잡힌 맛 Smooth & Balanced">
												<span class="dim_txt2">부드럽고 균형 잡힌 맛 <span class="en">Smooth &amp; Balanced</span></span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>부드럽고 균형 잡힌 맛을 미디엄 로스트에서 만나보세요.</h4></dt>
												<dd>
													<p>미디엄 로스트 커피는 너무 연하거나<br> 너무 강하지 않은 그 중간의 입맛을 가진 분들에게 적합합니다. <br>부드럽고 균형 잡힌 미디엄 로스트 커피는<br> 항상 변함없는 맛을 보여줍니다.</p>
												</dd>
											</dl>											
										</li>
										
										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list03.jpg" alt="진하고 강한 맛 Bold & Robust">
												<span class="dim_txt3">진하고 강한 맛 <span class="en">Bold &amp; Robust</span></span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>다크 로스트 커피 팬들이 사랑하는 진하고 강한 커피</h4></dt>
												<dd>
													<p>다크 로스트 커피는 달콤하면서 강한 풍미와<br> 향긋한 입맛이 특징입니다.<br> 입안에서 느껴지는 꽉찬 무게감이 강조된 이 커피는 <br>마지막 한 방울까지도 여러분의 입맛을 사로잡을 것입니다.</p>
												</dd>
											</dl>											
										</li>
																				<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list03.jpg" alt="진하고 강한 맛 Bold & Robust">
												<span class="dim_txt3">진하고 강한 맛 <span class="en">Bold &amp; Robust</span></span>
											</p>
											<dl class="cfs04_text">
												<dt><h4>다크 로스트 커피 팬들이 사랑하는 진하고 강한 커피</h4></dt>
												<dd>
													<p>다크 로스트 커피는 달콤하면서 강한 풍미와<br> 향긋한 입맛이 특징입니다.<br> 입안에서 느껴지는 꽉찬 무게감이 강조된 이 커피는 <br>마지막 한 방울까지도 여러분의 입맛을 사로잡을 것입니다.</p>
												</dd>
											</dl>											
										</li>
									</ul>
								</div>
							</div>
	<!-- top 버튼 -->
	<div id="topBtn">TOP</div>
</body>
</html>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<!-- TOP 버튼 시작 -->
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('#topBtn').fadeIn();
			} else {
				$('#topBtn').fadeOut();
			}
		});

		$("#topBtn").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 500);
			return false;
		});
	});
</script>
<!-- TOP 버튼 끝 -->
<%@ include file="footer.jsp" %>