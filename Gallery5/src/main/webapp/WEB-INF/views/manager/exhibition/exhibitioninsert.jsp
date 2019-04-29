<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시추가하기</title>
<style>
img{
	width:200px;
	height:200px; 
}


</style>
</head>
<body>
	<h1>전시추가하기</h1>
	<form action="managerinsertExhibition.do" method="post" enctype="Multipart/form-data" autocomplete="off">
<!-- 	<input type="hidden" name="e_no" value=""/> -->
	전시제목:<input type="text" placeholder="제목을 입력하세요" name="e_title" required="required" autocomplete="off"/><br>
	전시설명:<textarea name="e_explain" rows="10" cols="60" placeholder="전시설명을 입력하세요" required="required" autocomplete="off"></textarea><br>
	작가번호:<input type="text"  name="a_no" placeholder="작가번호 입력란입니다" required="required" autocomplete="off"/><br>
	작가이름:<input type="text"  name="a_name" placeholder="작가이름입력란입니다" required="required" autocomplete="off"/><br>
	<input type="hidden" name="e_click" value="0"/>
	전시사진:<input type="file" multiple="multiple" name="e_img" id="e_img1" placeholder="사진을 올려주세요" 
	required="required" onchange="LoadImg()"/><!-- <input type="button" value="파일추가" onclick="add_exhibition()"><br> -->
	<div id="list"></div>
	
<!-- 	<div id="add" style="display:none">	 -->
<!-- 	<input type="file" multiple="multiple" name="file" id="e_img2" onchange="LoadImg1()"> -->
<!-- 	<input type="button" value="파일삭제" onclick="remove_exhibition(this)"><br> -->
<!-- 	<div id="list1"></div> -->
<!-- 	</div> -->
<!-- 	<div id="field"> -->
<!-- 	</div> -->
	
	<input type="submit" value="전시추가"/>
	</form>
	<script type="text/javascript"> 
	function LoadImg(){
 		var files=document.getElementById('e_img1').files[0];
 		var reader= new FileReader();
 		reader.onload=(function(theFile){
 			return function(e){
 				var img_view=['<img src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
 				document.getElementById('list').innerHTML=img_view;
 			};
 		})(files);
 		reader.readAsDataURL(files);
 	}
	
// 	//실행안됨..
// 	function LoadImg1(){
// 		var files=document.getElementById('e_img2').files[0];
// 		var reader= new FileReader();
// 		reader.onload=(function(theFile){
// 			return function(e){
// 				var img_view=['<img src="',e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
// 				document.getElementById('list1').innerHTML=img_view;
// 			};
// 		})(files);
// 		reader.readAsDataURL(files);
// 	}

// 	function add_exhibition(){
// 		var div = document.createElement('div');
// 		var addFiletag=
// 			'<input type="file" multiple="multiple" name="file" id="e_img2" onchange="LoadImg1()">'
// 		 	+'<input type="button" value="파일삭제" onclick="remove_exhibition(this)"><br>'
// 		 	+'<div id="list1"></div>';
// // 		div.innerHTML = document.getElementById('add').innerHTML;
// 		div.innerHTML =addFiletag;
// 		document.getElementById('field').appendChild(div);
// 	}
// 	function remove_exhibition(obj){
// 		document.getElementById('field').removeChild(obj.parentNode);
// 	}
	
	
	</script>
</body>
</html>