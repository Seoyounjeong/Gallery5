<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>

<html>
<head>
<%
String m_id = (String)request.getAttribute("m_id");
String m_name = (String)request.getAttribute("m_name");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="login/css/insertMember.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<div id="insertMember">
	<h3>회원가입</h3>
	<p>추가정보를 입력해주시면 회원가입이 완료 됩니다.</p>
	<div id="insertMember_insertForm">
	<form action="insertMember.do" method="post">
	
			<div>
				<span>가입 E-mail </span>
				<input type="text" name="m_id" value="<%=m_id%>" readonly size="100%">
				<p>가입시 사용된 이메일은 변경 불가합니다</p>
			</div>
			<div>
				<span>이름 </span>
				<input type="text" name="m_name" value="<%=m_name%>" pattern="[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}" required="required">
				<p>한글 2~6자리</p>
			</div>
			<div>
				<span>주소 </span>
				<input type="text" name="m_address"  style="font-size: 90%;" required="required">
				<p>예시)서울 영등포구 양산로 53 (양평동3가 월드메르디앙비즈센터) 4층 일부 </p>
			</div>
			<div>
				<span>휴대폰번호 </span>
				<input type="text" name="m_tel1"  maxlength="3" pattern="[0-9]{3}"  style="width: 33%;" required="required">
				
				<input type="text" name="m_tel2"  maxlength="4" pattern="[0-9]{3,4}"   style="width: 33%;" required="required">
				
				<input type="text" name="m_tel3"  maxlength="4" pattern="[0-9]{4}"   style="width: 33%;" required="required">
			<p>앞자리 중간자리 뒷자리</p>
			</div>
			<footer>
				<input type="submit" value="가입하기" id="insertMember_insertForm_submitButton"  style="color:white; width:50%; margin-left:30%;padding-left:5%;
	padding-right:5%;">
			</footer>
		</form>
	</div>
</div><!-- insertMember End -->

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>