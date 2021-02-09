<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%@ include file="../header.jsp" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="/resources/css/store.css" />
	<section class="page-section cta">
		<div class="container">
			<ul class="list-group list-group-flush float-left menu">
				<!-- <li class="list-group-item activated" id="list1">더종로R점</li>
				<li class="list-group-item" id="list2">신세계의정부점</li>
				<li class="list-group-item" id="list3">서울숲역점</li>
				<li class="list-group-item" id="list4">용산아이파크몰점</li>
				<li class="list-group-item" id="list5">판교역점</li> -->
				<%-- <c:forEach var="store" items="${list}" varStatus="status">
					<li data-code="${store.code}" class="list-group-item" id="list${status.count}">${store.name}</li>
				</c:forEach> --%>
				<button type="button" style="margin-top : 10px" onclick="location.href='/store/admin'">매장 관리</button>
			</ul>
			

			<div class="row">

				<!-- <div class="row"> -->

				<div class="col-xl-12 mx-auto" style="margin-bottom: 1em;">
					<div class="cta-inner text-center rounded storeInfo">
						<!-- <img class="rounded store-img" alt="" src=""
							style="width: 100%; height: auto">
						<h3 class="name" style="font-size: 1em; margin-top: 1em">매장 이름</h3>
						<h3 class="address" style="font-size: 1em; margin-top: 1em">매장 주소</h3> -->
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

	<!-- 카카오맵 api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2832706a60d412fa615315430debadd&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b2832706a60d412fa615315430debadd"></script>
	<script src="/resources/js/store.js"></script>

	<%@ include file="../footer.jsp" %>

	<!-- <footer class="footer text-faded text-center py-5">
		<div class="container">
			<p class="m-0 small">Copyright &copy; Your Website 2018</p>
		</div>
	</footer>

	Bootstrap core JavaScript
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	Script to highlight the active date in the hours list
	<script>
		$('.list-hours li').eq(new Date().getDay()).addClass('today');
	</script>

	
</body>

</html> -->
