<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="privateGnb.jsp" />	
	
	
	<div id="myItemList">
		<h1>나의 구매목록</h1>
		<c:choose>
		<c:when test="${empty myItemList}">
			<h3>구매하신 작품이 없습니다.</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>작품</th><th>작품명</th><th>구매가</th><th>전시보기</th>
				</tr>
				<c:forEach var ="item" items="${myItemList}">
				<tr>
					<td>이미지</td><td>${item.i_name}</td><td>${item.i_price}</td><td>전시보기</td>
				</tr>
				</c:forEach>
				
				
			</table>

		</c:otherwise>
	</c:choose>

	</div>



<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>