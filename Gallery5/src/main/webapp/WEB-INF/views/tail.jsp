<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>



<div id="tail" style="clear: both;">
<hr>
<h1>tail</h1>
	<div>
	 <h5>상호명 : WEB-GALLERY</h5>

	<h5>소재지 : 서울시 영등포구 월드메리디앙 비즈센터 401호 3강의실  1조 테이블</h5>

	<h5>팀원 : 김태익 서윤정 이민규 조용권 </h5>

	<h5>문의안내 : 1577-1577</h5>

	
	</div>
</div>