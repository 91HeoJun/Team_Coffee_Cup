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
                					<input class="form-control" name="pcode" readonly="readonly" value="${product.pcode}" >                				
                				</div> 
                				<div class="form-group">
                					<label>Category</label>
                					<input class="form-control" name="pcategory" readonly="readonly" value="${product.pcatecory}" >                				
                				</div>  
                				<div class="form-group">
                					<label>Product</label>
                					<textarea class="form-control" rows="3" name="product" readonly="readonly">${product.product}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Pdate</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly">${product.pdate}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Amount</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly">${product.pamount}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="pcontent" readonly="readonly">${product.pcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Price</label>
                					<textarea class="form-control" rows="3" name="price" readonly="readonly">${product.price}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Writer</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${product.writer}" >                				
                				</div>
                				<sec:authentication property="principal" var="info"/>
                				<sec:authorize access="isAuthenticated()">
                					<c:if test="${info.username == product.admin}">
                					<button type="button" class="btn btn-default" >Modify</button>
                					</c:if>
                				</sec:authorize> 
                			 	<button type="reset" class="btn btn-info">List</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
   
  


<%@include file="../footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
