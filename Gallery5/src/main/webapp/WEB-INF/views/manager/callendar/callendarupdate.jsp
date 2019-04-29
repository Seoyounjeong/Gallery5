<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정수정</title>
</head>
<body>
<%
CallendarDto callendarDto=(CallendarDto)request.getAttribute("callendarDto");
%>
	<h1>일정수정하기</h1>
	<form action="managerupdateCallendar.do" method="post">
	<input type="hidden" name="c_no" value="<%=callendarDto.getC_no()%>"/>
	<table border="1">
	<col width="150px;">
		<col width="400px;">
	
	<tr>
	<th>전시제목</th>
	<td><input type="text" name="c_title" value="<%=callendarDto.getC_title()%>"/>
	</td>
	</tr>
	
	<tr>
	<th>전시내용</th>
	<td><input type="text" name="c_content" value="<%=callendarDto.getC_content()%>"/>
	</td>
	</tr>
	<tr>
	<th>전시시작일</th>
	<td><input type="text" name="c_start" value="<%=callendarDto.getC_start()%>"/>
	</td>
	</tr>
	<tr>
	<th>전시종료일</th>
	<td><input type="text" name="c_end" value="<%=callendarDto.getC_end()%>"/>
	</td>
	</tr>
	<tr>
	<th>갤러리번호</th>
	<td><input type="text" name="g_no" value="<%=callendarDto.getG_no()%>"/>
	</td>
	</tr>
	
	
	</table>
	
	<input type="submit" value="수정완료"/>
	</form>
</body>
</html>