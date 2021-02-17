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
ul.mov-ar1{
text-align:center;
}
ul.mov-ar1 > li{
display:inline-block;
margin : 0 100px 0 0;
}
ul.mov-ar2{
text-align:center;
}
ul.mov-ar2 > li{
display:inline-block;
margin : 0 100px 0 0;
}
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
			<div class="mov-ar">
					<ul class="mov-ar1">
					<li><img src="/resources/img/espreso1.gif" alt="배너1"></li>
					<li><img src="/resources/img/hotlatte.gif" alt="배너2"></li>
					</ul>
					<ul class="mov-ar2">
					<li><img src="/resources/img/coldbrew.gif" alt="배너3"></li>
					<li><img src="/resources/img/icelatte.gif" alt="배너4"></li>
					</ul>														
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