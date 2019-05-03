<%@page import="com.hk1.gallery.dto.RequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>


<style type="text/css">
	*{
		padding: 0px;
		margin: 0px;
	}
	
	.messagecontainer{
		margin-top: 50PX;
	}

	#content textarea{
		margin-left: auto;
		margin-right: auto;
	}
	
	.messagecontainer input{
		font-size: 15px;
	}
	
	messagecontainer label{
		font-size:11px;
		font-weight: bold; 
		
	}
			

</style>
<%RequestDto dto =(RequestDto)request.getAttribute("requestDto"); %>
</head>
<body>
<div class="messagecontainer" style="text-align: center;">
<div style="text-align: center;"><img alt="메시지 아이콘" src="requestupload/message_icon.png" width="50px" height="50px"> 
</div>
<br/>
<form action="updateRequest.do" method="get">
<input type="hidden" value="1" name="r_agree">
<input type="hidden" value="<%=dto.getR_no() %>" name="r_no">
<input type="hidden" value="<%=dto.getR_receive()%>" name="r_receive">
<input type="hidden" value="<%=dto.getR_send()%>" name="r_send">

<label  for="receive">받으시는 분 </label><input  type="text" value="<%=dto.getR_receivename() %>" id="receive" name="r_receivename" readonly="readonly"><br/> 
<label for="send">보내시는 분</label><input  type="text" value="<%=dto.getR_sendname() %>" id="send" name="r_sendname" readonly="readonly"> <br/>
<label for="title">제목</label><input  style="margin-left: 50px;" type="text" name="r_title" id="title" value="<%=dto.getR_title() %>"  readonly="readonly"> 
<div style="margin-top: 25px;" id="content">내용<br/>
<textarea rows="5" cols="60" name="r_content" readonly="readonly" class="form-control col-sm-5"><%=dto.getR_content() %></textarea>
</div><br/>

<input type="submit" value="승인"  class="btn btn-outline-primary" >
<input type="button" value="거절" onclick="deny();" class="btn btn-outline-danger" >
</form>

	
<script type="text/javascript">
function deny() {
	location.href="updateRequest.do?r_agree=2&r_no="+<%=dto.getR_no() %>+"&r_receive="+<%=dto.getR_receive()%>;
	
}
 

</script>

</div>
</body>
</html>