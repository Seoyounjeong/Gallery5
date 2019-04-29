<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<title>인덱스</title>
</head>
<% MemberDto Ddto = (MemberDto) session.getAttribute("loginMember"); %>
<%-- <%int m_grade=%><%=Ddto.getM_grade() %><%; %> --%>
<body>

<% if(Ddto==null){%>
		<script type="text/javascript">alert("로그인하자 친구야") 
		window.location.href="loginform.do";
		
	</script>
	
	
	<%-- <%}else{%>

	<%if(m_grade==2||m_grade==5||m_grade==8||m_grade==9){%>
	<script type="text/javascript">alert("작가만 하자 친구야") 
		window.location.href="gallerylist.do";
		
	</script> --%>
 	<%}else{%>

	<form action="insertGallery.do" method="post" enctype="multipart/form-data">

	<div>
	<span>m_no</span> <input type="text" name="m_no" value="<%= Ddto.getM_no() %>">
	</div>


	<div>
	<span>상호명</span> <input type="text" name="g_name">
	</div>

	<div>
	<span>소갯말</span> <input type="text" name="g_intro">
	</div>


	<div>
	<span>주소</span> <input type="text" name="g_adress">
	</div>

	<div>
	<span>번호</span> <input type="text" name="g_tel">
	</div>

	<div>
	<span>메인사진</span> <input multiple="multiple" type="file" name="file" required="required">
	</div>

	<div>
	<span>내부사진1</span> <input multiple="multiple" type="file" name="file" required="required">
	</div>

	<div>
	<span>내부사진2</span> <input multiple="multiple" type="file" name="file" required="required">
	</div>

	<div>
	<span>내부사진3</span> <input multiple="multiple" type="file" name="file" required="required">
	</div>
	
<%-- 	<%if(m_grade==1){%>
	<input type="text" name="m_grade" value="5" >
	<%}else if(m_grade==7){%>
	<input type="text" name="m_grade" value="9" >
	<%}else{%>
	<input type="text" name="m_grade" value="<%=Ddto.getM_grade()%>" >
	<%}%> --%>
	
<input type="text" name="m_grade" value="<%=Ddto.getM_grade()%>	">
<input type="text" name="m_grade" value="5" >
<input type="text" name="m_id" value="<%=Ddto.getM_id()%>">
<input type="text" name="m_name" value="<%=Ddto.getM_name() %>">
<input type="text" name="m_address" value="<%=Ddto.getM_address() %>">
<input type="text" name="m_tel" value="<%=Ddto.getM_tel() %>">

<input type="submit">

	</form>	
<%}%>

<%-- <%}%> --%>
 










</body>
</html>