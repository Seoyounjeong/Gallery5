<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<title>나의전시목록</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="../login/privateGnb.jsp" />	
	<div id="myExhibitionList">
		<h3>나의전시목록</h3>
		<c:choose>
			<c:when test="${empty exhibitionList}">
			<h3>현재 전시중인 작품이 없습니다.</h3>
		</c:when>
			<c:otherwise>
				<c:forEach var ="exhibition" items="${exhibitionList}">
					<div  style=" width:30%; padding:0; text-align:center; float: left;">
					
						<img src="exhibitionupload/${exhibition.e_img}" width="33%"><br>
						<span>번호 :</span><input type="text" name="e_no" value="${exhibition.e_no}"><br>
						<span>전시명 :</span><input type="text" name="e_title" value="${exhibition.e_title}"><br>
						<span>전시설명 :</span><input type="text" name="e_explain" value="${exhibition.e_explain}"><br>
						<span>작가명</span><input type="text" name="a_name" value="${exhibition.a_name}"><br>
						<span>작가번호 :</span><input type="text" name="a_no" value="${exhibition.a_no}"><br>
						<span>조회수 :</span><input type="text" name="e_click" value="${exhibition.e_click}"><br>
						<a href="updateExhibitionForm.do?e_no=${exhibition.e_no}&a_no=${exhibition.a_no}">전시수정</a><br>
						<a href="deleteExhibition.do?e_no=${exhibition.e_no}&a_no=${exhibition.a_no}">전시삭제</a>
					</div>
				
				</c:forEach>	
			</c:otherwise>
		</c:choose>
	</div><!-- myExhibitionList END -->
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>