<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가목록</title>
</head>

<%List<ArtistDto> list = (List<ArtistDto>)request.getAttribute("list"); %>
<body>
<h1><a href="message.do">메세지</a> </h1>
<h1>작가상태보기</h1>
<h3><a href="artiststate.do?a_state=1">상태1</a> </h3>
<h3><a href="artiststate.do?a_state=2">상태2</a></h3>
<h3><a href="artiststate.do?a_state=3">상태3</a></h3>
<input type="button" value="작가 신청" onclick="location.href='insertartistform.do'"/>



<h1>작가목록</h1>
		

<table border="1px">
	<tr>
	<th>작가번호</th>
	<th>작가이름</th>
	<th>작가개인수상경력</th>
	<th>작가단체경력</th>
	<th>작가커리어</th>
	<th>작가상태</th>
	</tr>
	<% 
		if(list.size()==0){
			%>
			<tr>
			<td colspan="6">---등록된 작가가 없습니다---</td>
			</tr>
			<% 
		}else{
	for(ArtistDto dto:list){ %>
	
	
	<tr>
		<td><a href="getartist.do?a_no=<%=dto.getA_no()%>"> <%=dto.getA_no() %></a></td>
		<td><%=dto.getA_name() %></td>
		<td><%=dto.getA_solo() %></td>
		<td><%=dto.getA_Squard() %></td>
		<td><%=dto.getA_career() %></td>
		<td><%=dto.getA_state() %></td>
	
	</tr>
	<%	} 
	} 	
			%>

</table>

<h1>별점 만들기</h1>

<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="radio" class="star {split:4}" checked="checked"/>
<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="radio" class="star {split:4}"/>
<input name="adv1" type="checkbox" class="star {split:4}"/>
</body>
</html>