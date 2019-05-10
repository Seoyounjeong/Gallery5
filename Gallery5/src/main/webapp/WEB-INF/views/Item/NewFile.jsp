<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-1.11.0.min.js"><\/script>')</script>
	<script src="src/js/jquery.brickfolio.js"></script>
	<script>
		jQuery(function($){
			$('.brickfolio').brickfolio();
		});
	</script>
	<title>나의작품목록(작품수정)</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>jQuery plugin for better grid layouts - especially for portfolio pages</title>
	<link rel="stylesheet" type="text/css" href="artistItemList/artistItemList/css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="artistItemList/css/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="artistItemList/css/demo.css">
	<link href="dist/jquery.brickfolio.min.css" rel="stylesheet">
	
	<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

<style type="text/css">
#artistItemList_updateitemForm_div {
	display: none;
}

div#artistItemList h4 {
	width: 25%;
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 3px solid rgb(26, 26, 26);
	color: rgb(50, 50, 50);
}

.heading-section span {
	font-size: 16px;
	display: block;
	margin-bottom: 5px;
	text-transform: uppercase;
	color: #e2c0bb;
	letter-spacing: 2px;
	text-align: center !important;
	margin: 0;
	padding: 0;
}

.heading-section h2 {
	font-size: 40px;
	font-weight: 600;
	line-height: 1.2;
	color: inherit;
	margin-top: 8px;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	text-align: center !important;
}

.heading-section p {
	font-family: -apple-system, BlinkMacSystemFont;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
}
</style>
<script type="text/javascript">
 	function updateitemForm(i_no){
 		
 		$.ajax({
 			url : "selectItem.do",
 			trditional:true,
 			data : {"i_no": i_no},
 			datatype : "jason",
 			success : function(data){
 				var i_img = data["item"].i_img;
 				var i_name = data["item"].i_name;
 				var i_explain = data["item"].i_explain;
 				var i_price = data["item"].i_price;
 				var i_no = data["item"].i_no;
 	
 		 		
 		 		document.getElementById("artistItemList_updateitemForm_i_img").src = "itemupload/"+i_img;
 		 		document.getElementById("artistItemList_updateitemForm_input_i_name").value= i_name;
 		 		document.getElementById("artistItemList_updateitemForm_input_i_explain").value= i_explain;
 		 		document.getElementById("artistItemList_updateitemForm_input_i_price").value= i_price;
 		 		document.getElementById("artistItemList_updateitemForm_input_i_no").value= i_no;
 		 		document.getElementById("artistItemList_updateitemForm_i_img_nameTag").value= i_img; 
 				
 				$("#artistItemList_updateitemForm_div").slideToggle();
 			
 			},
 			error : function(request,status,error){
 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			}
 		});
 		
}
 </script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<hr>
	<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
    
    <div class="artistItemList_container" style="width: 1200px; margin: 0 auto;">
<div id="artistItemList" style="width: 1200px; text-align: ;">
	<div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">My Item</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>Best Item in the room</p>
          </div>
        </div>
        	
        	<h4>나의 작품목록</h4>
		<c:choose>
		<c:when test="${empty myItemList}">
			<h3>등록하신 작품이 없습니다.</h3>
		</c:when>
		<c:otherwise>
		
			<c:forEach var ="item" items="${myItemList}">
			<div class="brickfolio">
				<div class="bf-item">
					<img  src="itemupload/${item.i_img}">
					<h4>작품명: ${item.i_name}</h4>
					<p>작품가격: ${item.i_price}<br/>
						<input type="button" value="작품수정" onclick="updateitemForm(${item.i_no})"><br/>
						<a href="deleteitem.do?i_no=${item.i_no}">작품삭제</a>
					</p>
				</div>
			</div>
			</c:forEach>
		
		
		
		</c:otherwise>
		</c:choose>
       </div>
       	<div id="artistItemList_updateitemForm_div">
			<form action="artistUpdateitem.do" method="post">
			<img alt="작품이미지" id="artistItemList_updateitemForm_i_img" width="50%">
			<br>
			
			<span>작품명 : </span>
			<input type="text" name="i_name" id="artistItemList_updateitemForm_input_i_name" >
			<br>
			
			<span>작품가격 : </span>
			<input type="text" name="i_price" id="artistItemList_updateitemForm_input_i_price">
			<br>
			<span>작품설명 : </span>
			<textarea rows="20" cols="100" name="i_explain" id="artistItemList_updateitemForm_input_i_explain"></textarea>
			
			<input type="hidden" name="i_img" id="artistItemList_updateitemForm_i_img_nameTag">
			<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
			<input type="hidden" name="i_no" id="artistItemList_updateitemForm_input_i_no" >
			<input type="submit" value="수정완료">
			</form>
	
	</div>
       
        </div>
        
	
	

</body>
</html>