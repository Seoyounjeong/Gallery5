<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String m_id = (String)request.getAttribute("m_id");
String m_name = (String)request.getAttribute("m_name");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<div id="insertMember">
	<form action="insertMember.do" method="post">
		<div>
			<span>가입 E-mail </span>
			<input type="text" name="m_id" value="<%=m_id%>" readonly>
		</div>
		<div>
			<span>이름 </span>
			<input type="text" name="m_name" value="<%=m_name%>" >
		</div>
		<div>
			<span>주소 </span>
			<input type="text" name="m_address">
		</div>
		<div>
			<span>휴대폰번호 </span>
			<input type="text" name="m_tel1"  maxlength="3">
			<input type="text" name="m_tel2"  maxlength="4">
			<input type="text" name="m_tel3"  maxlength="4">
		</div>
		<div>
			<input type="submit" value="가입하기">
		</div>
	</form>
</div><!-- insertMember End -->

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>