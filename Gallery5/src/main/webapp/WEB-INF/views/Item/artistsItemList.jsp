<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의작품목록(작품수정)</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
 
 <style type="text/css">
 #artistItemList_updateitemForm_div{
 										display:none;}
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
<jsp:include page="../login/privateGnb.jsp" />	
<div id="artistItemList">
	<h1>나의 작품목록</h1>
	<c:choose>
		<c:when test="${empty myItemList}">
			<h3>등록하신 작품이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>작품</th><th>작품명</th><th>구매가</th><th>전시보기</th><th>수정</th><th>삭제</th>
				</tr>
				<c:forEach var ="item" items="${myItemList}">
				<tr>
					<td style="margin:0 auto; padding:0px ; width: 30%;">
					<img  src="itemupload/${item.i_img}" width="10%" style="margin: 0 ;padding:0; width:50%;"></td>
					<td>${item.i_name}</td>
					<td>${item.i_price}</td>
					<td>전시보기</td>
					<td><input type="button" value="작품수정" onclick="updateitemForm(${item.i_no})"></td>
					<td><a href="deleteitem.do?i_no=${item.i_no}">작품삭제</a></td>
					
				</tr>
				</c:forEach>
				
				
			</table>

		</c:otherwise>
	</c:choose>
	
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
</div><!--  artistItemList End -->
<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>
</html>