
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
<h1>일정 상세보기</h1>

	<table border="1">
	<tr>
		<th>번호</th>
		<td>${callendarDto.c_no}</td>
	</tr>
	<tr>	
		<th>전시제목</th>
		<td>${callendarDto.c_title}</td>
	</tr>
	<tr>
		<th>전시내용</th>
		<td>${callendarDto.c_content}</td>
	</tr>
	<tr>
		<th>시작일</th>
		<td>${callendarDto.c_start}</td>
	</tr>
	<tr>
		<th>종료일</th>
		<td>${callendarDto.c_end}</td>
	</tr>
	<tr>
		<th>갤러리번호</th>
		<td>${callendarDto.g_no}</td>
	</tr>
	<tr>
		<td colspan="2">
		<button onclick="updateForm(${callendarDto.c_no})">수정</button>
		<button onclick="delcal(${callendarDto.c_no})">삭제</button>
		<button onclick="list()">목록</button>
		</td>
	</tr>
	</table>
	<script type="text/javascript">
		function updateForm(c_no){
			location.href="managercallendarupdateform.do?c_no="+c_no;
		}
		function delcal(c_no){
			location.href="managerdeleteCallendar.do?c_no="+c_no;
		}
		function list(){
			location.href="managerselectCallendarList.do"
		}
	</script>
</body>
</html>