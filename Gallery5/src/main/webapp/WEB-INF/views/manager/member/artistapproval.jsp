<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%ArtistDto artistDto=(ArtistDto)request.getAttribute("artistDto");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
window.resizeTo(500,500)

</script>
<meta http-equiv="Content- Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>작가신청정보</h2>
	<table border="1">
		<col width="150px;">
		<col width="400px;">
	<tr>
		<th>번호</th>
		<td>${artistDto.a_no}
		
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${artistDto.a_name}
		</td>
	</tr>
	<tr>
		<th>개인전</th>
		<td>${artistDto.a_solo}
		
		</td>
	</tr>
	<tr>
		<th>단체전</th>
		<td>${artistDto.a_Squard}
		
		</td>
	</tr>
	<tr>
		<th>수상경력</th>
		<td>${artistDto.a_career}
		
		</td>
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
			<button onclick="updatestate(${artistDto.a_no})">승인</button>
			<button onclick="close()">닫기</button>
		</td>
	</tr>
	</table>
<script type="text/javascript">
function updatestate(a_no){
	location.href="managerArtistStateUpdate.do?a_no="+a_no;
}




</script>
	
</body>
</html>