<%@page import="com.hk1.gallery.dto.ItemDto"%>

<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작품 수정하기</title>
</head>
<body>
<h1>작품수정</h1>
<%
ItemDto itemDto=(ItemDto)request.getAttribute("itemDto");
%>
<form action="managerupdateItem.do" method="post" enctype="multipart/form-data">
<table border="1">
	<tr>
		<th>작품번호</th>
		<td><input type="text" name="i_no" value="<%=itemDto.getI_no()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>전시번호</th>
		<td><input type="text" name="e_no" value="<%=itemDto.getE_no()%>" /></td>
	</tr>
	<tr>
		<th>작품이름</th>
		<td><input type="text" name="i_name" value="<%=itemDto.getI_name()%>"/></td>
	</tr>
	<tr>
		<th>작품이미지</th>
		<td>
		<input type="file" name="i_img" style="width:75px;"/>
		<a href="uploadFiles/<%=itemDto.getI_img()%>"><%=itemDto.getI_img()%></a>
		</td>
	</tr>
	<tr>
		<th>작품설명</th>
		<td><textarea rows="10" cols="60" name="i_explain"><%=itemDto.getI_explain()%></textarea></td>
	</tr>
	<tr>
		<th>가격</th>
		<td><input type="text" name="i_price" value="<%=itemDto.getI_price()%>"/></td>
	</tr>
	<tr>
		<th>작가번호</th>
		<td><input type="text" name="a_no" value="<%=itemDto.getA_no()%>"/></td>
	</tr>
	<tr>
		<th>회원번호</th>
		<td><input type="text" name="m_no" value="<%=itemDto.getM_no()%>"/></td>
	</tr>
	</table>
	<input type="submit" value="수정완료"/>
	</form>
</body>
</html>