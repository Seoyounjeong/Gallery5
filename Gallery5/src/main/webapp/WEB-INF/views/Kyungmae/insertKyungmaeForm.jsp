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
<style type="text/css">
html,body{
	margin:0;
	padding:0;
}
#insertKyungmae{
	width: 100%;
}
#insertKyungmae h3{
	text-align:center;
	width: 100%;
	color: white;
	background-color: rgb(26,26,26);
}
#insertKyungmae h4{
	margin-left:10%;
	text-align: left;
	width: 30%;
	color: rgb(160,160,160);
	padding-bottom: 5px;
	border-bottom: 2px solid rgba(160,160,160,0.5);
}
#insertKyungmae p{
	width:60%;
	font-size: 80%;
	margin-left:10%;
	margin-right:30%;
	text-align:left;
}
#insertKyungmae_div_img{
	margin-top:10%;
	width: 100%;
	text-align: center;
	vertical-align: middle;
	background-color: rgb(26,26,26);
}
#insertKyungmae_div_button{
	width: 80%;
	margin:0 auto;
	text-align: right;
}
#insertKyungmae_div_button input{
	border: none;
	cursor: pointer;
	border-radius: 10px;
	color: white;
	padding:7px;
	background-color: rgba(26,26,26);
	font-weight: bold;
}
#insertKyungmae_div_button input:hover{
	background-color: rgb(122,201,67);
}
#insertKyungmae_div_explain{
	width: 70%;
	margin:0 auto;
	text-align: left;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="insertKyungmae">
		<h3>경매진행</h3>
		<h4>안내</h4>
		<p>참가 버튼을 누르시면 최초입찰자로 입찰됩니다.</p>
		<p>참여하신 경매는 7일간 진행되며 7일 후 정각에 종료됩니다.</p>
		<div id="insertKyungmae_div_img">
			<img src="itemupload/<%=itemDto.getI_img()%>" width=60%;>	
		</div>		
		<h4>정보</h4>
		<div id="insertKyungmae_div_explain">
	
				<span>작품명 : </span><span><%=itemDto.getI_name()%></span><br>
				<span>시작가 : </span><span><%=itemDto.getI_price()%>원</span><br>
			</div>
		<div id="insertKyungmae_div_button">
			<form action="insertKyungmae.do" method="post">
				<input type="hidden" name="i_no" value=<%=itemDto.getI_no()%>>
				<input type="submit" value="입찰하기">
			</form>
		</div>
	</div>
</body>
</html>