<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시 일정목록</title>
</head>
<body>
<%
List<CallendarDto>list=(List<CallendarDto>)request.getAttribute("list");

%>
	<h1>전시일정 목록</h1>
	<input type="button" value="일정추가" onclick="location.href='managerinsertcallendarform.do'">

	<table border="1">
	<col width="40px;">
	<col width="150px;">
	<col width="200px;">
	<col width="150px;">
	<col width="150px;">
	<col width="40px;">
	
	<tr>
		<th>번호</th>
		<th>전시제목</th>
		<th>전시내용</th>
		<th>시작일</th>
		<th>종료일</th>
		<th>갤러리번호</th>
		<th>삭제</th>
	</tr>
	
<%
	for(int i=0; i<list.size(); i++){
		CallendarDto callendarDto= list.get(i);
	
%>	
	<tr>
		<td><%=callendarDto.getC_no()%></td>
		<td><a href="managerselectCallendar.do?c_no=<%=callendarDto.getC_no()%>"><%=callendarDto.getC_title()%></a></td>
		<td><%=callendarDto.getC_content()%></td>
		<td><%=callendarDto.getC_start()%></td>
		<td><%=callendarDto.getC_end()%></td>
		<td><a href=""><%=callendarDto.getG_no()%></a></td>
		<td><a href="managerdeleteCallendar.do?c_no=<%=callendarDto.getC_no()%>">[삭제]</a></td>
	</tr>	
	
	<%} %>
	
	
	
	
	
	</table>	
</body>
</html>