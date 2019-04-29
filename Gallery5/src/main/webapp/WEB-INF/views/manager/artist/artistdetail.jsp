<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가상세보기</title>
</head>
<body>
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
		<td>${artistDto.a_state}</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<button onclick="updateForm(${artistDto.a_no})">수정</button>
			<button onclick="delArtist(${artistDto.a_no})">삭제</button>
			<button onclick="artistlist()">작가목록</button>
		</td>
	</tr>
	</table>

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