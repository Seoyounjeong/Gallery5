<%@page import="java.io.Writer"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%PrintWriter pw = new PrintWriter(System.out);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<title>보낸 메시지함 페이지</title>
<%List<RequestDto> list = (List<RequestDto>)request.getAttribute("list"); %>

<script type="text/javascript">
 
	function sendpop(r_no) {
		window.open('selectRequestForm.do?r_no='+r_no 
				,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
		
	}
	
	
</script>



</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="../login/privateGnb.jsp" />	
<h3>내가 보낸 메시지함</h3>

<% if(list.size()==0){
	%>
	<h5>작성된 메세지가 없습니다</h5>
	<% 
}
	for(RequestDto dto : list){ %>
	
	<span>현재상태 : <%if(dto.getR_agree()==1){%>
		<button disabled="disabled"  >승인</button>
	
	<%}else if(dto.getR_agree()==2){%>
		<button disabled="disabled"  >거절</button>
	<%}else if(dto.getR_agree()==3){%>
	<button disabled="disabled"  >대기중</button>
		<%}
		%></span>
	<span>/받는 사람: <%=dto.getR_receivename()%></span>
	<span> /제목 :<a href="" onclick="sendpop(<%=dto.getR_no()%>)"><%=dto.getR_title() %></a></span>
	<span>/보낸 날짜 :<fmt:formatDate value="<%= dto.getR_regdate() %>" pattern="yyyy년MM월dd일"/> </span>
	<span><a href="deleteRequest.do?r_no=<%=dto.getR_no()%>"> /삭제</a></span>
	<br/>
	
	


	<%  }%>



<jsp:include page="/WEB-INF/views/tail.jsp" />  

</body>
</html>