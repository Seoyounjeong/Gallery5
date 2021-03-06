<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="java.util.Calendar"%>
<%@page import="com.hk1.utils.Util" %>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@page import="java.util.List"%>
<%CallendarDto cddto =(CallendarDto)request.getAttribute("cddto"); %>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Stylish" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Stylish" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">
<title>인덱스</title>

<style type="text/css">

.c_day:hover {
	background-color: rgba(0, 0, 0, 0.075)
}

.c_header{

height: 90px;
background-color: hsla(0, 100%, 70%, 0.9);
zoom: 1;
    filter: alpha(opacity=70);
    opacity: 0.7;
    
border-top-left-radius:20px;
border-top-right-radius:20px;
     
}

.c_header div{
font-size: 30px;
font-weight: bold;
text-align: center;

color: white;
line-height: 3;

}

.c_week th {
	text-align: center;
	color: rgb(255, 104, 96);
	height: 40px;
	vertical-align: middle;
}

.arrow{
    line-height: 3;
    color: white;
}

.heading-section span{

font-size: 16px;
    display: block;
    margin-bottom: 5px;
    text-transform: uppercase;
    color: #e2c0bb;
    letter-spacing: 2px;
    text-align: center!important;
   	margin: 0;
    padding: 0;
    
}
.heading-section h2{
font-size: 40px;
    font-weight: 600;
line-height: 1.2;
    color: inherit;
    margin-top:8px;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    text-align: center!important;

}

.heading-section p{
	font-family: -apple-system,BlinkMacSystemFont;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;

}
</style>

</head>

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

$(document).ready(function(){
	
	
	var scroll_v =getParameterByName('scroll_v');
	
	
	
	var scroll = $("#s_l").offset().top;
	
	if(scroll_v==0||scroll_v==null){
		
		$(document).scrollTop(scroll-40);
		
	}else{
		$(document).scrollTop(scroll_v);
	}
	
	


});


function scroll_v(url) {
	
	var scroll_v = $(document).scrollTop();
	
	location.href=url+scroll_v;
	
	
}










	function insertformcalendar(y,m,i,eleA) {
		
		 var eleP=eleA.nextElementSibling;//p태그
		//alert(eleP);
		if(eleP==null){
			window.open("insertformcalendar.do?g_no=${cddto.g_no}&c_start_y="+y+"&c_start_m="+m+"&c_start_d="+i+"&c_result=c", 'window팝업', 'width=480, height=450, menubar=no, status=no, toolbar=no');
			
		}else{
			swal("일정을 추가할수없어요");
		} 
	
	}
	
	
	//스크립트 파라미터값
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        results = regex.exec(location.search);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	
	function c_update(d,c_start,c_no) {


		
		var c_no =c_no;

		var c_title = c_title;
		var g_no = getParameterByName('g_no');
		
		var c_start = c_start+"";
		
		var y =c_start.substr(0,2);
		
		
		var m =c_start.substr(2,2);
		

		if(m.indexOf('0')!=-1){
	
		 m = c_start.substr(3,1)
		
		}
		
		
		 window.open(
				
					"updateformcalendar.do?g_no="
					
					+g_no+"&c_return=two&c_start_y="+y+"&c_start_m="+
					
					m+"&c_start_d="+d+"&c_no="+c_no
					
					, 'window팝업', 'width=480, height=450, menubar=no, status=no, toolbar=no');  
				

		/* location.href="selectCallender.do?g_no="
			
			+g_no+"&c_start="+
			
			c_start+";"
 */
	
	}
	


</script>



<jsp:include page="/WEB-INF/views/header.jsp" />
<body>


<hr id="s_l">


<div class="justify-content-center pb-5" style="margin-top:10px; ">
          <div class="heading-section text-center ftco-animate" style="z-index: -1;">
          	<span class="subheading">Best Gallery</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>All the galleries you want</p>
          </div>
</div>





	<div style="text-align: center; margin: 0 auto;">
	
		<h6 style="font-weight: bold;">
      <span onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=one'">
      안내&nbsp|</span>
      <span onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=two'">
      전시일정</span>

       </h6>

		
	</div>


<div class="container" style="margin-top: 80px;">


<div class="row">


<div class="col">

<!-- 달력관련 -->

<div class="c_header">

<%-- <span>

<a href="selectGallery.do?year=<%=year-1%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_two"></a>

</span> --%>

<div>




<div onclick="scroll_v('selectGallery.do?year=<%=year%>&month=<%=month-1%>&g_no=${galleryDto.g_no}&g_return=two&scroll_v=')">

<i class=" arrow fas fa-chevron-left fa-pull-left"></i></div>

<div onclick="scroll_v('selectGallery.do?year=<%=year%>&month=<%=month+1%>&g_no=${galleryDto.g_no}&g_return=two&scroll_v=')"><i class="arrow fas fa-chevron-right fa-pull-right"></i></div>

<span class="m"><%=Util.Calmonth(month)%><%-- <%=month%> --%></span>

&nbsp;&nbsp;<span class="y"><%= year%></span>


</div>



<%-- <span style="float: right;">

<a href="selectGallery.do?year=<%=year+1%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_two">▶</a>
</span> --%>


</div>
<table class="table table-bordered">


<%-- 
<caption>
<a href="selectGallery.do?g_return=two&year=<%=year-1%>&month=<%=month%>&g_no=${cddto.g_no}">◁</a>
<a href="selectGallery.do?g_return=two&year=<%=year%>&month=<%=month-1%>&g_no=${cddto.g_no}">◀</a>
<span class="y"><%= year %></span>년 <span class="m"><%= month%></span>월
<a href="selectGallery.do?g_return=two&year=<%=year%>&month=<%=month+1%>&g_no=${cddto.g_no}">▷</a>
<a href="selectGallery.do?g_return=two&year=<%=year+1%>&month=<%=month%>&g_no=${cddto.g_no}">▶</a>
</caption>
<col width="80px"><col width="80px"><col width="80px"><col width="80px">
<col width="80px"><col width="80px"><col width="80px"> --%>



<tr class="c_week">
<th>Sun</th><th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th><th>Sat</th>
</tr>
<tr>

<%	//공백수 풀력하기
	for(int i=0; i<(dayOfWeek-1) ; i++){
		out.print("<td>&nbsp;</td>");
	}

	//일수 출력하기
	
	
	for(int i=1; i<=lastDay ; i++){

		%>
		
		<td class="c_day" style="padding: 0; position:relative; height: 80px;  vertical-align: top;">

			 <a id="cdate_a" class="countview d<%=i%>" style="text-decoration: none;color:<%= Util.fontColor(dayOfWeek,i)%>;" 
			href="#" onclick="javascript:insertformcalendar(<%=year%>,<%=month%>,<%=i%>,this);" >
			
			 <%=i%> </a> 
			
			
			
			<% List<CallendarDto> clist = (List<CallendarDto>)request.getAttribute("clist"); %>
		 	
		 	<%=Util.getCalView(clist, i)%> 
		 				
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

<div class="col" style="padding-left: 40px;">


<% List<CallendarDto>cllist =(List<CallendarDto>)request.getAttribute("cllist"); %>


<%if(cllist.isEmpty()){
	%>
<div class="row">
<div class="col" style="text-align: center; min-width: 470px;">
---------등록된 일정이 없습니다---------
</div>
</div>
<%

}else{

for(CallendarDto dto:cllist){

	String d =dto.getC_start().substring(4,6);
	String m =Util.zeroTwo(dto.getC_start().substring(2,4));
	String y =20+dto.getC_start().substring(0,2);
%>	
<div class="row border-secondary">
   	 <!-- <div class="col-2">C_NO</div> -->
	<!--<div class="col-2"><%=dto.getC_no()%></div> -->
	<%-- <div class="col-2">G_NO</div>
	<div class="col-2"><%=dto.getG_no()%></div> --%>
	
	
	<%
	String cl_start_m = Util.zeroTwo(dto.getC_start().substring(2, 4));
	String cl_start_d = dto.getC_start().substring(4, 6);
	  
	String cl_end_m = Util.zeroTwo(dto.getC_end().substring(2, 4));
	String cl_end_d = dto.getC_end().substring(4, 6);   
	%>


	<div class="w-100" style="margin: 2px;"></div>
	
	<!-- <div class="col-2">일정명</div> -->
	<div class="col" style="    
	line-height: 1.5;
    color: rgba(0, 0, 0, 0.9);
    font-size: 25px;
    font-family: 'Stylish', sans-serif;
    font-weight: 600;
    "
	
	
	><%=dto.getC_title()%>&nbsp;&nbsp;&nbsp;<span><%=cl_start_m%>.<%=cl_start_d%>~<%=cl_end_m%>.<%=cl_end_d%></span></div>
	
	
	
	<div class="w-100" style="margin: 2px;"></div>
	<!-- <div class="col-2">내용</div> -->
	<div class="col" style="font-family: Arial, sans-serif;
    background: #fff;
    font-size: 20px;
    line-height: 1.8;
    font-weight: 400;
    font-family: 'Nanum Pen Script', cursive;
    color: #999999;"><%=dto.getC_content()%></div>
	
	
	<div class="w-100" style="margin: 2px;"></div>
	
	
	<div class="col-9"></div>

	<div class="col-3" style="font-family: 'Stylish', sans-serif;"><a href="#" onclick="javascript:c_update(
	
	<%=d %>,<%=dto.getC_start()%>,<%=dto.getC_no()%>);" >수정</a>
	
	&nbsp;&nbsp;&nbsp;&nbsp;
	
	<a href="deleteCalendal.do?c_no=<%=dto.getC_no()%>&g_no=<%=dto.getG_no()%>
	&year=<%=y%>&month=<%=m%>">삭제</a>
	
	</div>


	
</div>

		 




<br />	

<%}	
}%>
	
	
<!-- 페이지 처리() -->
		
		
		<% int pagenum = (Integer)request.getAttribute("pagenum"); %>
		
		
		<div>
		 	<%for(int i =1; i<=pagenum;i++){%>
		 		
		 	<a href="selectGallery.do?year=2019&month=5&g_no=109&g_return=two&c_pcount=<%=i%>"><%=i%></a>
		 	
		 	<%}%>
		 	

		 </div>		

</div>





</div>

</div>


<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>



</html>