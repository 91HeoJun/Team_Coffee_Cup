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

.carousel-control-prev, .carousel-control-next {
	height: 50%;
	margin: auto 0;
}

.bottom {
background:#f4f4f2; width:100%; padding:40px 0 100px 0;
}

ul.bottom_img {
	text-align:center;

}
ul.bottom_img > li {
	display:inline-block;
	padding-right: 60px;
}

.dim_txt1 {
width:341px; 
height:35px; 
left:0; 
top-margin:5px;
bottom:0px;
background:#9b704d; 
font-size:20px; 
color:#ffffff; 
line-height:30px; 
padding-left:9px;
}

</style>
</head>
<body>
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
		<a class="btn btn-secondary btn-lg" href="/about" role="button" >Our Story</a>
	</div>
		<!-- 점보트론 끝 -->
		
		<!-- 이미지 이거나 동영상 -->
		<div class="bottom">
		<div><p style="font-size:40px; color:#000; font-style:italic"><img src="/resources/img/bestpng.png" style="width:100px; height:100px; margin-left:50px;"/> Black Bean의 인기상품</p>
		</div>
		<ul class ="bottom_img">
		<li><a href="http://localhost:8080/product/productDetail?pcode=51&amount=10&pageNum=1"><img src="/resources/img/ethiopia.JPG" style="width:300px; height:300px;" /></a>
		<p></p>
		<p><span class="dim_txt1">은은하고 부드러운 맛</span></p>
		<dl class="cfs01_text">
		<dt><h4>에티오피아 예가체프</h4></dt>
		<dd>
		<p> 한국인이 좋아하는 원두 1위<br>
		<br>특유의 달콤한 향으로 인기가 높으며,<br>
		부드러운 신맛과 깔끔함으로<br>
		많은 여성분들의 사랑을 받고 있습니다.</p>
		</dd>
		</dl>	
		</li>
										
										
		<li><a href="http://localhost:8080/product/productDetail?pcode=52&amount=10&pageNum=1"><img src="/resources/img/colombia.JPG" style="width:300px; height:300px;"/></a>
		<p> </p>
		<p><span class="dim_txt1">마일드 커피의 대명사</span></p>
		<dl class="cfs01_text">
		<dt><h4>콜롬비아 수프리모</h4></dt>
		<dd>
		<p> 커피를 처음 접하시는 분들께 적극추천!<br>
		<br>감미로운 아로마향이 풍부하고 <br>
		부드러운 질감과 중량감 있는맛,<br>
		밸런스가 가장 좋은 원두입니다.</p>
		</dd>
		</dl>
		<p> </p>	
		</li>
		
		
		<li><a href="http://localhost:8080/product/productDetail?pcode=53&amount=10&pageNum=1"><img src="/resources/img/kenya.JPG" style="width:300px; height:300px;"  /></a>
				<p> </p>
		<p><span class="dim_txt1">유럽이 사랑한 커피</span></p>
		<dl class="cfs01_text">
		<dt><h4>케냐AA TOP</h4></dt>
		<dd>
		<p> 최고급 생두에 부여하는 AA등급<br>
		<br>열대 과일의 단맛과 향, 차분한 신맛,<br>
		강한 바디감, 밸런스가 잘 잡힌<br>
		아프리카의 대표적인 커피입니다.</p>
		</dd>
		</dl>
		<p> </p>	
		</li>
		
		<li><a href="http://localhost:8080/product/productDetail?pcode=54&amount=10&pageNum=1"><img src="/resources/img/guatemala.JPG" style="width:300px; height:300px;" /></a>
						<p> </p>
		<p><span class="dim_txt1">진한 스모크 커피</span></p>
		<dl class="cfs01_text">
		<dt><h4>과테말라 안티구아</h4></dt>
		<dd>
		<p> 고소한 아메리카노를 원할때!<br>
		<br>최적의 기후조건에서 수확한 커피로<br>
		밸런스와 감칠맛이 좋고<br>
		바디감또한 훌륭한 커피입니다.</p>
		</dd>
		</dl>	
		</li>
		
		</ul>
		</div>
	<!-- top 버튼 -->
	<div id="topBtn">TOP</div>
</body>
<%@ include file="footer.jsp" %>