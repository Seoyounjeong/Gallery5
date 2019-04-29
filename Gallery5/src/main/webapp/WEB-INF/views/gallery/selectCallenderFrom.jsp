<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>
</head>
<% CallendarDto csdto= (CallendarDto)request.getAttribute("csdto"); %>
<body>


<div>${csdto.c_start}</div>




</body>
</html>