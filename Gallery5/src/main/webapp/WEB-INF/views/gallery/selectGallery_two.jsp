<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="java.util.Calendar"%>
<%@page import="com.hk1.utils.Util" %>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>인덱스</title>

<style type="text/css">


#Gallery_setion1{border: 1px solid black; margin: 0 auto; width: 600px;}
#Gallery_setion1 div{text-align: center; width: 300px; margin: 0 auto;}


#Gallery_setion2{ margin: 0 auto; width: 600px;}
#Gallery_setion2 div{ margin: 0 auto; width: 100%;}
#Gallery_setion2 table{margin: 0 auto;}


img{
	width: 100px;
	height: 100px;	
}

button {
	background-color: pink;
	border-radius: 10px;
	border: none; 
}
</style>
</head>

<script type="text/javascript">

/* 
$(document).ready( function() {
    location.reload();
});
 */

function imgup(a) {
	
	
		
		if(a==1){
			document.getElementById("gallery_img1").click();
		}if(a==2){
			document.getElementById("gallery_img2").click();
		}if(a==3){
			document.getElementById("gallery_img3").click();
		}if(a==4){
			document.getElementById("gallery_img4").click();
		}
	
	
}

 function imageURL(input) {
	if (input.files && input.files[0]) {
		
		 var reader = new FileReader();
		
		reader.onload = function(e) {
			$("#preview_img1").attr("src",e.target.result);
		
		} 
		reader.readAsDataURL(input.files[0]);
		}
	
	
	
}

</script>

<!-- 달력관련 -->
<%
	//달력의 날짜를 바꾸기 위해서 전달된 year와 month 값을 받는다
	String pYear= request.getParameter("year");
	String pMonth= request.getParameter("month");	

	Calendar cal = Calendar.getInstance(); //calender 객체는 new를 사용하지 않는다
	int year =cal.get(Calendar.YEAR);  // 현재 년도를 구함
	int month =cal.get(Calendar.MONTH)+1;  //현재 월을 구함 (0~11월)
	
	if(pYear!=null){
		year = Integer.parseInt(pYear);
	}
	
	
	if(pMonth!=null){
		month = Integer.parseInt(pMonth);
		
	}
	
	//달중에 12월을 넘어 갔을 경우 month는 1월로, 년도는 다음 년도로 바꿔준다
	if(month>12){
		
		month=1;
		year++;
	}
	
	//달중에 1월을 뒤로 넘어갔을경우 month는 12월로, 년도는 전년도로 값을 바꿔준다
	if(month<1){
		
		month=12;
		year--;
	}
	
	
	//현재 월의 1일에 대한 요일 구하기 -- 현재 날짜에 대한 정보를 담고 있는 Calender 객체 생성
	//					   -- 3월  1일로 셋팅을 해서 요일을 구함
	
	cal.set(year, month-1, 1); //2019년 3월 1일로 바꿔준다 sys기준 (0~11월)으로 맞춰준다
	
	int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);  // 요일을 구함 1일에 대한 요일을 구함 1(일) ~ 7(월)
	int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); //월의 마지막날 구하기

	//한달에 대한 일정목록 가져오기
	
	
/*	String id ="kbj";
	String yyyyMM= year+Util.isTwo(String.valueOf(month)); // "201903"
	
 	CalDao dao= new CalDao();
	 List<CalDto> list = dao.getCalViewList(id, yyyyMM);  */
%>

<!-- 달력관련 -->
<script type="text/javascript">

	function insertformcalendar(y,m,i,eleA) {
		
		 var eleP=eleA.nextElementSibling;//p태그
		//alert(eleP);
		if(eleP==null){
			window.open("insertformcalendar.do?g_no=${galleryDto.g_no}&c_start_y="+y+"&c_start_m="+m+"&c_start_d="+i, 'window팝업', 'width=300, height=300, menubar=no, status=no, toolbar=no');
			
		}else{
			alert("일정을 추가할수없어요");
		} 
	
	}
	
	function gallery_swap_a() {
		

		var Gallery_setion1 = document.getElementById("Gallery_setion1");
		var Gallery_setion2 = document.getElementById("Gallery_setion2");
		
		Gallery_setion2.style.display="none";
		Gallery_setion1.style.display="inline";
		
	}
	
	
	
	
	function gallery_swap_b() {

	<%-- 	location.href="selectGallery.do?year="
				
				+<%=year%>+"&month="+
				
				<%=month%>+"&g_no="+${galleryDto.g_no}; --%>
				
		
				
				var Gallery_setion1 = document.getElementById("Gallery_setion1");
				var Gallery_setion2 = document.getElementById("Gallery_setion2");
				
				
			Gallery_setion1.style.display="none";
			Gallery_setion2.style.display="inline";
				
	}
	
	//스크립트 파라미터값
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	
	function c_update(d,c_start) {
		
		var g_no = getParameterByName('g_no');
		
		
		window.open(
				
			"selectCallenderFrom.do?g_no="
			
			+g_no+"&c_start="+
			
			c_start, 'window팝업', 'width=300, height=300, menubar=no, status=no, toolbar=no');
		
		
		
		/* location.href="selectCallender.do?g_no="
			
			+g_no+"&c_start="+
			
			c_start+";"
 */
	
		
	}
	


</script>




<body>

<jsp:include page="/WEB-INF/views/header.jsp" />


<div style="text-align: center; margin: 20px;">

<div style="display: inline-block; border: 1px solid black; margin: 5px" onclick="location.href='selectGallery.do?year='+<%=year%>+'&month='+<%=month%>+'&g_no='+${galleryDto.g_no}+'&g_return=one'">안내</div>

<div style="display: inline-block; border: 1px solid black;" onclick="location.href='selectGallery.do?year='+<%=year%>+'&month='+<%=month%>+'&g_no='+${galleryDto.g_no}+'&g_return=two'">전시일정</div> </div>


<div id="Gallery_setion2">

<div id="Gallery_callendal">
<!-- 달력관련 -->
<h1 style="text-align: center;">달력 일정 보기</h1>


<table border="1" style="border-collapse: collapse;">


<!--g_no 로그인 세션값 넣어야 합니다.-->


<caption>
<a href="selectGallery.do?year=<%=year-1%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=two">◁</a>
<a href="selectGallery.do?year=<%=year%>&month=<%=month-1%>&g_no=${galleryDto.g_no}&g_return=two">◀</a>
<span class="y"><%= year %></span>년 <span class="m"><%= month%></span>월
<a href="selectGallery.do?year=<%=year%>&month=<%=month+1%>&g_no=${galleryDto.g_no}&g_return=two">▷</a>
<a href="selectGallery.do?year=<%=year+1%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=two">▶</a>
</caption>
<col width="80px"><col width="80px"><col width="80px"><col width="80px">
<col width="80px"><col width="80px"><col width="80px">



<tr>
<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
</tr>
<tr>

<%	//공백수 풀력하기
	for(int i=0; i<(dayOfWeek-1) ; i++){
		out.print("<td>&nbsp;</td>");
	}

	//일수 출력하기
	
	
	for(int i=1; i<=lastDay ; i++){

		%>
		
		<td style="padding: 0; position:relative; height: 80px;  vertical-align: top;">

			 <a id="cdate_a" class="countview d<%=i%>" style="text-decoration: none;color:<%= Util.fontColor(dayOfWeek,i)%>;" 
			href="#" onclick="javascript:insertformcalendar(<%=year%>,<%=month%>,<%=i%>,this);" >
			
			 <%=i%> </a> 
			
			
			
			<% List<CallendarDto> clist = (List<CallendarDto>)request.getAttribute("clist"); %>
		 	
		 	<%=Util.getCalView(clist, i)%> 
		 				

		 			
			
		 		
		 
		 	 

			
<%-- 			<a href="insertform.do?&year=<%=year%>&date=<%= i %>&lastDay=<%= lastDay %>&month=<%= month %> ">
				<img alt="일정추가" src="img/1.png">
			</a> --%>
		 	
		 	
		</td>
	<%	
	
	// dayOfWeek-1 은 공백수  : (공백수+날짜)%7==토요일
	if((dayOfWeek-1+i)%7==0){ 
	
	%></tr><tr><% 
	
		//out.print("</tr><tr>"); //<tr><td>1</td><td></td></tr><tr>
	}
	}
	
	//달력의 나머지 공백수 출력하기 (rhdqor ㄲㅇ)
	//7-((dayOfWeek-1+lastDay)%7)
	
	for(int i = 0; i<(7-((dayOfWeek-1+lastDay)%7))%7;i++){
		
	
		out.print("<td>&nbsp;</td>");	

	}

%>


</tr>

</table>
</div>
</div>

<!-- 지도 관련 블락 처리 풀기 -->
<div id="map" style="width:500px;height:400px;">
	<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d61a4dc1efe55edbdfac5ab744921183"></script> -->
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.5256170,126.888900),
			level: 3
			
	
			
		};

		var map = new daum.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new daum.maps.LatLng(37.5256170,126.888900); 

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
		
	</script>



</div>




<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>



</html>