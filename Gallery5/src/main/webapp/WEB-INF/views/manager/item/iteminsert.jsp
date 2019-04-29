<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작품 추가</title>
<style>
img{
	width:200px;
	height:200px;
}


</style>
</head>
<body>
	<h1>작품추가</h1>
	<form action="managerinsertItem.do" method="post" enctype="Multipart/form-data" autocomplete="off">
	전시번호:<input type="text" name="e_no" placeholder="전시번호를 입력하세요" required="required" autocomplete="off"/><br>
	작품이름:<input type="text" name="i_name" placeholder="작품이름을 입력하세요" required="required" autocomplete="off"/><br>
	작품설명:<textarea name="i_explain" placeholder="작품설명을 입력하세요" required="required"
		autocomplete="off" rows="10" cols="60"></textarea><br>
	작품이미지:<pre class="brush:html"></pre><input type="file" placeholder="작품이미지를 등록하세요" name="i_img" required="required" id="input_img" 
	name="i_img" onchange="LoadImg()"/><br>
	<div id="list" ></div>
	가격:<input type="text" name="i_price" placeholder="작품의 가격을 입력하세요" required="required" autocomplete="off"/><br>
	작가번호:<input type="text" name="a_no" placeholder="작가 번호를 입력하세요" required="required" autocomplete="off"/><br>
	<input type="hidden" name="m_no" value="0"/><br>
	
	<input type="submit" value="작품추가"/>
	</form>
	
	<script type="text/javascript">
	function LoadImg(){
		var files=document.getElementById('input_img').files[0];
		var reader= new FileReader();
		reader.onload=(function(theFile){
			return function(e)
			{
				var img_view=['<img src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
				document.getElementById('list').innerHTML=img_view;
			};
		})(files);
		reader.readAsDataURL(files);
		
	}
	
	</script>
</body>
</html>