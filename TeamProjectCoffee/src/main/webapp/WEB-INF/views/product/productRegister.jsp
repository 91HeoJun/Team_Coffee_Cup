<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>Product Register</title>
<%@ include file="../header.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 </head>
 <body>
 <div style="margin-left:100px">
    <h2 style="margin-bottom:50px">상품 등록</h2>
   	<form action="/product/productRegister?${_csrf.parameterName}=${_csrf.token}" method="post" role="form" enctype="multipart/form-data">
        <table>
            <tr>
                <td>상품명</td>
                <td><input name="product"></td>
            </tr>
             <tr>
                <td>로스팅/제조일</td>
                <td><input type="date" name="pdate"></td>
            </tr>
             <tr>
                <td>상품종류</td>
                <td><input name="pcategory"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input name="price"></td>
            </tr>
            <tr>
                <td>상품상세</td>
                <td><textarea rows="5" cols="60" name="pcontent"
                        id="pcontent"></textarea></td>
            </tr>
            <tr>
                <td>상품무게</td>
                <td><input id="pamount" name="pamount"/></td>
            </tr>  
             <tr>
                <td>상품원산지</td>
                <td><input id="origin" name="origin"/></td>
            </tr>      
            <tr>
                <td>상품이미지</td>
                <td><input type="file" name="image"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                	<button type="submit" class="btn btn-outline-secondary">작성</button>
                    <button type="reset" class="btn btn-outline-secondary" onclick="location.href='productList'">취소</button>
                </td>
            </tr>
        </table> 
		<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>   --%>        	
    </form>
</div>
 <script src="/resources/js/Product_js/productRegister.js"></script>
</body>
</html>