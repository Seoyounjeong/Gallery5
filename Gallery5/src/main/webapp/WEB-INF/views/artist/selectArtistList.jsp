<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%List<ArtistDto> list = (List<ArtistDto>)request.getAttribute("list");  System.out.println("이미지 디티오는?+"+list);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가목록</title>
<script type="text/javascript">
	function pop(r_send,a_no,r_name,a_name) {
		var a = a_name;
		var aa = window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+a_no+'&r_sendname='+r_name
		+'&r_receivename='+a_name,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
		
	
	}
	</script>

</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp" />


<h1>작가목록</h1>

	<% 
		if(list.size()==0){
			%>
			<!-- <tr> -->
			<h5>---등록된 작가가 없습니다---</h5>
			<!-- </tr> -->
			<% 
		}else{
	for(ArtistDto dto:list){ %>
	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>
	<div style="width: 30%; padding: 0;text-align: center; float: left;">
		<img alt="작가대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" width="33%"><br/>
		<span>작가번호:<a href="getartist.do?a_no=<%=dto.getA_no()%>"> <%=dto.getA_no() %></a></span><br/>
		<span>작가이름:<%=dto.getA_name() %></span><br/>
		<span>작가개인수상경력:<%=dto.getA_solo() %></span><br/>
		<span>작가단체경력<%=dto.getA_Squard() %></span><br/>
		<span>작가커리어<%=dto.getA_career() %></span><br/>
		<span>작가상태<%=dto.getA_state() %></span><br/>
	<%}else if(loginMember.getM_grade()==3){ %>
		<div style="width: 30%; padding: 0;text-align: center; float: left;">
		<img alt="작가대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" width="33%"><br/>
		<span>작가번호:<a href="getartist.do?a_no=<%=dto.getA_no()%>"> <%=dto.getA_no() %></a></span><br/>
		<span>작가이름:<%=dto.getA_name() %></span><br/>
		<span>작가개인수상경력:<%=dto.getA_solo() %></span><br/>
		<span>작가단체경력<%=dto.getA_Squard() %></span><br/>
		<span>작가커리어<%=dto.getA_career() %></span><br/>
		<span>작가상태<%=dto.getA_state() %></span><br/>
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=dto.getA_no() %>','<%=loginMember.getM_name() %>','<%=dto.getA_name() %>')" >
		<%} %>
<%-- 		 <%if(loginMember.getM_grade()==3){  %> 
		
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=dto.getA_no() %>','<%=loginMember.getM_name() %>','<%=dto.getA_name() %>')" >
		
		 --%>
	</div>
	<%}} %>
	









<jsp:include page="/WEB-INF/views/tail.jsp" />	
</body>
</html>