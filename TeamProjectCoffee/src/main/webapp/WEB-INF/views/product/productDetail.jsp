<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>
<html lang="en">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">상품 정보</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                           상품 상세 페이지
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form" method="">
                				<div class="form-group">
				   					<label>상품이미지</label>
				   					<img src="" id="productimg">    					      				
				   				</div>
				            	<div class="form-group">
                					<label>상품 구분</label>
                					<input class="form-control" name="pcategory" readonly="readonly" value="${selectProduct.pcategory}" >                				
                				</div>  
                				<div class="form-group">
                					<label>${selectProduct.product}</label>
                					<%-- <textarea class="form-control" rows="3" name="product" readonly="readonly">${selectProduct.product}</textarea>      --%>          				
                				</div> 
                				<div class="form-group">
                					<label>로스팅(제조)일자</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly"> <fmt:formatDate value="${selectProduct.pdate}" pattern="yyyy-MM-dd"/></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>${selectProduct.pamount}g</label>
                					<!-- <textarea class="form-control" rows="3" name="pamount" readonly="readonly"></textarea>         -->       				
                				</div> 
                				<div class="form-group">
                					<label>상품 상세</label>
                					<textarea class="form-control" rows="3" name="pcontent" readonly="readonly">${selectProduct.pcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>${selectProduct.price}원</label>
                					<!-- <textarea class="form-control" rows="3" name="price" readonly="readonly"></textarea>   -->             				
                				</div> 
                					<button type="button" class="btn btn-outline-primary" id="order">구매하기</button>
                					<button type="button" class="btn btn-outline-primary"  id="addcart">장바구니</button>
                					<sec:authentication property="principal" var="info"/>
                					<sec:authorize access="isAuthenticated()">
	                					<c:if test="${info.username == 'testadmin'}">
		                					<button type="button" class="btn btn-default" id="modify">수정</button>
		                				</c:if>
	                				</sec:authorize>
	                			 	<button type="button" class="btn btn-info" id="list">리스트</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<form id="actionForm">
	<input type="hidden" value="${selectProduct.pcode}" name="pcode"/>
	<!-- <input type="hidden" name="pageNum" value="" />	 -->
</form>

<!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
	
	var form = $("#actionForm");
	
	$("#order").click(function(){
		
	})
	
	$("#addcart").click(function(){
		
	})
	
	$("#modify").click(function(){
		location.href="productEdit?pcode="+${selectProduct.pcode};
	})
	
	$("#list").click(function(){
		location.href='/product/productList';
	})	
})
</script>
<%@include file="../footer.jsp" %>
