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
<title>작가·갤러리신청</title>
<link rel="stylesheet" href="login/css/upgradeMember.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="privateGnb.jsp" />
<div id="upgradeMember_body">
	<div id="upgradeMember">
		<h2>작가·갤러리신청</h2>
		<div id="upgradeMember_table">
			<div class="upgradeMember_tr">
				<div class="upgradeMember_cell">
					<h3>작가등록?</h3>
						<div>
							<h4>개인전 이력 , 단체전 이력 , 수상 경력 사항 등을 입력 해주신다면 작가로 등록이 가능합니다.</h4>
							<p>1. [작가신청] 작성 합니다. </p>
							<p>2. [매니저 검토 & 승인]  </p>
							<p>3. [승인완료] 작가로 활동 가능합니다. </p>
						</div>
				
				</div>
				<div class="upgradeMember_cell">
					<h3>갤러리등록?</h3>
						<div>
							<h4>갤러리 정보를 등록해 놓으시면 , 웹 갤러리 활동 작가를 초청하여 전시하실 수 있습니다.</h4>
							<p>1. [갤러리등록] 작성 합니다. </p>
							<p>2. [매니저 검토 & 승인] </p>
							<p>3. [승인완료] 갤러리 등록이 완료됩니다. </p>
						</div>
						
				</div>
			</div>
			<div class="upgradeMember_tr">
		
				<div class="upgradeMember_cell">
						<%if(m_grade==4 || m_grade==7 || m_grade==9) {%>
						<input type="button" value="승인대기" style="background-color: rgb(239,218,91)">
						<%}else{ %>
						<form action="insertartistform.do">
							<input type="submit" value="작가신청" style="background-color: rgb(169,194,0)">
						</form>
						<%} %>
				</div>
				
				<div class="upgradeMember_cell">
						<%if(m_grade==5 || m_grade==8 || m_grade==9) {%>
						<input type="button" value="승인대기" style="background-color: rgb(239,218,91)">
						<%}else{ %>
						<form action="insertGalleryForm.do">
							<input type="submit" value="갤러리등록" style="background-color: rgb(40,100,146)">
						</form>
						<%} %>
						</div>
			</div>
		</div>
	</div><!-- upgradeMember END -->
</div>
<jsp:include page="/WEB-INF/views/tail.jsp" />	
</body>
</html>