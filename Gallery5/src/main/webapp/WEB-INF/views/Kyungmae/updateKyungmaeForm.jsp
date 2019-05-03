
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

<style type="text/css">
html,body{
	margin:0;
	padding:0;
}
#updateKyungmae{
	width:100%;
}
#updateKyungmae h3{
	text-align:center;
	width: 100%;
	color: white;
	background-color: rgb(26,26,26);
}
#updateKyungmae h4{
	margin-left:10%;
	text-align: left;
	width: 30%;
	color: rgb(160,160,160);
	padding-bottom: 5px;
	border-bottom: 2px solid rgba(160,160,160,0.5);
}
#updateKyungmae p{
	width:60%;
	font-size: 80%;
	margin-left:10%;
	margin-right:30%;
	text-align:left;
}
#updateKyungmae_div_img{
	margin-top:10%;
	width: 100%;
	text-align: center;
	vertical-align: middle;
	background-color: rgb(26,26,26);

}
#updateKyungmae_div_explain{
	width: 70%;
	margin:0 auto;
	text-align: left;
	font-weight: bold;

}
#timer{
	color: red;
	font-weight: bold;
}
#updateKyungmae_div_button{
	width: 80%;
	margin:0 auto;
	text-align: right;
}
#updateKyungmae_div_button input{
	border: none;
	cursor: pointer;
	border-radius: 10px;
	color: white;
	padding:7px;
	background-color: rgba(26,26,26);
	font-weight: bold;
}
#updateKyungmae_div_button input:hover{
	background-color: rgb(122,201,67);
}
</style>


</head>
<body>
   	<div id="updateKyungmae">
		<h3>경매진행</h3>
		<h4>안내</h4>
		<p>참가 버튼을 누르시면 입찰이 진행됩니다.</p>
		<div id="updateKyungmae_div_img">
			<img src="itemupload/<%=itemDto.getI_img()%>" width=60%;>	
		</div>		
		<h4>정보</h4>
		<div id="updateKyungmae_div_explain">
			
				<h2>남은시간 : <span id="timer"></span></h2>
				<span>작품명 : </span><span><%=itemDto.getI_name()%></span><br>
				<span>현재가격 : </span><span><%=itemDto.getI_price()%></span><br>
				<span>입찰가격 : </span><span><%=nextPrice %></span><br>
				</div>
			<div id="updateKyungmae_div_button">
				<form action="updateKyungmae.do" method="post">
				<input type="hidden" name="i_no" value=<%=itemDto.getI_no()%> id="updateKyungmae_i_no">
				<input type="hidden" name="k_no" value=<%=kyungmaeDto.getK_no()%> id="updateKyungmae_k_no">
				<input type="hidden" name="nextPrice" value="<%=nextPrice%>">
				<input type="hidden" name="beforePrice" value="<%=itemDto.getI_price()%>">
				<input type="hidden" name="regdate" id="updateKyungmae_regdate" value="<%=kyungmaeDto.getK_regdate()%>">
				<input type="submit" value="입찰하기" id="updateKyungmae_submit">
			</form>
		</div>
	</div>
<script>
		var i_no = 0 ;
		var k_no = 0 ;
        $(document).ready(function(){
        	i_no = document.getElementById("updateKyungmae_i_no").value;
        	k_no = document.getElementById("updateKyungmae_k_no").value;
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
		    location.href="updateKyungmaeEnd.do?i_no="+i_no+"&k_no="+k_no+"&from=pop";
		  }else{
		    RemainTime = RemainTime - 1000; // 남은시간 -1초
		   
		  }
}
</script>
</body>
</html>