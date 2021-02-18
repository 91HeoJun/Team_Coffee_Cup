<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/resource/css/bootstrap.css">
<link href="https:fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700,800%7COpen+Sans+Condensed:300&display=swap" rel="stylesheet">
<link href="//cdn.rawgit.com/kattergil/NotoSerifKR-Web/76eb9ebf/stylesheet/NotoSerif-Web.css" rel="stylesheet">
<style>
body {
    font-family: 'Noto Sans KR','Malgun Gothic',Verdana,Dotum,AppleGothic,sans-serif;
    background: #fff;
    margin:0;
    padding:0;
}
.w100, fieldset {
    border: none;
    vertical-align: top;
    width: 100%; 
    height: auto;
}
.notoserif, .notoserif * {
    font-family: 'Noto Serif KR',MBatang,serif;
}
p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
.about .sub-top {
    position: relative;
}
.about .sub-top > span img {
    width: 50%;
}
.about .content01 {
    padding: 0 0 348px;
}
.about .sub-title {
    padding: 100px 0 140px 0;
    color: #535353;
    width: 100%;
    margin: 0 auto;
}
.about .sub-title > div {
    display: inline-block;
    position: relative;
    left: 50%;
    padding-left: 290px;
    box-sizing: border-box;
}
.about .sub-title > div h3 {
    font-size: 42px;
    font-weight: 500;
    line-height: 1.5;
    letter-spacing: -1px;
	color:gray;
}
.about .sub-title > div p {
    font-size: 19px;
    font-weight: 100;
    line-height: 2;
    padding: 22px 0 0;
}
.content02{
	position:relative;
	margin: 0 0 300px 0;
}
.content02 > div > div {
    display: table;
    float: right;
    width: 50%;
    height: 100%;
    text-align: left;
    padding-left: 78px;
    box-sizing: border-box;
}
.content02 > div > div p {
    display: table-cell;
    vertical-align: middle;
    color: #ffffff;
    font-size: 30px;
    font-weight: 400;
    line-height: 2;
    padding-top: 110px;
}
.about .content01 > span img {
    width: 100%;
}

.about .content01 > span {
    position: relative;
    display: block;
    clear: both;
    padding: 0 50px;
    box-sizing: border-box;
}
.about .content02 {
    position: relative;
    margin: 0 0 300px 0;
}

.about .content02 > div {
    display: block;
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
}
.about .content02 > div > div {
    display: table;
    float: right;
    width: 50%;
    height: 100%;
    text-align: left;
    padding-left: 78px;
    box-sizing: border-box;
}
.about .content02 > div > div p {
    display: table-cell;
    vertical-align: middle;
    color: #ffffff;
    font-size: 30px;
    font-weight: 400;
    line-height: 2;
    padding-top: 110px;
}
.about .content03 {
    position: relative;
    padding: 0 0;
}
.about .content03 > div {
    width: 100%;
}
.about .content03 > div > p {
    height: 340px;
    padding: 100px 88px;
    background: #f6efe9;
    line-height: 1.6;
    font-size: 30px;
    font-weight: 300;
    box-sizing: border-box;
}
.about .content03 > div > span {
    display: block;
}
.about .content03 > div > span img {
    width: 100%;
}
.about .content03 > div > div > div {
    color: #ffffff;
    font-size: 36px;
    line-height: 2;
    text-align: center;
    height: 250px;
    box-sizing: border-box;
    padding: 40px 0;
    background: #040404;
}
</style>
</head>
  <script>
    $('.carousel').carousel({
      interval: 1000 //1초
    })
  </script>
<body>
          <div class="sub-page about">
            <div class="sub-top">
              <img src="/resources/aboutimg/about_img_top.jpg" class="w100" alt="" />
            </div>
            <div class="sub-contents">
              <div class="content01">
                <div class="sub-title">
                <div>
                  <h3>
                    스페셜티 문화를<br />
                    창조하는 회사
                  </h3>
                  <p class="notoserif">
                    우리의 열정과 노력으로 그 가치가<br />
                    빛날 수 있도록 최선을 다합니다.
                  </p>
                </div>
                </div>
                <span
                  ><img src="/resources/aboutimg/about_img01.jpg" class="w100" alt=""
                /></span>
              </div>
              <div class="content02">
                <span
                  ><img src="/resources/aboutimg/about_img02.jpg" class="w100" alt=""
                /></span>
                <div>
                <div>
                <p class="notoserif" style="color:#FFFFFF !important;">
                  우리가 완성하려는 한 잔의 커피<br />
                  우리가 완성하려는 한 조각의 빵<br />
                  우리가 완성하려는 한 그릇의 음식
                </p>
              </div>
              </div>
              </div>
              <div class="content03">
              <div>
                <p class="notoserif">
                  이 모두가 품질에 대한 열정과 집념으로 만들어지는<br />
                  최상급 ‘스페셜티’이며 하나의 공간에서 새로운 문화로 완성됩니다.
                </p>
                <div>
                  <span
                    ><img src="/resources/aboutimg/about_img03.jpg" class="w100" alt=""
                  /></span>
                  <div>
                  <p style="color:#FFFFFF !important;text-align: center;">
                    저희는 공간의 미학과 식음(食飮) 문화의 융합을 바탕으로<br>
                    새로운 가치와 문화를 만들어 가는 회사입니다.
                  </p>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
  <!-- top 버튼 -->
  <div id="topBtn">TOP</div>
  </body>

<!-- TOP 버튼 끝 -->
</html>
<%@include file="footer.jsp" %>