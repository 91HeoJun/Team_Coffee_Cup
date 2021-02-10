<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ****** Header 위치 이동 시 경로 변경 필요 ****** -->
<%@ include file="productHeader.jsp" %>
<html lang="kr">
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
                			<form action="/product/productDetail" role="form">
                				<div class="form-group">
                					<label>Code</label>
                					<input class="form-control" name="pCode" readonly="readonly" value="${selectproduct.pCode}" >                				
                				</div> 
                				<div class="form-group">
                					<label>Category</label>
                					<input class="form-control" name="pcategory" readonly="readonly" value="${selectproduct.pcategory}" >                				
                				</div>  
                				<div class="form-group">
                					<label>Product</label>
                					<textarea class="form-control" rows="3" name="product" readonly="readonly">${selectproduct.product}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Pdate</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly">${selectproduct.pdate}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Amount</label>
                					<textarea class="form-control" rows="3" name="pdate" readonly="readonly">${selectproduct.pamount}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Content</label>
                					<textarea class="form-control" rows="3" name="pcontent" readonly="readonly">${selectproduct.pcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Price</label>
                					<textarea class="form-control" rows="3" name="origin" readonly="readonly">${selectproduct.origin}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>Price</label>
                					<textarea class="form-control" rows="3" name="price" readonly="readonly">${selectproduct.price}</textarea>               				
                				</div> 
 
                			 	<button type="reset" class="btn btn-info">List</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
            
<form action="productEdit" id="myform">
	<input type="hidden" name="pCode" value="${selectproduct.pCode}" />
<%-- 	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
	<input type="hidden" name="amount" value="${cri.amount}" />
	<input type="hidden" name="type" value="${cri.type}" />
	<input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
</form>
   
<script>
	let productCode = ${selectproduct.pCode};
</script>


<%@include file="../footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
