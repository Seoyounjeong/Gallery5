<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 
int m_grade =loginMember.getM_grade();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="privateGnb.jsp" />
	<div id="upgradeMember">
		<div>
		<h2>작가등록?</h2>
		<p>
		개인전 이력 , 단체전 이력 , 수상 경력 사항 등을 입력 해주신다면 작가로 등록이 가능합니다.
		
		</p>
		<p>
		아무런 이력이 없어도도 작품과 전시만 있다면 웹 겔러리를 통해 작가로 데뷔 가능합니다!
		</p>
		<%if(m_grade==4 || m_grade==7 || m_grade==9) {%>
		<input type="button" value="작가승인대기중">
		<%}else{ %>
		<form action="insertartistform.do">
			
			<input type="submit" value="작가등록하기!">
		</form>
		<%} %>
		</div>
		<div>
		
		<h2>갤러리등록?</h2>
		<p>
		갤러리 정보를 등록해 놓으시면 , 웹 갤러리 활동 작가를 초청하여 전시하실 수 있습니다.		
		</p>
		<%if(m_grade==5 || m_grade==8 || m_grade==9) {%>
		<input type="button" value="갤러리승인대기중">
		<%}else{ %>
		<form action="insertGalleryForm.do">
			
			<input type="submit" value="갤러리등록하기!">
		</form>
		<%} %>
		</div>


	</div>
<jsp:include page="/WEB-INF/views/tail.jsp" />	
</body>
</html>