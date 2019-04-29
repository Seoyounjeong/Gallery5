<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<div id="header">
<h1>header</h1>
<a href="exhibitionlist.do">전시목록</a>
<a href="artistlist.do">작가목록</a>
<a href="gallerylist.do">갤러리목록</a>
<a href="kyungmaelist.do">진행중인경매</a>
<%if(loginMember==null){ %>
<a href="loginform.do">로그인</a>
<%}else if(loginMember.getM_grade()==0) {%>
<a href="managermain.do">매니저메인</a>
<form action="privateMain.do">
<input type="submit" value="<%=loginMember.getM_name()%>님">
</form>
<form action="logout.do">
<input type="submit" value="로그아웃">
</form>
<%}else { %>
<form action="privatemain.do">
<input type="submit" value="<%=loginMember.getM_name()%>님">
</form>
<form action="logout.do">
<input type="submit" value="로그아웃">
</form>
<%} %>
</div>

<hr>

    
    
    
