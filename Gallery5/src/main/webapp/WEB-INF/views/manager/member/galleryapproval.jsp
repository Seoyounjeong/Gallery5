<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%
GalleryDto galleryDto=(GalleryDto)request.getAttribute("galleryDto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.main{
position: absolute;
top:150px;
}
</style>
</head>
<body>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main">

	<h2>갤러리 신청정보</h2>
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
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img1()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/<%=galleryDto.getG_img1()%>">자세히보기</a>
		</tr>
	
	<tr>
		<th>내부이미지2</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img2()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/<%=galleryDto.getG_img2()%>">자세히보기</a>
		
	</td>
	</tr>
	
	<tr>
		<th>내부이미지3</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img3()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/<%=galleryDto.getG_img3()%>">자세히보기</a>
		
	</tr>
	
	<tr>
		<th>내부이미지4</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img4()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/<%=galleryDto.getG_img4()%>">자세히보기</a>
	</tr>
	
	<tr>
		<th>갤러리 소개</th>
		<td>${galleryDto.g_intro}</td>
	</tr>
	<tr>
		<th>승인상태</th>
		<td>
		<%if(galleryDto.getG_state()==1){%>
			미승인
		<%}else if(galleryDto.getG_state()==3){%>
			승인
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<button onclick="updatestate(${galleryDto.m_no})">승인</button> 
		<button onclick="close()" >닫기</button>
		</td>
	</tr>
	</table>
	</div>
	<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
	<script type="text/javascript">
	function updatestate(m_no){
	location.href="managerGalleryStateUpdate.do?m_no="+m_no;
}

	</script>
	
</body>
</html>