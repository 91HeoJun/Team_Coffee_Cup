<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Business Casual - Start Bootstrap Theme</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/business-casual.min.css" rel="stylesheet">

  </head>

  <body>

    <h1 class="site-heading text-center text-white d-none d-lg-block">
      <span class="site-heading-upper text-primary mb-3">A Free Bootstrap 4 Business Theme</span>
      <span class="site-heading-lower">Business Casual</span>
    </h1>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
      <div class="container">
        <a class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none" href="#">Start Bootstrap</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="index.html">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="about.html">About</a>
            </li>
            <li class="nav-item px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="products.html">Products</a>
            </li>
            <li class="nav-item active px-lg-4">
              <a class="nav-link text-uppercase text-expanded" href="store.html">Store</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <section class="page-section cta">
      <div class="container">
     
        <div class="row">
        
      		<!-- <div class="row"> -->
      		<div>
      			<ul>
      				<li>item1</li>
      				<li>item2</li>
      				<li>item3</li>
      				<li>item4</li>
      			</ul>
      		</div>
      
          <div class="col-xl-9 mx-auto">
            <div class="cta-inner text-center rounded">
             <img alt="" src="/resources/store_img/store1.jpg" style="width:90%; height:auto">
             <h3>store1</h3>
            </div>
             <div class="cta-inner text-center rounded">
             <img alt="" src="/resources/store_img/store1.jpg" style="width:90%; height:auto">
             <h3>store2</h3>
            </div>
             <div class="cta-inner text-center rounded">
             <img alt="" src="/resources/store_img/store1.jpg" style="width:90%; height:auto">
             <h3>store3</h3>
            </div>
             <div class="cta-inner text-center rounded">
             <img alt="" src="/resources/store_img/store1.jpg" style="width:90%; height:auto">
             <h3>store4</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

	<section class="page-section about-heading">
		<div class="container">
			<div class="cta-inner text-center rounded">
		      	<div id="map" style="width:500px;height:400px;"></div>
			</div>
		</div>		
	</section>
    <!-- <section class="page-section about-heading">
      <div class="container">
        <img class="img-fluid rounded about-heading-img mb-3 mb-lg-0" src="/resources/img/about.jpg" alt="">
        <div id="map" style="width:1000px;height:700px;"></div>
        <div class="about-heading-content">
          <div class="row">
            <div class="col-xl-9 col-lg-10 mx-auto">
              <div class="bg-faded rounded p-5">
                <h2 class="section-heading mb-4">
                  <span class="section-heading-upper">Strong Coffee, Strong Roots</span>
                  <span class="section-heading-lower">About Our Cafe</span>
                </h2>
                <p>Founded in 1987 by the Hernandez brothers, our establishment has been serving up rich coffee sourced from artisan farmers in various regions of South and Central America. We are dedicated to travelling the world, finding the best coffee, and bringing back to you here in our cafe.</p>
                <p class="mb-0">We guarantee that you will fall in
                  <em>lust</em>
                  with our decadent blends the moment you walk inside until you finish your last sip. Join us for your daily routine, an outing with friends, or simply just to enjoy some alone time.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> -->

    <footer class="footer text-faded text-center py-5">
      <div class="container">
        <p class="m-0 small">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Script to highlight the active date in the hours list -->
    <script>
      $('.list-hours li').eq(new Date().getDay()).addClass('today');
    </script>

	<!-- Map Api scripts -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2832706a60d412fa615315430debadd"></script>
    <script>
        var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
    </script>
  </body>

</html>
