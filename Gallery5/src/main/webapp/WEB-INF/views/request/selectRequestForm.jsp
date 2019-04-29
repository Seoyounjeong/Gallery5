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
<%RequestDto dto =(RequestDto)request.getAttribute("requestDto"); %>
<script type="text/javascript">
<%-- 	function messageclose() {
		opener.location.href="selectRequestListSend.do?r_send=<%=dto.getR_send()%>";
				self.close();
	}
  --%>

</script>

</head>
<body>
<div class="messagecontainer">
<div style="text-align: center;">보낸 메시지창</div>
<br/>
<div class="messagecontainer">
<div style="text-align: center;"><img alt="메시지 아이콘" src="requestupload/message_icon.png" width="50px" height="50px"> 
</div>
<div class="input_container">
<form action="updateRequest.do" method="get">
<input type="hidden" value="<%=dto.getR_agree() %>" name="r_agree">
<input type="hidden" value="<%=dto.getR_no() %>" name="r_no">
<input type="hidden" value="<%=dto.getR_receive()%>" name="r_receive">
<input type="hidden" value="<%=dto.getR_send()%>" name="r_send">
<div>받으시는 분  <input style="border-style: none;" type="text" value="<%=dto.getR_receivename() %>" name="r_receivename" readonly="readonly"> </div>
<div>보내시는 분  <input style="border-style: none;" type="text" value="<%=dto.getR_sendname() %>" name="r_sendname" readonly="readonly"> </div>
<div>메시지 제목  <input style="border-style: none;" type="text" name="r_title" value="<%=dto.getR_title() %>"  readonly="readonly">  </div>
<div>내용<br/>
<textarea rows="5" cols="60" name="r_content" readonly="readonly"><%=dto.getR_content() %></textarea>
</div><br/>
<div>승낙결과:<%if(dto.getR_agree()==1){ %>
				승인<%}else if(dto.getR_agree()==2){ %>
				거절<%}else if(dto.getR_agree()==3){ %>
				대기중<%} %>
</div>
<div style="position: absolute; right: 30px"><button onclick="self.close()">메시지창 닫기</button> </div>



</form>
</div>


</div>
</body>
</html>