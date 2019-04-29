<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 아직 구현안함 -->
	<h1>요기</h1>
	<form action="managerupdateItemeno.do" method="post">
	<table border="1">
	<col width="40px"/>
		<col width="40px"/>
		<col width="100px"/>
		<col width="400px"/>
		<col width="400px"/>
		<col width="80px"/>
		<col width="40px"/>
		<col width="40px"/>
	<tr>
		<th>작품번호</th>
		<th>전시번호</th>
		<th>작품이름</th>
		<th>작품이미지</th>
		<th>작품설명</th>
		<th>가격</th>
		<th>작가번호</th>
		<th>회원번호</th>
		<th>삭제</th>
	</tr>
	
	</table>
	</form>
</body>
</html>