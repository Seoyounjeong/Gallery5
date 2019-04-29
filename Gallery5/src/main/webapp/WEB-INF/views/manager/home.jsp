<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {list-style-type:none;margin:50px;padding:0}
li {
display:inline;
padding-right:50px;
}

</style>
</head>
<body>
<div>

<ul>
	<li><a href="managerselectMemberList.do">MEMBER</a></li>
	<li><a href="managerselectArtistList.do">ARTIST</a></li>
	<li><a href="managerselectGalleryList.do">GALLERY</a></li>
	<li><a href="managerselectItemList.do">ITEM</a></li>
	<li><a href="managerselectExhibitionList.do">EXHIBITION</a></li>
	<li><a href="managerselectCallendarList.do">CALENDAR</a></li>
	<li><a href="managerselectRequestList.do">REQUEST</a></li>
	<li><a href="managerselectDabgeulList.do">DABGEUL</a></li>
	<li><a href="#">승인</a></li>
		
		<li><a href="managerselectCheckMemberList.do">회원등급변경</a></li>	
		<li><a href="managerselectyetArtistList.do?ya_state=4,7,9">작가승인</a></li>
		<li><a href="managerselectyetGalleryList.do?yg_state=5,8,9">갤러리승인</a></li>
</ul>
	
</div>

</body>
</html>