<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>Insert title here</title>
<script>


</script>
<%
	String r_receivename= request.getParameter("r_receivename");
	String r_sendname = request.getParameter("r_sendname");
	int r_receive = Integer.parseInt(request.getParameter("r_receive"));
	int r_send =Integer.parseInt(request.getParameter("r_send"));
%>

</head>
<body>
<div class="messagecontainer">
<div style="text-align: center;">메시지창</div>
<br/>
<form action="insertrequest.do" method="post">
<input type="hidden" value=<%=r_send %> name="r_send">
<input type="hidden" value=<%=r_receive %> name="r_receive">

<div>받으시는 분<input type="text" value="<%=r_receivename %>" name="r_receivename"> </div>
<div>보내시는 분<input type="text" value="<%=r_sendname %>" name="r_sendname"> </div>
<div>메시지 제목<input type="text" name="r_title" >  </div>
<div>내용<br/>
<textarea rows="5" cols="60" name="r_content"></textarea>
</div>

<input type="submit" value="보내기" >
</form>


</div>
</body>
</html>