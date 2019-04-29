<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<jsp:include page="privateGnb.jsp" />	

	<div id="updateMemberForm">
	<form action="updateMember.do" method="post">
		<input type="hidden" name="m_no" value="<%=loginMember.getM_no() %>">
		<input type="hidden" name="m_grade" value="<%=loginMember.getM_grade()%>">
		<div>
			<h5>※가입하신 E-mail은 수정하실 수 없습니다</h5>
			<span>가입 E-mail </span>
			<input type="text" name="m_id" value="<%=loginMember.getM_id()%>" readonly>
		</div>
		<div>
			<span>이름 </span>
			<input type="text" name="m_name" value="<%=loginMember.getM_name()%>" >
		</div>
		<div>
			<span>주소 </span>
			<input type="text" name="m_address"  value="<%=loginMember.getM_address()%>">
		</div>
		<div>
			<span>휴대폰번호 </span>
			
			<input type="text" name="m_tel1" maxlength="3" value="<%=(loginMember.getM_tel()).substring(0, 3) %>">
			<input type="text" name="m_tel2" maxlength="4" value="<%=(loginMember.getM_tel()).substring(3, 7) %>">
			<input type="text" name="m_tel3" maxlength="4" value="<%=(loginMember.getM_tel()).substring(7, 11) %>">
		</div>
		<div>
			<input type="submit" value="수정완료">
		</div>
	</form>
</div><!-- insertMember End -->

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>