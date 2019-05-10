<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답글추가하기</title>
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


	<h1>답글추가하기</h1>
	<form action="managerinsertDabgeul.do" method="post" autocomplete="off">
	
	전시번호:<input type="text" name="e_no" autocomplete="off"/><br>
	답글내용:<input type="text" name="d_content" autocomplete="off"/><br>
	작성회원번호:<input type="text" name="m_no" autocomplete="off"/><br>
	작성회원이름:<input type="text" name="m_name" autocomplete="off"/><br>
	
	<input type="submit" value="답글추가"/>
	
	</form>

</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>
	
</body>
</html>