<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시 작품</title>
</head>
<body>
	<%
	List<ItemDto>list=(List<ItemDto>)request.getAttribute("list");
	
	%>
	<input type="button" value="작픔추가" onclick="location.href='managerinsertItemform1.do'"/>
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
	
	<%
	for(int i=0; i<list.size(); i++){
		ItemDto itemDto=list.get(i);
	%>
	<tr>
		<td><%=itemDto.getI_no()%></td>
		<td><%=itemDto.getE_no()%></td>
		<td><a href="managerselectItem.do?i_no=<%=itemDto.getI_no()%>"><%=itemDto.getI_name()%></a></td>
		<td><a href="uploadFiles/<%=itemDto.getI_img()%>"><%=itemDto.getI_img()%></a></td>
		<td><%=itemDto.getI_explain()%></td>
		<td><%=itemDto.getI_price()%></td>
		<!-- jsp 파일이 달라서 안됨.. -->
		<td><a href=""><%=itemDto.getA_no()%></a></td>
		<td><%=itemDto.getM_no()%></td>
		<td><a href="managerdeleteItem.do?i_no=<%=itemDto.getI_no()%>">[삭제]</a></td>
	</tr>
	
	<%} %>
	
	
	</table>
	
</body>
</html>