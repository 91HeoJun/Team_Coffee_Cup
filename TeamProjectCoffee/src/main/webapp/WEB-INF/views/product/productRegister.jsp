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
    <h2>상품 등록</h2>
   	<form action="/product/productRegister" method="post" role="form">
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
                	<button type="submit" class="btn btn-default">작성</button>
                    <button type="reset" class="btn btn-default" onclick="location.href='productList'">취소</button>
                </td>
            </tr>
        </table>
        <%-- 파일 등록 --%>
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading"> 파일 첨부하기</div>
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name="uploadFile" id="" multiple />
									</div>
									<div class="uploadResult">
										<ul></ul>
									</div>
								</div>
							</div>
						</div>
					</div>                	
    </form>
 <script>
    //상품을 추가하기위한 정보를 담아 insert.do로 보내는 자바스크립트 함수
    function product_write() {
 
        var product = document.form1.product.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품이름을 반환해서 name에 저장함
        var price = document.form1.price.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 값을 반환해서 price에 저장함
 
        var description = document.form1.description.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 정보를 반환해서 description에 저장함
        
        //document.form.은 폼페이지에 있는 값을 반환한다는 뜻.
 
        if (product == "") { //상품 이름이 입력되어 있지 않으면
            alert("상품명을 입력하세요");
            document.form1.product.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        if (price == "") { //상품가격이 입력되어 있지 않으면
            alert("가격을 입력하세요");
            document.form1.price.focus(); //form1페이지에 있는 "가격을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        if (description == "") { //상품설명이 입력되어 있지 않으면
            alert("상품설명을 입력하세요");
            document.form1.description.focus(); //form1페이지에 있는 "상품설명을 입력하세요" 에 커서를 올려둔다.
            return;
        }
        // input 태그를 마우스로 클릭하여 입력상태로 만든것을 포커스를 얻었다고 한다.
       // 그리고 입력상태를 떠난 것을 포커스가 벗어났다고 한다.
        
        document.form1.action = ""; //insert.do 페이지로 form1에 저장된 자료를 전송함
        document.form1.submit();
    }    
    
 </script>
 <script src="/resources/js/Product_js/productRegister.js"></script>
</body>
</html>