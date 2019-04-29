<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%ItemDto itemDto = (ItemDto)request.getAttribute("itemDto"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매</title>
</head>
<body>
	<div id="insertKyungmae">
		<h3>경매진행</h3>
		<p>참가 버튼을 누르시면 최초입찰자로 입찰됩니다.</p>
		<p>참여하신 경매는 7일간 진행되며 7일 후 정각에 종료됩니다.</p>
		<div>
			<img src="itemupload/<%=itemDto.getI_img()%>" width=50%;>	
		</div>		
		<div>
			<form action="insertKyungmae.do" method="post">
				<span>작품명 : </span><span><%=itemDto.getI_name()%></span><br>
				<span>경매 시작가 : </span><span><%=itemDto.getI_price()%></span><br>
				<input type="hidden" name="i_no" value=<%=itemDto.getI_no()%>>
				<input type="submit" value="입찰하기">
			</form>
		</div>
	</div>
</body>
</html>