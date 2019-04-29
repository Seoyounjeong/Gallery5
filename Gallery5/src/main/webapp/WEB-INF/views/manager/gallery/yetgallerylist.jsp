<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승인 안된 갤러리 목록</title>
</head>
<body>

<% 
	List<GalleryDto>list=(List<GalleryDto>)request.getAttribute("list");// Object타입에 저장되도록 설계

%>
	<h1>미승인 갤러리 목록</h1>
	<table border="1">
	
	<tr>
			<th>갤러리번호</th>
			<th>소유주번호</th>
			<th>갤러리이름</th>
			<th>갤러리주소</th>
			<th>전화번호</th>
			<th>내부이미지1</th>
			<th>내부이미지2</th>
			<th>내부이미지3</th>
			<th>내부이미지4</th>
			<th>소갯말</th>
			<th>승인상태</th>
			<th>삭제</th>
		</tr>
		
		<%
	for(int i=0; i<list.size(); i++){
		GalleryDto galleryDto=list.get(i);
			
	%>
	
	<tr>
		<td><%=galleryDto.getG_no()%></td>
		<td><%=galleryDto.getM_no()%></td>
		<td><a href="managerselectGallery.do?g_no=<%=galleryDto.getG_no()%>"><%=galleryDto.getG_name()%></a></td>
		<td><%=galleryDto.getG_adress()%></td>
		<td><%=galleryDto.getG_tel()%></td>
		<td><a href="uploadFiles/<%=galleryDto.getG_img1()%>"><%=galleryDto.getG_img1()%></a></td>
		<td><a href="uploadFiles/<%=galleryDto.getG_img2()%>"><%=galleryDto.getG_img2()%></a></td>
		<td><a href="uploadFiles/<%=galleryDto.getG_img3()%>"><%=galleryDto.getG_img3()%></a></td>
		<td><a href="uploadFiles/<%=galleryDto.getG_img4()%>"><%=galleryDto.getG_img4()%></a></td>
		<td><%=galleryDto.getG_intro()%></td>
		<td><%=galleryDto.getG_state()%></td>
		<td><a href="managerdeleteGallery.do?g_no=<%=galleryDto.getG_no()%>">[삭제]</a></td>
	</tr>
		
		<%} %>
	
	
	
	</table>
	
</body>
</html>