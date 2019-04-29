<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 
int m_grade =loginMember.getM_grade();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$(".solo").click(function() {
		$("#plussolo").append("<br/><input type='text' name='solo'>");
	});
	
	$(".squard").click(function() {
		$("#plussquard").append("<br/><input type='text' name='squard'>");
	});
	
	$(".career").click(function() {
		$("#pluscareer").append("<br/><input type='text' name='career'>");
	});
	
	
});



</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />

<jsp:include page="../login/privateGnb.jsp" />	

<div class="formContainer">
<form action="insertartist.do" method="get">
<div class="solodiv">
<span id="plussolo">개인전 <input type="text" name="solo" id="solo" ></span>
<span><input type="button" value="+" class="solo"> </span>
</div>

<div class="squarddiv">
<span id="plussquard"> 단체전 <input type="text" name="squard" ></span>
<span><input type="button" value="+" class="squard"> </span>
</div>

<div class="careerdiv">
<span id="pluscareer">수상경력 <input type="text" name="career" ></span>
<span><input type="button" value="+" class="career"> </span>
</div>
<input type="hidden" name="a_state" value="1" >
<input type="hidden" name="a_no" value="<%=loginMember.getM_no() %>" > <!-- 세션값 가져오기 -->
<input type="hidden" name="a_name" value="<%=loginMember.getM_name() %>" > <!-- 세션값 가져오기 -->
<input type="hidden" name="m_grade" value="4" >
<input type="hidden" name="m_no" value="<%=loginMember.getM_no() %>">
<input type="hidden" name="m_id" value="<%=loginMember.getM_id()%>">
<input type="hidden" name="m_name" value="<%=loginMember.getM_name() %>">
<input type="hidden" name="m_address" value="<%=loginMember.getM_address() %>">
<input type="hidden" name="m_tel" value="<%=loginMember.getM_tel() %>">
<input type="submit" value="작가신청">



</form>
</div>

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>