<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가의 전시 리스트</title>
</head>
<body>
<%
	List<ExhibitionDto>list=(List<ExhibitionDto>)request.getAttribute("list");
%>
	<h1>작가 전시리스트</h1>
	<table border="1">
	<tr>
	<th>작가번호</th>
		<th>작가이름</th>
		<th>전시번호</th>
		<th>전시제목</th>
		<th>전시설명</th>
		
		<th>전시사진</th>
		<th>조회수</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<list.size(); i++){
		ExhibitionDto exhibitionDto=list.get(i);
	%>
	
	<tr>
		<td><%=exhibitionDto.getA_no()%></td>
		<td><%=exhibitionDto.getA_name()%></td>
		<td><%=exhibitionDto.getE_no()%></td>
		<td><a href="managerselectExhibition.do?e_no=<%=exhibitionDto.getE_no()%>"><%=exhibitionDto.getE_title()%></a></td>
		<td><%=exhibitionDto.getE_explain()%></td>
		
		
		<td><a href="uploadFiles/<%=exhibitionDto.getE_img()%>"><%=exhibitionDto.getE_img()%></a></td>
		<td><%=exhibitionDto.getE_click()%></td>
		<td><a href="managerdeleteExhibition.do?e_no=<%=exhibitionDto.getE_no()%>">[삭제]</a></td>
	</tr>
	
	<%} %>
	
	</table>
	
	
</body>
</html>