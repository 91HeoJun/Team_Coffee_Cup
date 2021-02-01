<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Business Casual - Start Bootstrap Theme</title> Bootstrap core
CSS
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

Custom fonts for this template
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i"
	rel="stylesheet">

Custom styles for this template
<link href="/resources/css/business-casual.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/store.css" />

</head>

<body>

	<h1 class="site-heading text-center text-white d-none d-lg-block">
		<span class="site-heading-upper text-primary mb-3">A Free
			Bootstrap 4 Business Theme</span> <span class="site-heading-lower">Business
			Casual</span>
	</h1>

	<nav class="navbar navbar-expand-lg navbar-dark py-lg-4" id="mainNav">
		<!-- <nav class="navbar navbar-expand-xl navbar-dark py-xl-4" id="mainNav"> -->
		<div class="container">
			<a
				class="navbar-brand text-uppercase text-expanded font-weight-bold d-lg-none"
				href="#">Start Bootstrap</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="index.html">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="about.html">About</a>
					</li>
					<li class="nav-item px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="products.html">Products</a>
					</li>
					<li class="nav-item active px-lg-4"><a
						class="nav-link text-uppercase text-expanded" href="store.html">Store</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<%-- <%@ include file="header.jsp" %> --%>

	<section class="page-section cta">
		<div class="container">
			<ul class="list-group list-group-flush float-left menu">
				<li class="list-group-item activated" id="list1">더종로R점</li>
				<li class="list-group-item" id="list2">신세계의정부점</li>
				<li class="list-group-item" id="list3">서울숲역점</li>
				<li class="list-group-item" id="list4">용산아이파크몰점</li>
				<li class="list-group-item" id="list5">판교역점</li>
			</ul>

			<div class="row">

				<!-- <div class="row"> -->

				<div class="col-xl-12 mx-auto" style="margin-bottom: 1em;">
					<div class="cta-inner text-center rounded">
						<img class="rounded store-img" alt="" src="/resources/store_img/jong-ro.jpg"
							style="width: 100%; height: auto">
						<h3 class="name" style="font-size: 1em; margin-top: 1em">스타벅스 더종로R점</h3>
						<h3 class="address" style="font-size: 1em; margin-top: 1em">서울특별시
							종로구 종로2가 종로 51</h3>
					</div>
				</div>

				<div class="col-xl-12 mx-auto">
					<div class="cta-inner text-center rounded d-lg-flex flex-row">
						<div id="map" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="page-section about-heading">
		<div class="container"></div>
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

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2832706a60d412fa615315430debadd&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2832706a60d412fa615315430debadd"></script>

	<script src="/resources/js/store.js"></script>

	<!-- <script src="/resources/js/store.js"></script> -->
</body>

</html>
