<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="../header.jsp"%>


<h1 class="site-heading text-center text-white d-none d-lg-block">
	<span class="site-heading-upper text-primary mb-3"> 커피콩을 파는 사람들
	</span> <span class="site-heading-lower">Team Coffee Cup</span>
</h1>

<!-- 좌측 메뉴 -->
<div class="list-left">
	<div class="xans-element- xans-product xans-product-headcategory ">
		<h3>NEWS</h3>
	</div>
	<div class="xans-element- xans-product xans-product-menupackage ">
		<ul class="menuCategory">
			<li style="display:;"
				class="xans-element- xans-product xans-product-displaycategory selected xans-record-"><a
				href="javascript:;">뉴스레터 전체보기 <span class="count displaynone">()</span></a>
			</li>
			<li><a href="" target="">도서관
					바로가기</a></li>
		</ul>
	</div>
</div>

<section id="container">
	<div id="container_box">본문 영역</div>
</section>

<%@include file="../footer.jsp"%>

<!-- Bootstrap core JavaScript -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>