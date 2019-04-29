<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.KyungmaeDto"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%List<KyungmaeDto> nowKyungmaeList =(List<KyungmaeDto>) request.getAttribute("nowKyungmaeList"); %>
<%List<KyungmaeDto> onKyungmaeList =(List<KyungmaeDto>) request.getAttribute("onKyungmaeList"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매목록</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<script>
var regDate0 = "";
var regDate1 = "";
var regDate2 = "";

var stTime ;

var edTime0 ;
var edTime1 ;
var edTime2 ;

var RemainTime0 ; 
var RemainTime1 ;
var RemainTime2 ;

$(document).ready(function(){
	
	 regDate0 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_0").value+" 24:00:00 ";
	 regDate1 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_1").value+" 24:00:00 ";
	 regDate2 = document.getElementById("kyungmaeList_nowKyungmaeList_regdate_2").value+" 24:00:00 ";

	 stTime = new Date().getTime();

	 edTime0 = new Date(regDate0).getTime();
	 edTime1 = new Date(regDate1).getTime();
	 edTime2 = new Date(regDate2).getTime();

	 RemainTime0 = edTime0 - stTime; 
	 RemainTime1 = edTime1 - stTime;
	 RemainTime2 = edTime2 - stTime;
	
	tid=setInterval('msg_time()',1000);
});

function msg_time(){
	var hours0 = Math.floor((RemainTime0 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes0 = Math.floor((RemainTime0 % (1000 * 60 * 60)) / (1000*60));
	var seconds0 = Math.floor((RemainTime0 % (1000 * 60)) / 1000);
	
	var hours1 = Math.floor((RemainTime1 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes1 = Math.floor((RemainTime1 % (1000 * 60 * 60)) / (1000*60));
	var seconds1 = Math.floor((RemainTime1 % (1000 * 60)) / 1000);

	var hours2 = Math.floor((RemainTime2 % (1000 * 60 * 60 * 24)) / (1000*60*60));
	var miniutes2 = Math.floor((RemainTime2 % (1000 * 60 * 60)) / (1000*60));
	var seconds2 = Math.floor((RemainTime2 % (1000 * 60)) / 1000);

	
	 m0 ="남은시간 :0일"+ hours0 + ":" +  miniutes0 + ":" + seconds0 ;
	 m1 ="남은시간 :0일"+ hours1 + ":" +  miniutes1 + ":" + seconds1 ;
	 m2 ="남은시간 : 0일"+ hours2 + ":" +  miniutes2 + ":" + seconds2 ;
			
	 
	 document.all.timer0.innerHTML = m0;
	 document.all.timer1.innerHTML = m1;
	 document.all.timer2.innerHTML = m2;
	 
	 if(RemainTime0<0){
		 document.all.timer0.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
		
	 }else{
		 RemainTime0 = RemainTime0 -1000;
	 }
	 if(RemainTime1<0){
		 document.all.timer1.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
	 }else{
		 RemainTime1 = RemainTime1 -1000;
	 }
	 if(RemainTime2<0){
		 document.all.timer2.innerHTML = "경매가 종료되었습니다";
		 $(".kyungmaeList_updateKyungmae_submit").css("display","none");
	 }else{
		 RemainTime2 = RemainTime2 -1000;
	 }
	 
}

//경매 관련 스크립트
function insertKyungmaeButton(i_no){
	
	var aa= window.open('insertKyungmaeform.do?i_no='+i_no,'window팝업','width=500, height=600,menubar=no,status=no,toolbar=no');
}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div id="kyungmaelist">
	<div id="kyungmaeList_nowKyungmaeList">	
		
		<%if(nowKyungmaeList.size()!=0){ %>
				
		
		<h3>금일 마감 경매</h3>
		<p>금일 마감 고액순위 1위,2위,3위에 경매 입니다.<p>
		<%for(int i = 0; i<3 ; i++) {%>
			
			<div style="float:left; margin:20px">
			<h2><%=i+1%>위</h2>
			<p id="timer<%=i%>"></p>
			<h4>작품명 : <%=nowKyungmaeList.get(i).getI_name() %></h4>
			<h5>현재 호가 : <%=nowKyungmaeList.get(i).getK_first_price() %></h5>
			<input type="hidden"  id="kyungmaeList_nowKyungmaeList_regdate_<%=i%>" value="<%=nowKyungmaeList.get(i).getK_regdate()%>">
			<%if(loginMember!=null){ %>
			<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=nowKyungmaeList.get(i).getI_no()%>)">
			<%}else{ %>
			<form action="loginform.do" method="post">
				<p>※로그인 이후 경매참여가 가능합니다</p>
				<input type="submit" value="로그인">
			</form>
			<%} %>
			</div>

		<%} 
		}else{%>
		<h3>금일 마감인 경매가 없습니다.</h3>
		<%}%>
	</div>

	<div id="kyungmaeList_onKyungmaeList" style="clear: both;">
		<h3>진행중인 경매</h3>
		<%if(onKyungmaeList.size()!=0) {
		for(int i =0 ; i<onKyungmaeList.size() ; i++){
		%>
		<div style="float:left; margin:20px">
		<h4>작품명 :<%=onKyungmaeList.get(i).getI_name() %></h4>
		<h5>현재 호가 : <%=onKyungmaeList.get(i).getK_first_price() %></h5>
		<h5>종료 일시 : <%=onKyungmaeList.get(i).getK_regdate()%> 24:00:00 </h5>
		<%if(loginMember!=null){ %>
			<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=onKyungmaeList.get(i).getI_no()%>)"
			 class="kyungmaeList_updateKyungmae_submit">
			<%}else{ %>
			<form action="loginform.do" method="post">
				<p>※로그인 이후 경매참여가 가능합니다</p>
				<input type="submit" value="로그인">
			</form>
			<%} %>
		</div>
		<%}
		}else{%>
			
			<h3>현재 진행중인 경매가 없습니다.</h3>
		<%} %>
	</div>
</div>

<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>