<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 추후 Header 위치 이동시 수정 필요 -->
<%@include file="boardHeader.jsp" %>

			<div class="row justify-content-between">
				<h2 class="col-4 sub_tit_wrap h2"> 자유게시판 </h2>

				<div class="col-lg-6 panel-heading" style="text-align: right;">
					<!--search Form-->
					<form action="" id="searchForm" class="search-options">
						<select name="type" class="type-size">
							<option value=""> --------------- </option>
							<option value="T"<c:out value="${pageVO.cri.type=='T'?'selected':''}"/>> 제목 </option>
							<option value="C"<c:out value="${pageVO.cri.type=='C'?'selected':''}"/>> 내용 </option>
							<option value="W"<c:out value="${pageVO.cri.type=='W'?'selected':''}"/>> 작성자 </option>
							<option value="TC"<c:out value="${pageVO.cri.type=='TC'?'selected':''}"/>> 제목 or 내용</option>
						</select>
												
						<input type="text" id="keyword" name=keyword value="${pageVO.cri.keyword}" placeholder="검색어를 입력하세요"/>
						<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
						<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
			
						<button type="button" class="btn btn-outline-secondary" id="board-finder">검색</button>       		
					</form>
				</div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="table-No">No.</th>
                                        <th class="table-Title">제     목</th>
                                        <th class="table-Writer">작성자</th>
                                        <th class="table-Date">작성일</th>
                                        <th class="table-Date">수정일</th>
                                    </tr>									
                                </thead>

                               <tbody>
                               
								<!-- 게시판 리스트 반복문 -->
									<c:forEach var="vo" items="${list}">
										<tr>
											<td class="table-No">${vo.bno}</td>
											<td><a href="${vo.bno}" class="move">${vo.title}</a> [${vo.replyCnt}]</td>
											<td class="table-Writer">${vo.writer}</td>
											<td class="table-Date"><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
											<td class="table-Date"><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</tbody>
                            </table>



								<div class="row">
								
									<div class="col-sm-4">

			                            <!--페이지 목록 갯수 지정하는 폼-->
			                            <select class="amount-form-control" id="amount">
			                            	<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
			                            	<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
			                            	<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
			                            	<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
			                            </select>
									</div>
									
									<!-- 페이지나누기 -->
									<div class="col-md-4 text-center">
										<ul class="pagination">
											<c:if test="${pageVO.previous}">
												<li class="page-item"><a class="page-link" href="${pageVO.startPage-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
											</c:if>
											<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
												<li class="page-item ${pageVO.cri.pageNum==idx?'active':''}"><a class="page-link" href="${idx}">${idx}</a></li>
											</c:forEach>
											<c:if test="${pageVO.next}">
												<li class="page-item"><a class="page-link" href="${pageVO.endPage+1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
											</c:if>
										</ul>
									</div>	
								
									<div class="col-lg-4" style="text-align: right;">
										<button id='regBtn' type="button" class="btn btn-outline-secondary" onclick="location.href='register'">문의글 작성</button>
									</div>
			
<!-- --------------------------- -->
	
	
	<!-- 금액 값 받아서 처리 -->		
<!--  <div class="card-body bg-white mt-0 shadow">
                <p style="font-weight: bold">카카오페이 현재 사용가능</p>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="5000"><span>5,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"><span>10,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"><span>15,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"><span>20,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"><span>25,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"><span>30,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"><span>35,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"><span>40,000원</span></label>
                <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"><span>50,000원</span></label>
                <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
                <button type="button" class="btn btn-lg btn-block  btn-custom" id="charge_kakao">충 전 하 기</button>
 </div> -->

			
<!-- 결제 API CDN -->			
<!-- <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> -->

<!-- 결제 버튼활성화 및 JS -->
<!--  <script>
 $('#charge_kakao').click(function () {
     // getter
     var IMP = window.IMP;
     IMP.init('imp38665701');
     var money = $('input[name="cp_item"]:checked').val();
     console.log(money);

     IMP.request_pay({
         merchant_uid: 'merchant_' + new Date().getTime(),

         name: '주문명 : 주문명 설정',
         amount: money,
         buyer_email: 'iamport@siot.do',
         buyer_name: '구매자이름',
         buyer_tel: '010-1234-5678',
         buyer_addr: '인천광역시 부평구',
         buyer_postcode: '123-456'
     }, function (rsp) {
         console.log(rsp);
          if (rsp.success) { 
             var msg = '결제가 완료되었습니다.';
             msg += '고유ID : ' + rsp.imp_uid;
             msg += '상점 거래ID : ' + rsp.merchant_uid;
             msg += '결제 금액 : ' + money;
             $.ajax({
                 type: "GET", 
                 url: "/", //충전 금액값을 보낼 url 설정
             });
          } else {
             var msg = '결제에 실패하였습니다.';
             msg += '에러내용 : ' + rsp.error_msg;
         }
         alert(msg);
         document.location.href="/"; //alert창 확인 후 이동할 url 설정
     });
 });
</script> -->

<!-- --------------------------- -->



								</div> <!-- end search -->
                        </div>
			</div>



<!-- 페이지 링크 값을 넘기기 위한 폼 -->
	<form action="" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
		<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
		<input type="hidden" name="type" value="${pageVO.cri.type}" />
		<input type="hidden" name="keyword" value="${pageVO.cri.keyword}" />
	</form>

<!-- Modal 추가 -->
 	<div class="modal" tabindex="-1" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">게시글 등록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p> 요청이 처리되었습니다. </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal"> 확인 </button>
	      </div>
	    </div>
	  </div>
	</div>



<script> var result = '${result}';</script>
<script src="/resources/js/Board_js/list.js"></script>
<%@include file="../ClientBoard/boardFooter.jsp" %>