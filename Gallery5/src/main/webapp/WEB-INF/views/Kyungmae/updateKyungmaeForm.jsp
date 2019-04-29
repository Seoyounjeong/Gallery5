
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%ItemDto itemDto = (ItemDto)request.getAttribute("itemDto"); %>
<%KyungmaeDto kyungmaeDto =(KyungmaeDto)request.getAttribute("kyungmaeDto"); %>
<%int nextPrice =(Integer)request.getAttribute("nextPrice"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<body>
   	<div id="updateKyungmae">
		<h3>경매진행</h3>
		<p>참가 버튼을 누르시면 입찰이 진행됩니다.</p>
		<div>
			<img src="itemupload/<%=itemDto.getI_img()%>" width=50%;>	
		</div>		
		<div>
			<form action="updateKyungmae.do" method="post">
				<p>남은시간 : <span id="timer"></span></p>
				<span>작품명 : </span><span><%=itemDto.getI_name()%></span><br>
				<span>현재가격 : </span><span><%=itemDto.getI_price()%></span><br>
				<span>입찰가격 : </span><span><%=nextPrice %></span><br>
				<input type="hidden" name="i_no" value=<%=itemDto.getI_no()%>>
				<input type="hidden" name="k_no" value=<%=kyungmaeDto.getK_no()%>>
				<input type="hidden" name="nextPrice" value="<%=nextPrice%>">
				<input type="hidden" name="beforePrice" value="<%=itemDto.getI_price()%>">
				<input type="hidden" name="regdate" id="updateKyungmae_regdate" value="<%=kyungmaeDto.getK_regdate()%>">
				<input type="submit" value="입찰하기" id="updateKyungmae_submit">
			</form>
		</div>
	</div>
<script>
        $(document).ready(function(){
            tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
          });
        var regDate = document.getElementById("updateKyungmae_regdate").value+" 24:00:00";
		var stTime = new Date().getTime();
		var edTime = new Date(regDate).getTime(); // 종료날짜 //계속해서 변환해줘야 할 값 
		var RemainTime = edTime - stTime;
		var stDate = new Date();
		var edDate = new Date(regDate);
		
		var RemainDate = Math.floor((edDate.getTime() - stDate.getTime()) / (1000*60*60*24));
		
		function msg_time() {
		  var hours = Math.floor((RemainTime % (1000 * 60 * 60 * 24)) / (1000*60*60));
		  var miniutes = Math.floor((RemainTime % (1000 * 60 * 60)) / (1000*60));
		  var seconds = Math.floor((RemainTime % (1000 * 60)) / 1000);
		  
		  m =RemainDate+"일"+ hours + ":" +  miniutes + ":" + seconds ; // 남은 시간 text형태로 변경
		  
		  document.all.timer.innerHTML = m;   // div 영역에 보여줌 
		  
		  if (RemainDate <= 0 && RemainTime <= 0) {      
		    // 시간이 종료 되었으면..
		    alert("경매종료");
		    clearInterval(tid);   // 타이머 해제
		    document.all.timer.innerHTML = "경매가 종료되었습니다";
		    $("#updateKyungmae_submit").css("display","none");
		    opener=self;
		     setTimeout('self.close()',3000);
		  }else{
		    RemainTime = RemainTime - 1000; // 남은시간 -1초
		   
		  }
}
</script>
</body>
</html>