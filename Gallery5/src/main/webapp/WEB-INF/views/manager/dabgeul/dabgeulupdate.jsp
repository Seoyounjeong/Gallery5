<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글 수정</title>
</head>
<body>
	<h1>답글수정</h1>
	<%
	DabgeulDto dabgeulDto =(DabgeulDto)request.getAttribute("dabgeulDto");
	
	%>
	<form action="managerupdateDabgeul.do" method="post">
	<table border="1">
	<tr>
		<th>답글번호</th>
		<td><input type="text" name="d_no" value="<%=dabgeulDto.getD_no()%>" readonly="readonly"/></td>
	</tr>
	
	<tr>
		<th>전시번호</th>
		<td><input type="text" name="e_no" value="<%=dabgeulDto.getE_no()%>" readonly="readonly"/></td>
	</tr>
	
	
	<tr>
		<th>답글내용</th>
		<td><input type="text" name="d_content" value="<%=dabgeulDto.getD_content()%>"/></td>
	</tr>
	
	
	<tr>
		<th>작성회원번호</th>
		<td><input type="text" name="m_no" value="<%=dabgeulDto.getM_no()%>" readonly="readonly"/></td>
	</tr>
	
	<tr>
		<th>작성회원이름</th>
		<td><input type="text" name="m_name" value="<%=dabgeulDto.getM_name()%>" /></td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td><input type="text" name="m_regdate1" value="<%=dabgeulDto.getM_regdate()%>" readonly="readonly"/></td>
	</tr>
	
	
	</table>
	<input type="submit" value="수정완료"/>
	</form>
	
</body>
</html>