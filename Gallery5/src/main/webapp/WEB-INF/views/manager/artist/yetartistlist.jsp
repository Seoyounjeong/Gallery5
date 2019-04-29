<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승인안된 작가목록</title>
</head>
<body>
<% 
	List<ArtistDto>list=(List<ArtistDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>

<h1>작가승인대기 목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>개인전</th>
			<th>단체전</th>
			<th>수상경력</th>
			<th>등급</th>
			
			<th>삭제</th>
		</tr>
		<%
		for(int i=0; i<list.size(); i++){
			ArtistDto artistDto=list.get(i);
			
			
	%>
	<tr>
		<td><%=artistDto.getA_no()%></td>
		<td><a href="managerselectArtist.do?a_no=<%=artistDto.getA_no()%>"><%=artistDto.getA_name()%></a></td>
		<td><%=artistDto.getA_solo()%></td>
		<td><%=artistDto.getA_Squard()%></td>
		<td><%=artistDto.getA_career()%></td>
		<td><%=artistDto.getA_state()%></td>
		<td><a href="managerdeleteArtist.do?a_no=<%=artistDto.getA_no()%>">[삭제]</a></td>
		
	<% }%>
		</table>
	
	
	
</body>
</html>