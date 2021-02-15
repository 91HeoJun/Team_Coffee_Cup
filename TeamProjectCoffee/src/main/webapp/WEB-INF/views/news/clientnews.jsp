<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blog Home - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/blog-home.css" rel="stylesheet">
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">새소식</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Blog Entries Column -->
      <div class="col-md-8">

        <h1 class="my-4">blackbean
          <small>뉴스레터</small>
        </h1>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="news" src="/resources/img/news/no48.jpg" style="width:400px; hieght:200px;" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">NO.3</h2>
            <p class="card-text"></p>
            <a href="/resources/img/news/no48_newsletter.jpg" class="btn btn-primary">뉴스 읽기 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            2021년 1~2월 뉴스레터 3호
            <a href="#">새소식</a>
          </div>
        </div>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="news" src="/resources/img/news/no47.jpg" style="width:400px; hieght:200px;" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">NO.2</h2>
            <p class="card-text"></p>
            <a href="/resources/img/news/no47_newsletter.jpg" class="btn btn-primary">뉴스 읽기 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            2020년 11~12월 뉴스레터 2호
            <a href="#">새소식</a>
          </div>
        </div>

        <!-- Blog Post -->
        <div class="card mb-4">
          <img class="news" src="/resources/img/news/no46.jpg" style="width:400px; hieght:200px;" alt="Card image cap">
          <div class="card-body">
            <h2 class="card-title">NO.1</h2>
            <p class="card-text"></p>
            <a href="/resources/img/news/no46_newsletter.jpg" class="btn btn-primary">뉴스 읽기 &rarr;</a>
          </div>
          <div class="card-footer text-muted">
            2020년 9~10월 뉴스레터 1호
            <a href="#">새소식</a>
          </div>
        </div>

        <!-- Pagination -->
        <ul class="pagination justify-content-center mb-4">
          <li class="page-item">
            <a class="page-link" href="#">&larr; 이전</a>
          </li>
          <li class="page-item disabled">
            <a class="page-link" href="#">다음 &rarr;</a>
          </li>
        </ul>

      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">



        <!-- Categories Widget -->


        <!-- Side Widget -->


      </div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
<%@include file="../footer.jsp"%>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>