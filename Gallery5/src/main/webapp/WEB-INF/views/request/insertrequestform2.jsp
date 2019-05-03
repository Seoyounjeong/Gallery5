<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
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
	String m_id=request.getParameter("m_id");
	int a_no = Integer.parseInt(request.getParameter("r_receive"));
	
	int m_no = Integer.parseInt(request.getParameter("m_no"));
%>

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

</head>
<body>
<div class="messagecontainer" style="text-align: center;">
<div style="text-align: center;"><img alt="메시지 아이콘" src="requestupload/message_icon.png" width="50px" height="50px"> 
</div>
<br/>
<form action="insertrequest2.do" method="post">
<input type="hidden" value=<%=r_send %> name="r_send">
<input type="hidden" value=<%=r_receive %> name="r_receive">
<input type="hidden" value=<%=a_no %> name="a_no">
<input type="hidden" value=<%=m_no %> name="m_no">  
<label  for="receive">받으시는 분 </label><input type="text"  value="<%=r_receivename %>" id="receive" name="r_receivename" readonly="readonly"><br/>
<label for="send">보내시는 분</label><input type="text" value="<%=r_sendname %>" id="send" name="r_sendname" readonly="readonly"><br/>
<label for="title">제목</label><input style="margin-left: 50px;" type="text" id="title" name="r_title" required="required">
<div id="content">내용<br/>
<textarea rows="5" cols="60" name="r_content" class="form-control col-sm-5" required="required"  ></textarea>
</div>
<br/>
<div  style="position: absolute; right: 30px"><input type="submit" value="보내기" class="btn btn-outline-dark" ></div>
</form>

</div>
</body>
</html>