<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>
<html lang="en">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Product Info</h1>
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
                			<form action="" role="form">
                				<div class="form-group">
                					<label>Code</label>
                					<input class="form-control" name="pcode" readonly="readonly" value="${selectProduct.pcode}" >                				
                				</div> 
                				<div class="form-group">
                					<label>Category</label>
                					<input class="form-control" name="pcategory" readonly="readonly" value="${selectProduct.pcategory}" >                				
                				</div>  
                				<div class="form-group">
                					<label>Product</label>
                					<textarea class="form-control" rows="3" name="product" readonly="readonly">${selectProduct.product}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Pdate</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly">${selectProduct.pdate}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Amount</label>
                					<textarea class="form-control" rows="3" name="pamount" readonly="readonly">${selectProduct.pamount}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="pcontent" readonly="readonly">${selectProduct.pcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Price</label>
                					<textarea class="form-control" rows="3" name="price" readonly="readonly">${selectProduct.price}</textarea>               				
                				</div> 
                					<button type="button" class="btn btn-outline-primary" id="order">구매하기</button>
                					<button type="button" class="btn btn-outline-primary"  id="addcart">장바구니</button>
                					<sec:authentication property="principal" var="info"/>
                					<sec:authorize access="isAuthenticated()">
	                					<c:if test="${info.username == 'admin'}">
		                					<button type="button" class="btn btn-default" id="modify">Modify</button>
		                				</c:if>
	                				</sec:authorize>
	                			 	<button type="button" class="btn btn-info" id="list">List</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<form action="actionForm">
	<input type="hidden" name="pageNum" value="" />	
</form>

<!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
	
	$("#order").click(function(){
		
	})
	
	$("#addcart").click(function(){
		
	})
	
	$("#modify").click(function(){
		
	})
	
	$("#list").click(function(){
		location.href='/product/productList';
	})	
})
</script>
<%@include file="../footer.jsp" %>

