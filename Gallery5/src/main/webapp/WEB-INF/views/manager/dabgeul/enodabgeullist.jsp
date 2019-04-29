<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시별 답글</title>
</head>
<body>
<%
List<DabgeulDto>list=(List<DabgeulDto>)request.getAttribute("list");
MemberDto memberDto=(MemberDto)request.getAttribute("memberDto");
%>
	<h1>전시별 답글보기</h1>
	<table border="1">
		<col width="40px"/>
		<col width="40px"/>
		<col width="300px"/>
		<col width="40px"/>
		<col width="100px"/>
		<col width="150px"/>
		<col width="60px"/>
	<tr>
		<th>답글번호</th>
		<th>전시번호</th>
		<th>답글내용</th>
		<th>작성회원번호</th>
		<th>작성회원이름</th>
		<th>작성일</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<list.size(); i++){
	DabgeulDto dabgeulDto=list.get(i);
	%>
	<tr>
		<td><%=dabgeulDto.getD_no()%></td>
		<td><%=dabgeulDto.getE_no()%></td>
		<td><a href="managerselectDabgeul.do?d_no=<%=dabgeulDto.getD_no()%>"><%=dabgeulDto.getD_content()%></a></td>
		<td><%=dabgeulDto.getM_no()%></td>
		<td><%=dabgeulDto.getM_name()%></td>
		<td>
		<fmt:formatDate value="<%=dabgeulDto.getM_regdate()%>"
		pattern="yyyy년 MM월 dd일"/>
		</td>
		<td><a href="managerdeleteDabgeul.do?d_no=<%=dabgeulDto.getD_no()%>">[삭제]</a></td>
	
	</tr>
	
	
	
	<%} %>
	
	</table>
	
	
</body>
</html>