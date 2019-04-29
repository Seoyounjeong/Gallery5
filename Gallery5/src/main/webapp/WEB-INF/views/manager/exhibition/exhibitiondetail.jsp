<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시 상세보기</title>
</head>
<body>
	<h1>전시상세보기</h1>
	<%
	ExhibitionDto exhibitionDto=(ExhibitionDto)request.getAttribute("exhibitionDto");
	%>
	<table border="1">
	<tr>
		<th>전시번호</th>
		<td>${exhibitionDto.e_no}</td>
	</tr>
		
	<tr>
		<th>전시제목</th>
		<td>${exhibitionDto.e_title}</td>
	</tr>
	<tr>
		<th>전시설명</th>
		<td><textarea rows="10" cols="60" readonly="readonly">${exhibitionDto.e_explain}</textarea></td>
	</tr>
	<tr>
		<th>작가번호</th>
		<td>${exhibitionDto.a_no}</td>
	</tr>
	<tr>
		<th>작가이름</th>
		<td>${exhibitionDto.a_name}</td>
	</tr>
	<tr>
		<th>전시사진</th>
		<td>
		 <img src="uploadFiles\<%=exhibitionDto.getE_img()%>" width="300px;" height="300px;"/>
		<br> <a href="uploadFiles\<%=exhibitionDto.getE_img()%>">
		 사진보기
		 </a>
		 </td>
	</tr>
	<tr>
		<td colspan="2">
		<button onclick="updateForm(${exhibitionDto.e_no})">수정</button>
		<button onclick="delexhibition(${exhibitionDto.e_no})">삭제</button>
		<button onclick="exhibitionlist()">전시목록</button>
		</td>
	</tr>
	</table>
	<script type="text/javascript">
	function updateForm(e_no){
		location.href="managerexhibitionupdateform.do?e_no="+e_no;
	}
	function delexhibition(e_no){
		location.href="managerdeleteExhibition.do?e_no="+e_no;
	}
	function exhibitionlist(){
		location.href="managerselectExhibitionList.do"
	}
	
	</script>
	
</body>
</html>