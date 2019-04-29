<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지 추가하기</title>
</head>
<body>
	<h1>메시지 작성</h1>
	<form action="managerinsertRequest.do" method="post" autocomplete="off">
<!-- 		요청번호:<input type="text" name="r_no" autocomplete="off" /><br> -->
		보낸회원번호:<input type="text" name="r_send" autocomplete="off"/><br>
		보낸회원이름:<input type="text" name="r_sendname" autocomplete="off"/><br>
		받는회원번호:<input type="text" name="r_receive" autocomplete="off" /><br>
		받는회원이름:<input type="text" name="r_receivename" autocomplete="off"/><br>
		요청글제목:<input type="text" name="r_title" autocomplete="off"/><br>
		글내용:<input type="text" name="r_content" autocomplete="off"/><br>
		
		수락여부:<input type="text" name="r_agree" value="3" readonly="readonly"/><br>
	
	<input type="submit" value="작성완료"/>
	
	
	</form>
</body>
</html>