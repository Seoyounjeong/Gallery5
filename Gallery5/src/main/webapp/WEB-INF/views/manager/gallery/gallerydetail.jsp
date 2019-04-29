<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 상세보기</title>
</head>
<body>
<%
GalleryDto galleryDto=(GalleryDto)request.getAttribute("galleryDto");
%>
	<h1>갤러리 상세보기</h1>
	<table border="1">
	<tr>
		<th>갤러리 번호</th>
		<td>${galleryDto.g_no}</td>
	</tr>
	
	<tr>
		<th>소유주 번호</th>
		<td>${galleryDto.m_no}</td>
	</tr>
	
	<tr>
		<th>갤러리 이름</th>
		<td>${galleryDto.g_name}</td>
	</tr>
	
	<tr>
		<th>갤러리 주소</th>
		<td>${galleryDto.g_adress}</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>${galleryDto.g_tel}</td>
	</tr>
	
	<tr>
		<th>내부이미지1</th>
		<td>
		<img src="uploadFiles/<%=galleryDto.getG_img1()%>" width="300px;" height="300px;"/><br>
		<a href="uploadFiles/<%=galleryDto.getG_img1()%>">자세히보기</a>
		
		
<%-- 		<img src="C:/Users/itcam/git/gallery/Gallery/src/main/webapp/uploadFiles/${galleryDto.g_img1}" --%>
<!-- 		width="300px;" height=300px;><br> -->
<%-- 		${galleryDto.g_img1}</td> --%>
	</tr>
	
	<tr>
		<th>내부이미지2</th>
		<td>
		<img src="uploadFiles/<%=galleryDto.getG_img2()%>" width="300px;" height="300px;"/><br>
		<a href="uploadFiles/<%=galleryDto.getG_img2()%>">자세히보기</a>
		
		
<%-- 		<img src="C:/Users/itcam/git/gallery/Gallery/src/main/webapp/uploadFiles/${galleryDto.g_img2}" --%>
<%-- 		width="300px;" height=300px;><br>${galleryDto.g_img2} --%>
		</td>
	</tr>
	
	<tr>
		<th>내부이미지3</th>
		<td>
		<img src="uploadFiles/<%=galleryDto.getG_img3()%>" width="300px;" height="300px;"/><br>
		<a href="uploadFiles/<%=galleryDto.getG_img3()%>">자세히보기</a>
		
<%-- 		<img src="C:/Users/itcam/git/gallery/Gallery/src/main/webapp/uploadFiles/${galleryDto.g_img3}" --%>
<!-- 		width="300px;" height=300px;><br> -->
<%-- 		${galleryDto.g_img3}</td> --%>
	</tr>
	
	<tr>
		<th>내부이미지4</th>
		<td>
		<img src="uploadFiles/<%=galleryDto.getG_img4()%>" width="300px;" height="300px;"/><br>
		<a href="uploadFiles/<%=galleryDto.getG_img4()%>">자세히보기</a>
		
<%-- 		<img src="C:/Users/itcam/git/gallery/Gallery/src/main/webapp/uploadFiles/${galleryDto.g_img4}" --%>
<!-- 		width="300px;" height=300px;><br> -->
<%-- 		${galleryDto.g_img4}</td> --%>
	</tr>
	
	<tr>
		<th>갤러리 소개</th>
		<td>${galleryDto.g_intro}</td>
	</tr>
	
	<tr>
		<th>승인상태</th>
		<td>${galleryDto.g_state}</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<button onclick="updateForm(${galleryDto.g_no})">수정</button> 
		<button onclick="delgallery(${galleryDto.g_no})">삭제</button>
		<button onclick="gallerylist()" >목록</button>
		</td>
	</tr>
	</table>
	
	<script>
	function updateForm(g_no){
		location.href="managergalleryupdateform.do?g_no="+g_no;
	}
	function delgallery(g_no){
		location.href="managerdeleteGallery.do?g_no="+g_no;
	}
	function gallerylist(){
		location.href="managerselectGalleryList.do";
	}
	
	</script>
	
</body>
</html>