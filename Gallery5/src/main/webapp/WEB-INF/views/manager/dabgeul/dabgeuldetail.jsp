<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글 상세보기</title>
</head>
<body>
	<h1>답글상세보기</h1>
	
	<table border="1">
	<col width="80px;"/>
	<col width="150px;"/>
	<tr>
		<th>답글번호</th>
		<td>${dabgeulDto.d_no}</td>
	</tr>
	
	<tr>
		<th>전시번호</th>
		<td>${dabgeulDto.e_no}</td>
	</tr>
	
	
	<tr>
		<th>답글내용</th>
		<td>${dabgeulDto.d_content}</td>
	</tr>
	
	
	<tr>
		<th>작성회원번호</th>
		<td>${dabgeulDto.m_no}</td>
	</tr>
	
	<tr>
		<th>작성회원이름</th>
		<td>${dabgeulDto.m_name}</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td>
		<fmt:formatDate value="${dabgeulDto.m_regdate}"
		pattern="yyyy년 MM월 dd일"/>
<%-- 		${dabgeulDto.m_regdate} --%>
		</td>
	</tr>
	
	<tr>
	<td colspan="2">
	<button onclick="updateForm(${dageulDto.d_no})">수정</button>
	<button onclick="deldabgeul(${dabgeulDto.d_no})">삭제</button>
	<button onclick="list()">답글목록</button>
	</td>
	</tr>
	
	</table>
	
	<script type="text/javascript">
	function updateForm(d_no){
		location.href="managerdabgeulupdateform.do?d_no="+${dabgeulDto.d_no};
	}
	function deldabgeul(d_no){
		location.href="managerdeleteDabgeul.do?d_no="+${dabgeulDto.d_no};
	}
	function list(){
		location.href="managerselectDabgeulList.do"
	}
	
	</script>
</body>
</html>