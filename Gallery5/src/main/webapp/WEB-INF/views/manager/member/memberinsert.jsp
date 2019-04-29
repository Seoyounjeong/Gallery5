<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 추가</title>
<style type="text/css">
body{
line-height: 30px;
}
</style>
</head>
<body>
<h1>회원추가</h1>
<form action="managerinsertMember.do" method="post" autocomplete="off">
<input type="hidden" value="회원번호"/>
아이디:<input type="email" name="m_id" pattern="[a-zA-Z0-9]+[@]naver.com" placeholder="네이버이메일을 입력하세요"
 		autocomplete="off" required="required" style="width:250px"/><br>
이름:<input type="text" name="m_name" placeholder="이름을 입력하세요" required autocomplete="off"/><br>
주소:<input type="text" name="m_address" placeholder="주소를 입력하세요" required autocomplete="off"/><br>
전화번호:<input type="tel" name="m_tel" placeholder="전화번호를 입력하세요" required autocomplete="off"/><br>
등급: <select name="m_grade">
		<option value="1">회원</option>
		<option value="0">관리자</option>
		<option value="2">작가</option>
		<option value="3">갤러리주</option>
		<option value="4">작가 승인대기</option>
		<option value="5">갤러리주 승인대기</option>
		<option value="6">작가, 갤러리주</option>
		<option value="7">작가(대기),갤러리주</option>
		<option value="8">작가,갤러리주(대기)</option>
		<option value="9">작가(대기),갤러리주(대기)</option>
	</select>
<br>


<!-- <input type="text" name="m_grade" value="1" required/> -->


<input type="submit" value="회원추가"/>

</form>
</body>
</html>