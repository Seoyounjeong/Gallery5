
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 목록 보기</title>
</head>
<body>
<%
List<RequestDto>list=(List<RequestDto>)request.getAttribute("list");
%>
	<h1>메시지 목록보기</h1>
	<input type="button" value="메시지 추가" onclick="location.href='managerinsertRequestform.do'"/>
	<table border="1">
	<col width="50px;">
	<col width="50px;">
	<col width="100px;">
	<col width="50px;">
	<col width="100px;">
	<col width="200px;">
	<col width="150px;">
	<col width="60px;">
	<col width="50px;">
	<tr>
		<th>요청번호</th>
		<th>보낸회원번호</th>
		<th>보낸회원이름</th>
		<th>받는회원번호</th>
		<th>받는회원이름</th>
		<th>요청글제목</th>
		<th>보낸날짜</th>
		<th>수락여부</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<list.size();i++){
		RequestDto requestDto=list.get(i);
		
	%>
	<tr>
		<td><%=requestDto.getR_no()%></td>
		<td><%=requestDto.getR_send()%></td>
		<td><%=requestDto.getR_sendname()%></td>
		<td><%=requestDto.getR_receive()%></td>
		<td><%=requestDto.getR_receivename()%></td>
		<td><a href="managerselectRequest.do?r_no=<%=requestDto.getR_no()%>"><%=requestDto.getR_title()%></a></td>
		
		<td>
		<fmt:formatDate value="<%=requestDto.getR_regdate()%>" pattern="yyyy년MM월dd일"/>
		
		</td>
		<td><%=requestDto.getR_agree()%></td>
		<td><a href="managerdeleteRequest.do?r_no=<%=requestDto.getR_no()%>">[삭제]</a></td>
	</tr>
	
	
	<%} %>
	</table>
	
</body>
</html>