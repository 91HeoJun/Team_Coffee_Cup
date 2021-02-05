<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
<%@ include file="../header.jsp" %>
 <script>
    //상품을 추가하기위한 정보를 담아 insert.do로 보내는 자바스크립트 함수
    function product_write() {
 
        var product_name = document.form1.product_name.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품이름을 반환해서 name에 저장함
        var price = document.form1.price.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 값을 반환해서 price에 저장함

 
        var description = document.form1.description.value; // document는 웹페이지에 접근하기위한 객체.. form1에 있는 상품의 정보를 반환해서 description에 저장함
        
        //document.form.은 폼페이지에 있는 값을 반환한다는 뜻.
 
        if (product_name == "") { //상품 이름이 입력되어 있지 않으면
            alert("상품명을 입력하세요");
            document.form1.product_name.focus(); //form1페이지에 있는 "상품명을 입력하세요" 에 커서를 올려둔다.
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
        

        document.form1.action = "${path}/shop/product/insert.do"; //insert.do 페이지로 form1에 저장된 자료를 전송함
        document.form1.submit();
    }
 </script>
 </head>
 <body>
     <!-- 관리자용 메뉴는 일반 회원의 메뉴와 다르기 때문에 일부러 관리자용 메뉴를 만들고 그 메뉴를 출력한다. -->
    <h2>상품 등록</h2>
    <form id="form1" name="form1" method="post"
        enctype="multipart/form-data">
        <!-- 파일업로드를 위해 추가하는 타입 -->
 
        <table>
            <tr>
                <td>상품명</td>
                <td><input name="product"></td>
            </tr>
             <tr>
                <td>상품코드</td>
                <td><input name="pcode"></td>
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
                <td>상품설명</td>
                <td><textarea rows="5" cols="60" name="description"
                        id="pContent"></textarea></td>
            </tr>
            <tr>
                <td>상품이미지</td>
                <td><input type="file" name="file1"></td>
            </tr>
            <tr>
 
                <td colspan="2" align="center"><input type="button" value="등록"
                    onclick="product_write()"> <!-- "등록" 버튼을 누르면 위쪽에 있는 스크립트문에서 product_write()함수가 호출되서 실행되 insert.do페이지로 자료를 전송한다. -->
                    <input type="button" value="목록"
                    onclick="location.href='${path}/views/product/products_list.do'"> <!-- "목록 버튼을 누르면 list.do페이지로 이동" -->
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
