<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="../header.jsp" %>
<html lang="en">
            <div class="row">
                <div class="col-lg-12">
                    <h5 class="page-header" style="text-align:center;">상품 상세 정보</h5>
                </div>
               
            </div>            
            <div class="row" style="margin-top:20px;margin-left:100px;margin-right:100px">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                      
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form" method="">
                				<div class="form-group" style="font-size:26px">
                					<label>${selectProduct.product}</label>
                				</div> 
                				<div class="form-group">
				   					<img src="" id="productimg">    					      				
				   				</div>
				            	<div class="form-group">
                					<label>상품 구분</label>
                					<input class="form-control" name="pcategory" readonly="readonly" value="${selectProduct.pcategory}" >                				
                				</div>  
                	
                				<div class="form-group">
                					<label>로스팅(제조)일자</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly"> <fmt:formatDate value="${selectProduct.pdate}" pattern="yyyy-MM-dd"/></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>상품 상세</label>
                					<textarea class="form-control" rows="3" name="pcontent" readonly="readonly">${selectProduct.pcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>${selectProduct.pamount}</label>
                					<!-- <textarea class="form-control" rows="3" name="pamount" readonly="readonly"></textarea>         -->       				
                				</div> 
                				<div class="form-group">
                					<label>${selectProduct.price}원</label>
                					<!-- <textarea class="form-control" rows="3" name="price" readonly="readonly"></textarea>   -->             				
                				</div> 
                					<button type="button" class="btn btn-outline-dark" id="order">구매하기</button>
                					<button type="button" class="btn btn-primary"  id="addcart">장바구니</button>
                					<sec:authentication property="principal" var="info"/>
                					<sec:authorize access="isAuthenticated()">
	                					<c:if test="${info.username == 'testadmin'}">
		                					<button type="button" class="btn btn-warning" id="modify">수정</button>
		                				</c:if>
	                				</sec:authorize>
	                			 	<button type="button" class="btn btn-outline-dark" id="list">리스트</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<form id="actionForm">
	<input type="hidden" value="${selectProduct.pcode}" name="pcode"/>
	<input type="hidden" value="${cri.pageNum}" name="pageNum" />
</form>

<!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
	
	var form = $("#actionForm");
	
	//토큰값 생성
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$("#order").click(function(){
		
	})
	
 			
	$("#addcart").click(function(){
		//장바구니 버튼이 눌러진 상품의 정보 가져오기(코드,상품명,가격)
 		var param = {
					pcode : ${selectProduct.pcode},
					product : '${selectProduct.product}',
					price: ${selectProduct.price}
			}
			$.ajax({
				type:"post",
				url:"/cart/insert",
				beforeSend:function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				contentType:"application/json;charset=utf-8",
				data:JSON.stringify(param),		
				success:function(data){
					$(".table").html(data);
					alert("장바구니에 추가되었습니다");
				},
				error:function(xhr,txtStatus,error){
					$(".table").html(xhr.responseText);
				}
			})
		})
		//Ajax로 카트 컨트롤러로 전송
		
		//success가 도착하면 alert(장바구니에 담겼습니다)창 띄우기
	/* }) */
	
	$("#modify").click(function(){
		location.href="productEdit?pcode="+${selectProduct.pcode};
	})
	
	$("#list").click(function(){
		location.href='/product/productList?amount='+${cri.amount}+'&pageNum='+${cri.pageNum};
	})	
})
</script>
<script>

var pcode= ${selectProduct.pcode};	
</script>
<script src="/resources/js/Product_js/productEdit.js"></script>
<script src="/resources/js/Product_js/productList.js"></script>
<%@include file="../footer.jsp" %>
