<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@page import="java.util.List"%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>
</head>
<% List<CallendarDto>list =(List<CallendarDto>)request.getAttribute("list"); %>
<body>

<h1>일정 리스트</h1>


<%for(CallendarDto dto:list){%>
			
	<div style="border: 1px solid black; margin: 10px;">	
	<div style="display: inline-block; margin: 2px; padding: 2px; border: 1px solid black;"><span>G_NO</span><%=dto.getG_no()%></div>
	<div style="display: inline-block; margin: 2px; padding: 2px; border: 1px solid black;"><span>C_TITLE</span><%=dto.getC_title()%></div>
	<div style="display: inline-block; margin: 2px; padding: 2px; border: 1px solid black;"><span>C_CONTENT</span><%=dto.getC_content()%></div>
	<div style="display: inline-block; margin: 2px; padding: 2px; border: 1px solid black;"><span>C_START</span><%=dto.getC_start()%></div>
	<div style="display: inline-block; margin: 2px; padding: 2px; border: 1px solid black;"><span>C_END</span><%=dto.getC_end() %></div>
	</div>	

<%}%>
			




</body>
</html>