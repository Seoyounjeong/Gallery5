<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%List<KyungmaeDto> allkyungmaeList =(List<KyungmaeDto>)request.getAttribute("allkyungmaeList"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>경매목록</h1>
	<a href="managerKyungmaeList_End1.do">오늘종료경매</a>
	<a href="managerKyungmaeList_Ing1.do">진행중인경매</a>
	<table border="1">
	<tr>
		<th>경매번호</th>
		<th>작품번호</th>
		<th>작품명</th>
		<th>최고가</th>
		<th>최고가회원번호</th>
		<th>최고가회원명</th>
		<th>2순위</th>
		<th>2순위회원번호</th>
		<th>2순위회원명</th>
		<th>종료일</th>
		<th>상태</th>
		<th>삭제</th>
	</tr>
	
	<%
	for(int i=0; i<allkyungmaeList.size(); i++){
		KyungmaeDto kyungmaeDto=allkyungmaeList.get(i);
	%>
	<tr>
		<td><%=kyungmaeDto.getK_no()%></td>
		<td><%=kyungmaeDto.getI_no()%></td>
		<td><%=kyungmaeDto.getI_name()%></td>
		<td><%=kyungmaeDto.getK_first_price()%></td>
		<td><%=kyungmaeDto.getK_first_no()%></td>
		<td><%=kyungmaeDto.getK_first_name()%></td>
		<td><%=kyungmaeDto.getK_second_price()%></td>
		<td><%=kyungmaeDto.getK_second_no()%></td>
		<td><%=kyungmaeDto.getK_second_name()%></td>
		<td><%=kyungmaeDto.getK_regdate()%></td>
		<td><%=kyungmaeDto.getK_state()%></td>
		<td><a href="managerDeleteKyungmae1.do?k_no=<%=kyungmaeDto.getK_no()%>">삭제</a></td>
	</tr>
			
	
	
	
	<%}
	%>
	
	
	</table>
	
	
</body>
</html>