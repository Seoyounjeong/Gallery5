<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%ArtistDto artistDto=(ArtistDto)request.getAttribute("artistDto");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가상세보기</title>
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


<h1>작가 상세보기</h1>
	<table border="1">
		<col width="150px;">
		<col width="400px;">
		
	<tr>
		<th>번호</th>
		<td>${artistDto.a_no}</td>
	</tr>
	
	
	<tr>
		<th>이름</th>
		<td>${artistDto.a_name}</td>
	</tr>
	
	<tr>
		<th>개인전</th>
		<td>${artistDto.a_solo}</td>
	</tr>
	
	<tr>
		<th>단체전</th>
		<td>${artistDto.a_Squard}</td>
	</tr>
	
	<tr>
		<th>수상경력</th>
		<td>${artistDto.a_career}</td>
	</tr>
	
	<tr>
		<th>등급</th>
		<td>
		<%if(artistDto.getA_state()==1){%>
			미승인
		<%}else if(artistDto.getA_state()==2){%>
			승인
		<%}%>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<button onclick="updateForm(${artistDto.a_no})">수정</button>
			<button onclick="delArtist(${artistDto.a_no})">삭제</button>
			<button onclick="artistlist()">작가목록</button>
		</td>
	</tr>
	</table>
	
	
	</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

<script type="text/javascript">
	function updateForm(a_no){
		location.href="managerartistupdateform.do?a_no="+a_no;
	}
	function delArtist(a_no){
		location.href="managerdeleteArtist.do?a_no="+a_no;
	}
	function artistlist(){
		location.href="managerselectArtistList.do";
	}

</script>
</body>

</html>