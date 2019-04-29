<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 상세보기</title>
</head>
<body>

	<h1>메시지 상세보기</h1>
	<table border="1">
	<col width="100px;">
	<col width="180px;">
	<tr>
		<th>요청번호</th>
		<td>${requestDto.r_no}</td>
	</tr>
	<tr>
		<th>보낸회원번호</th>
		<td>${requestDto.r_send}</td>
	</tr>
	<tr>
		<th>보낸회원이름</th>
		<td>${requestDto.r_sendname}</td>
	</tr>
	<tr>
		<th>받는회원번호</th>
		<td>${requestDto.r_receive}</td>
	</tr>
	<tr>
		<th>받는회원이름</th>
		<td>${requestDto.r_receivename}</td>
	</tr>
	<tr>
		<th>요청글제목</th>
		<td>${requestDto.r_title}</td>
	</tr>
	<tr>
		<th>요청내용</th>
		<td>${requestDto.r_content}</td>
	</tr>
	<tr>
		<th>보낸날짜</th>
		<td>
		<fmt:formatDate value="${requestDto.r_regdate}" pattern="yyyy년MM월dd일"/>
		</td>
	</tr>
	<tr>
		<th>수락여부</th>
		<td>${requestDto.r_agree}</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<button onclick="updateForm(${requestDto.r_no})">수정</button>
		<button onclick="delrequest(${requestDto.r_no})">삭제</button>
		<button onclick="requestlist()">목록</button>
	</tr>
	</table>
	<script>
	function updateForm(r_no){
		location.href="managerrequestupdateform.do?r_no="+r_no;
	}
	function delrequest(r_no){
		location.href="managerdeleteRequest.do?r_no="+r_no;
	}
	function requestlist(){
		location.href="managerselectRequestList.do"
	}
	
	
	</script>
	
	
	
	
</body>
</html>