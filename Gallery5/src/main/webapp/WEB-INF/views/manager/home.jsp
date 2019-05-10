<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
ul {list-style-type:none;margin:50px;padding:0}
li {
display:inline;
padding-right:50px;
}
.managermenu{
position: absolute;
left: 230px;
}
.mainHeader{
	-webkit-transition: All 0.2s ease;
	-moz-transition: All 0.2s ease;
	-o-transition: All 0.2s ease;
	display: table;
	width: 100%;
	border-collapse: collapse;
    border: none;
    table-layout:fixed;
    background-color: #ffffff;	
}
.tail{
position: absolute;
top: 500px;
}

</style>
</head>
<body>
<div class="">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>


<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

</body>
</html>