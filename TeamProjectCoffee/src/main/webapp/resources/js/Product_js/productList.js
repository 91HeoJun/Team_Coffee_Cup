/**
 *  Product List Java Script File
 */

$(function() {

	var actionForm = $("#actionForm");

	$(".move").click(function(e){
		e.preventDefault();
	
		actionForm.append("<input type='hidden' name='pCode' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "productDetail");

		actionForm.submit();
	})
	
})

