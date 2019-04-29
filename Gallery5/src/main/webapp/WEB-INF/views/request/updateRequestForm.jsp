<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

 

</script>
<%RequestDto dto =(RequestDto)request.getAttribute("requestDto"); %>
</head>
<body>
<div class="messagecontainer">
<div style="text-align: center;">받은 메시지창</div>
<br/>
<form action="updateRequest.do" method="get">
<input type="hidden" value="1" name="r_agree">
<input type="hidden" value="<%=dto.getR_no() %>" name="r_no">
<input type="hidden" value="<%=dto.getR_receive()%>" name="r_receive">
<input type="hidden" value="<%=dto.getR_send()%>" name="r_send">
<div>받으시는 분<input type="text" value="<%=dto.getR_receivename() %>" name="r_receivename" readonly="readonly"> </div>
<div>보내시는 분<input type="text" value="<%=dto.getR_sendname() %>" name="r_sendname" readonly="readonly"> </div>
<div>메시지 제목<input type="text" name="r_title" value="<%=dto.getR_title() %>"  readonly="readonly">  </div>
<div>내용<br/>
<textarea rows="5" cols="60" name="r_content" readonly="readonly"><%=dto.getR_content() %></textarea>
</div>

<input type="submit" value="승인" >
<input type="button" value="거절" onclick="deny();" >
</form>

	
<script type="text/javascript">
function deny() {
	location.href="updateRequest.do?r_agree=2&r_no="+<%=dto.getR_no() %>+"&r_receive="+<%=dto.getR_receive()%>;
	
}
 

</script>

</div>
</body>
</html>