<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 수정하기</title>
</head>
<body>
<%
	RequestDto requestDto=(RequestDto)request.getAttribute("requestDto");
%>
	<h1>메시지 수정하기</h1>
	<form action="managerupdateRequest.do" method="post">
	<table border="1">
	<tr>
		<th>요청번호</th>
		<td><input type="text" name="r_no" value="<%=requestDto.getR_no()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>보낸회원번호</th>
		<td><input type="text" name="r_send"  value="<%=requestDto.getR_send()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>보낸회원이름</th>
		<td><input type="text" name="r_sendname" value="<%=requestDto.getR_sendname()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>받는회원번호</th>
		<td><input type="text" name="r_receive" value="<%=requestDto.getR_receive()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>받는회원이름</th>
		<td><input type="text" name="r_receivename" value="<%=requestDto.getR_receivename()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>요청글제목</th>
		<td><input type="text" name="r_title" value="<%=requestDto.getR_title()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>요청내용</th>
		<td><input type="text" name="r_content" value="<%=requestDto.getR_content()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>보낸날짜</th>
		<!-- name="r_regdate" 를 쓰면 date타입이 자동으로 형변환이 되지않아서 오류가 남! name값을 지우던지 아님 값만넣어여  -->
		<td><input type="text"  value="<%=requestDto.getR_regdate()%>" readonly="readonly"/></td>
	</tr>
	<tr>
		<th>수락여부</th>
		<td><input type="text" name="r_agree" value="<%=requestDto.getR_agree()%>"/></td>
	</tr>
	</table>
	
	<input type="submit" value="수정완료"/>
	</form>
</body>
</html>