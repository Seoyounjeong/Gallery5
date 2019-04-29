<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
	List<MemberDto> list=(List<MemberDto>)request.getAttribute("list");// Object타입에 저장되도록 설계
%>
	<h1>회원목록</h1>
	<form action="managerselectMemberList.do" method="post">
	<input type="button" value="회원추가" onclick="location.href='managerinsertmemberform.do'">
	<input type="button" value="미승인회원" onclick="location.href='managerselectCheckMemberList.do'">
	<table border="1">
		<col width="40px;">
		<col width="150px;">
		<col width="150px;">
		<col width="400px;">
		<col width="200px;">
		<col width="150px;">
		<col width="50px;">
	
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>등급</th>
		<th>삭제</th>
	</tr>
		
	<%
		for(int i=0; i<list.size();i++){
			MemberDto memberDto=list.get(i);
			%>
			<tr>
				<td><%=memberDto.getM_no()%></td>
				<td><a href="managerselectMember1.do?m_no=<%=memberDto.getM_no()%>"><%=memberDto.getM_id()%></a></td>
				<td><%=memberDto.getM_name()%></td>
				<td><%=memberDto.getM_address()%></td>
				<td><%=memberDto.getM_tel()%></td>
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
				<td><a href="managerdeleteMember.do?m_no=<%=memberDto.getM_no()%>">[삭제]</a></td>
			</tr>
	<%
	}
	%>
	</table>
	</form>
</body>
</html>