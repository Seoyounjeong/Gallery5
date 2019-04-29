<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메시지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">

 	$(function() {
		$("#pop").click(function() {
			var aa= window.open('insertrequestform.do?r_send=99&r_receive=99&r_receivename=받는사람&r_sendname=보낸사람'
					,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
				
		});
	});
	

</script>




</head>
<body>
<form action=""  method="get" >
<input type="hidden" value="99" name="r_send">
<input type="hidden" value="99" name="r_receive">
<input type="hidden" value="받는사람" name="r_receivename"> 
<input type="hidden" value="보낸사람" name="r_sendname"> 
<input type="button" value="요청하기" id="pop">
</form>

<input type="button" value="받은 메시지함" onclick="location.href='selectRequestListReceive.do?r_receive=99'" >
<input type="button" value="보낸 메시지함" onclick="location.href='selectRequestListSend.do?r_send=99'" >


<!-- <input type="button" value="받은 메시지함" onclick="location.href='selectRequestListReceive.do?r_receive=99'" >
<input type="button" value="보낸 메시지함" onclick="location.href='selectRequestListSend.do?r_send=99'" > -->

 <!-- <button class="open-button" onclick="openRequest()">요청하기</button>
 <div class="form-popup" id="myForm">
 	<form action="insertrequest.do" class="form-container">
 	<h1>요청하기</h1>
 	
 		
 	<button type="submit" class="btn">보내기</button>
    <button type="button" class="btn cancel" onclick="closeRequest()">취소하기</button>
 	
 	</form>
 
 
 </div>
 
  -->
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
</body>
</html>