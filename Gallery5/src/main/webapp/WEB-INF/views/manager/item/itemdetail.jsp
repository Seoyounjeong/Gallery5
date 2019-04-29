<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작품상세보기</title>
<style>
img{
width:200px;
height:200px;
}
</style>
</head>
<body>
<%
ItemDto itemDto=(ItemDto)request.getAttribute("itemDto");
%>
	<h1>상세보기</h1>
	<table border="1">
		<col width="100px"/>
		<col width="400px"/>
	<tr>
		<th>작품번호</th>
		<td>${itemDto.i_no}</td>
	</tr>
	<tr>
		<th>전시번호</th>
		<td>${itemDto.e_no}</td>
	</tr>
	<tr>
		<th>작품이름</th>
		<td>${itemDto.i_name}</td>
	</tr>
	<tr>
		<th>작품이미지</th>
		<td>
		<img src="uploadFiles/<%=itemDto.getI_img()%>" width="300px;" height="300px;"/><br>
		<a href="uploadFiles/<%=itemDto.getI_img()%>">자세히보기</a>
<%-- 		<img src="${itemDto.i_img}"/></td> --%>
	</tr>
	<tr>
		<th>작품설명</th>
		<td><textarea rows="10" cols="60" readonly="readonly">${itemDto.i_explain}</textarea></td>
	</tr>
	<tr>
		<th>가격</th>
		<td>${itemDto.i_price}</td>
	</tr>
	<tr>
		<th>작가번호</th>
		<td>${itemDto.a_no}</td>
	</tr>
	<tr>
		<th>회원번호</th>
		<td>${itemDto.m_no}</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<button onclick="update(${itemDto.i_no})">수정</button>
		<button onclick="list()">목록</button>
		</td>
	</tr>
	</table>
	
	<script type="text/javascript">
	function update(i_no){
		location.href="manageritemupdateform.do?i_no="+i_no;
	}
	function list(){
		location.href="managerselectItemList.do"
	}
	
	</script>
</body>
</html>