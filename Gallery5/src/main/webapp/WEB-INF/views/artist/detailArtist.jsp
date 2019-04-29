<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
	<%ArtistDto artistDto = (ArtistDto)request.getAttribute("artistDto"); %>
	<%List<ItemDto> ilist =(List<ItemDto>)request.getAttribute("itemDto"); %>
	<%List<ExhibitionDto> elist =(List<ExhibitionDto>)request.getAttribute("exhibitionDto"); %>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div>
		<h5>작품</h5>
		<%for(ItemDto itemDto: ilist){ %>
			<div style="float: left: ;">
			<img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" width="10%" ><br/>
			<span>작품명: <%=itemDto.getI_name()%></span>
			</div>
		<%} %>
	</div>
	--------------------------*-*-*-*-*-*-*-*-*-*-*-*------------------------------------
	<div>
		<h5>전시</h5>
		<%for(ExhibitionDto exhibitionDto : elist){ %>
		<div style="float: left: ">
		<span><img alt="작가대표이미지" src="exhibitionupload/<%=exhibitionDto.getE_img()%>" width="13%"></span>
		<span>전시 제목:<%=exhibitionDto.getE_title() %></span>
		<span>전시중</span>
		</div>
	<%} %>
	</div>
	----------------------------------------
	<div>
		<h5>이력</h5>
		<p>번호:<%=artistDto.getA_no() %></p>
		<p>이름:<%=artistDto.getA_name() %></p>
		<p>개인:<%=artistDto.getA_solo() %></p>
		<p>단체:<%=artistDto.getA_Squard() %></p>
		<p>경력:<%=artistDto.getA_career() %></p>
		<p>상태:<%=artistDto.getA_state() %></p>  
	
	</div>
	
<%-- 	<div><input type="button" value="회원탈퇴" onclick="location.href='deleteartist.do?a_no=<%=artistDto.getA_no()%>'"> </div> --%>
</body>
<jsp:include page="/WEB-INF/views/tail.jsp" />	
</html>