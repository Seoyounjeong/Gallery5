<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시정보수정</title>
</head>
<body>
<%
ExhibitionDto exhibitionDto=(ExhibitionDto)request.getAttribute("exhibitionDto");
%>
	<h1>전시정보수정</h1>
	<form action="managerupdateExhibition.do" method="post" enctype="Multipart/form-data">
	<table border="1">
	<tr>
		<th>전시번호</th>
		<td><input type="text" name="e_no" value="<%=exhibitionDto.getE_no()%>" readonly="readonly"/></td>
	</tr>
		
	<tr>
		<th>전시제목</th>
		<td><input type="text" name="e_title" value="<%=exhibitionDto.getE_title()%>"/></td>
	</tr>
	<tr>
		<th>전시설명</th>
		<td>
		<textarea rows="10" cols="60" name="e_explain"><%=exhibitionDto.getE_explain()%></textarea>
		
		</td>
	</tr>
	<tr>
		<th>작가번호</th>
		<td><input type="text" name="a_no" value="<%=exhibitionDto.getA_no()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>작가이름</th>
		<td><input type="text" name="a_name" value="<%=exhibitionDto.getA_name()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>전시사진</th>
		<td>
		<input type="file" name="e_img"/>
			<a href="uploadFiles/<%=exhibitionDto.getE_img()%>"><c:out value="${exhibitionDto.e_img}"/></a>
		</td>
		
	</tr>
	</table>
	
	<input type="submit" value="수정완료"/>
	</form>
	
</body>
</html>