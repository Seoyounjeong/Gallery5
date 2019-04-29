<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가정보수정</title>
<style type="text/css">
input{
width:500px;
}
</style>
</head>
<body>
<%
 	ArtistDto artistDto=(ArtistDto)request.getAttribute("artistDto");
%>
<h1>작가 정보 수정</h1>
	<form action="managerupdateArtist.do" method="post">
	<input type="hidden" name="a_no" value="<%=artistDto.getA_no()%>"/>
	<table border="1">
	<col width="80px;">
	<col width="500px;">
	
	<tr>
	<th>이름</th>
	<td><input type="text" name="a_name" value="<%=artistDto.getA_name()%>"/></td>
	</tr>
	
	<tr>
	<th>개인전</th>
	<td><input type="text" name="a_solo" value="<%=artistDto.getA_solo()%>"/></td>
	</tr>
	
	<tr>
	<th>단체전</th>
	<td><input type="text" name="a_Squard" value="<%=artistDto.getA_Squard()%>"/></td>
	</tr>
	
	<tr>
	<th>수상경력</th>
	<td><input type="text" name="a_career" value="<%=artistDto.getA_career()%>"/></td>
	
	</tr>
	
	<tr>
	<th>회원등급</th>
	<td><input type="text" name="a_state" value="<%=artistDto.getA_state()%>"/></td>
	</tr>
	
	
	</table>
	
	<input type="submit">
	</form>
	<script type="text/javascript">
	//input에 enter키 막음
	document.addEventListener('keydown',function(event){
		if(event.keyCode===13){
			alert('수정후에 제출버튼을 눌러주세요');
			event.preventDefault();
		}
	})
	
	</script>

</body>
</html>