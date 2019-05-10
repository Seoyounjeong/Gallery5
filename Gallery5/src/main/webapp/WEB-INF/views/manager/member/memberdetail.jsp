<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto memberDto=(MemberDto)request.getAttribute("memberDto"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세보기</title>
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
	<h1>회원 상세보기</h1>
	<table border="1">
	
		<col width="150px;">
		<col width="400px;">
		
		
	
		<tr>
			<th>번호</th>
			<td>${memberDto.m_no}</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>${memberDto.m_id}</td>
		</tr>
		
		<tr>
			<th>이름</th>
			<td>${memberDto.m_name}</td>
		</tr>
	
		<tr>
			<th>주소</th>
			<td>${memberDto.m_address}</td>
		</tr>
	
		<tr>
			<th>전화번호</th>
			<td>${memberDto.m_tel}</td>
		</tr>
	
		<tr>
			<th>등급</th>
			<td>
			<%if(memberDto.getM_grade()==1){%>
				회원
			<%}else if(memberDto.getM_grade()==0){%>
			  	관리자
			<%}else if(memberDto.getM_grade()==2){%>
				작가
			<%}else if(memberDto.getM_grade()==3){%>
				갤러리주
			<%}else if(memberDto.getM_grade()==4){%>
				작가(대기)
			<%}else if(memberDto.getM_grade()==5){%>
				갤러리주(대기)
			<%}else if(memberDto.getM_grade()==6){%>
				작가, 갤러리주
			<%}else if(memberDto.getM_grade()==7){%>
				작가(대기),갤러리주
			<%}else if(memberDto.getM_grade()==8){%>
				작가,갤러리주(대기)
			<%}else if(memberDto.getM_grade()==9){%>
				작가(대기),갤러리주(대기)
			<%} %>
			
			</td>
		</tr>
	
		<tr>
		<td colspan="2">
			<button onclick="updateForm(${memberDto.m_no})">수정</button>
			<button onclick="delMember(${memberDto.m_no})">삭제</button>
			<button onclick="memberlist()">회원목록</button>
		</td>
		</tr>
	</table>
</div>	

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	<script type="text/javascript">
		function updateForm(m_no){
			location.href="managerupdateform.do?m_no="+m_no;
		}
		function delMember(m_no){
			location.href="managerdeleteMember.do?m_no="+m_no;
			
		}
		function memberlist(){
			location.href="managerselectMemberList.do";
		}
	
	
	</script>
	
	
	
</body>
</html>