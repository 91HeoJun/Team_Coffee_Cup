<%@page import="com.company.domain.LoginVO"%>
<%@page import="com.company.service.MyPageService"%>
<%@page import="com.company.service.MyPageServiceImpl"%>
<%@page import="com.company.domain.CalendarVO"%>
<%@page import="com.company.domain.RegisterVO"%>
<%@page import="com.company.service.CalendarUtil"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.col-md-2{
margin-top: 100px;
}
#left_bar{
border: 2px solid;
border-radius: 10px;
}
#left_bar > li{
border-bottom: 1px solid;
}
.nav-link {
color:black !important;
}
.f_content{
	width: 100%; 
	height: 100%;		
	margin-left: 3%; 
	margin-top: 5%;
	margin-right: 3%; 
	margin-bottom: 5%; 
		
	background-color: #E0F2F7;
	/* overflow: auto; */	
}

.f2_content{
	width: 120%; 
	height: 600px;

}
table {
   border: 1px solid #999;
   border-collapse: collapse;
   font-family: Georgia, Times, serif;
}
th {
  border: 1px solid #999;
  font-size: 70%;
  text-transform: uppercase;
}
td {
  border: 1px solid #999;
  /* height: 5em; */
  /* width:5em; */
  padding: 0;
  vertical-align: top;
}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>
<!-- // ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <div class="container">
        <!-- Stack the columns on mobile by making one full-width and the other half-width -->
        <div class="row">
		<div class="col-md-2">
			<ul class="nav flex-column" id="left_bar">
				<li class="nav-item"><a class="nav-link active" href="../">HOME</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="../calendar">출석체크</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="/mypage/userInfo">회원정보 조회</a></li>
				<li class="nav-item"><a class="nav-link" href="/mypage/leave">회원탈퇴</a>
				</li>
			</ul>
		</div>
<!-- content.css -->
<!-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/content.css"> -->

</head>

<body>
<div class="col-3 col-md-9" >
<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);   // 1일

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(CalendarUtil.nvl(syear) == false){   
   year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1;
if(CalendarUtil.nvl(smonth) == false){   
   month = Integer.parseInt(smonth);
}

if(month < 1){
   month = 12;
   year--;
}
if(month > 12){
   month = 1;
   year++;
}

cal.set(year, month - 1, 1);   // 연월일을 설정

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
System.out.println("dayOfWeek:" + dayOfWeek);

String wdate = (year-1)+""+month;

String pp = String.format("<a href='%s?year=%d&month=%d'><img src='/resources/calendarimg/left.gif'></a>", 
      "/calendar", year-1, month);                     
String p = String.format("<a href='%s?year=%d&month=%d'><img src='/resources/calendarimg/prec.gif'></a>", 
      "/calendar", year, month-1);

String n = String.format("<a href='%s?year=%d&month=%d'><img src='/resources/calendarimg/next.gif'></a>", 
      "/calendar", year, month+1);
String nn = String.format("<a href='%s?year=%d&month=%d'><img src='/resources/calendarimg/last.gif'></a>", 
      "/calendar", year+1, month);

// 오늘날짜 설정(오늘날짜 색 표시해 주는 부분)!!
Calendar todaycal = Calendar.getInstance();
int tyear = todaycal.get(Calendar.YEAR);
int tmonth = todaycal.get(Calendar.MONTH);
int tday = todaycal.get(Calendar.DATE);

//오늘 날짜 
String today = year + "년 "+ month +"월 " + tday + "일"; 

// 출력확인! 
System.out.println("year : " + tyear + ", month : " + (tmonth+1) + ", day : " + tday);
System.out.println("today : " + today);

int startDate = cal.getMinimum(Calendar.DATE); // 해당 월의 첫날 
int endDate = cal.getActualMaximum(Calendar.DATE); // 해당 월의 마지막날

int count = 0;

RegisterVO regist = (RegisterVO)session.getAttribute("regist");

List<CalendarVO> list=(List<CalendarVO>)request.getAttribute("list");
%>

<div class="f_content" align="center" style="margin-bottom: 110%; margin-top: 7%; margin-left: 15%; margin-right: 5%;">
<div class="f2_content" >

<%-- <!-- // 로그아웃 & 로그인  후 정보(이름)-->
<c:if test="${login.id ne ''}">
   <a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
</c:if>

<c:if test="${login.name ne '' }">
   [${login.name }]님 환영합니다
</c:if> --%>

<div align="center" style="margin-right: 100px;"> 
 
  <img src="/resources/calendarimg/cal05.jpg" width="100%;" height="40%;">
  
<div style="background-color: #FFBF00;">
<br>
<table border="2" style="border-collapse: separate; border-spacing: 10 10px; background-color: white;">
<col width="140"><col width="140"><col width="140"><col width="140">
<col width="140"><col width="140"><col width="140">

<tr height="100" style="border: 2px solid gray;">
   <td colspan="7" align="center">
      <%=pp %>&nbsp;<%=p %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <font color="black" style="font-size: 50px; font-weight: bold;">
         <%=String.format("%d년&nbsp;&nbsp;%2d월", year, month) %>
      </font>&nbsp;&nbsp;
      <%=n %>&nbsp;<%=nn %>   
   </td>
</tr>

<tr align="center" style="font-weight: bold; background-color: #BDBDBD; color: #FAFAFA;" height="30">
   <td>일</td>
   <td>월</td>
   <td>화</td>
   <td>수</td>
   <td>목</td>
   <td>금</td>
   <td>토</td>
</tr>

<tr height="120" valign="top">
<%
// 윗쪽의 빈칸
for(int i = 1;i < dayOfWeek; i++){
   count++;
   %>   
   <td>&nbsp;</td>   
   <%
}

//날짜
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

for(int i = 1;i <= lastDay; i++){
   String bgcolor = (today.equals(year + "년 "+ month +"월 "+ i + "일"))? "white"  : "#FFFFFF";
   String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
   count++;
   %>
   <td bgcolor="<%=bgcolor %>"><font size="3" color=<%=color %> style="font-weight: bold;">
       <%=CalendarUtil.caltoday(year, month, i) %></font>&nbsp;&nbsp;
       <%=CalendarUtil.makeTable(year, month, i, list) %>
   </td>
   <%
   if((i + dayOfWeek - 1) % 7 == 0 && i != lastDay){
      %>   
      </tr>
      <tr height="120" align="left" valign="top">
      <%
   }   

}
   
//밑의 빈칸
for(int i = 0; i < (7 - (dayOfWeek + lastDay - 1) % 7 ) % 7; i++){
   %>   
   <td>&nbsp;</td>   
   <%
   count++;
}
%>   
</tr>

</table>

<br><br>
</div>


<div style="background-color: #FFBF00;" align="left">

<div style="background-color: #FFBF00;">
<img alt="" src="/resources/calendarimg/n01.jpg" style="margin-left: 10%;">
<br>

<label style="margin-left: 130px;">
<!-- // 접속보상확인 -->
<button type="button" class="btn btn-outline-secondary" id="_btnGetId" onclick="disable(this)"><img src="/resources/calendarimg/point_push.jpg" alt="접속보상" style="width:100px; outline:0;"></button>
</label>

<!-- // 한번 실행 후 실행 안되게 막음 -->    
<script type="text/javascript">
function disable(ctr) {
   ctr.disabled = true;
}
</script>


<!-- 오늘날짜,시간 & 출석체크 버튼  -->
<%
String day = request.getParameter("day");

int thour = cal.get(Calendar.HOUR_OF_DAY);
int tmin = cal.get(Calendar.MINUTE);
%>

<img alt="" src="/resources/calendarimg/n02.jpg" style="margin-left: 45%;">

<div style="margin-left: 60%;">

<form id="frm" method="post">
	<h5 style="margin-left: 10%;">"현재 시간"</h5>
	<!-- // db에 넣기 위해  id값을 가져와야 함 -->
   <input type="hidden" name="userid" id="userid" value="${regist.userid}">
   
   <%=tyear %>년&nbsp;<%=tmonth+1 %>월&nbsp;<%=tday %>일&nbsp;<%=thour %>시&nbsp;<%=tmin %>분
   <input type="hidden" name="year" value="<%=tyear %>">
   <input type="hidden" name="month" value="<%=tmonth+1 %>">
   <input type="hidden" name="day" value="<%=tday %>">   
   <input type="hidden" name="hour" value="<%=thour %>">
   <input type="hidden" name="min" value="<%=tmin %>">
   <br><br>
   
  <!-- // 출석체크 -->
 <!--   <button type="submit" onclick="btncheck()">
     <img alt="" src="image/stamp_01.png">
   </button>
   	 -->
   	<div style="margin-left: 35%;">
   <img alt="" src="/resources/calendarimg/stamp_01.png" onclick="btncheck()" >
   </div>
</form>
</div>

</div>

<br><br><br>
</div>

</div>  <!-- // center -->

</div>
</div>
</div>
 <!-- top 버튼 -->
  <div id="topBtn">TOP</div>
<script type="text/javascript">
function btncheck() {
	
	// alert("테스트");
	$("#frm").attr("action", "/calwrite").submit();

}
</script>

<!-- // 포인트 지급  -->
<script type="text/javascript">
 $("#_btnGetId").click(function () {   
  // alert("포인트 지급 테스트");
   
   $.ajax({
      type:"post",
      url:"/getIdCount",      
      data:{ userid:$("#userid").val() },
      async:true,
      success:function(msg){   
         
         if(msg== 'YES'){            
            alert("포인트 지급완료. \n 다음 방문시 확인가능합니다." );
         }else{
            alert("출석일수가 모자랍니다.");
         }      
      },
      error:function(){
         alert("error");   
      }      
      
   });

});
</script>
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
                scrollTop: 0
            }, 500);
            return false;
        });
    });
</script>
<!-- TOP 버튼 끝 -->
</body>
</html>
<%@ include file="footer.jsp" %>