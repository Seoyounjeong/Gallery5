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


%>

<body>

<jsp:include page="/WEB-INF/views/header.jsp" />


<div style="text-align: center; margin: 20px;">

<div style="display: inline-block; border: 1px solid black; margin: 5px" onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_one'">안내</div>

<div style="display: inline-block; border: 1px solid black;" onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_two'">전시일정</div> </div>


<div id="Gallery_setion1">

<div id="Gallery_infor">

<div>
<span>g_no 히든으로 처리합시다</span> <input type="text" name="g_no" value="${galleryDto.g_no}" readonly="readonly">
</div>

<div>
<span>m_no 히든으로 처리합시다</span> <input type="text" name="m_no" value="${galleryDto.m_no}" readonly="readonly">
</div>


<div>
<span>g_name</span> <input type="text" name="g_name" value="${galleryDto.g_name}" readonly="readonly">
</div>

<div>
<span>g_adress</span> <input type="text" name="g_adress" value="${galleryDto.g_adress}">
</div>

<div>
<span>g_tel</span> <input type="text" name="g_tel" value="${galleryDto.g_tel}">
</div>

<div>
<span>g_intro</span> <input type="text" name="g_intro" value="${galleryDto.g_intro}">
</div>



<div>
<span>g_img1</span> <span><img alt="g_img1" src="galleryupload/${galleryDto.g_img1}"></span> 
</div>

<div>
<span>g_img2</span> <span><img alt="g_img2" src="galleryupload/${galleryDto.g_img2}"></span>  
</div>

<div>
<span>g_img3</span> <span><img alt="g_img3" src="galleryupload/${galleryDto.g_img3}"></span> 
</div>


<div>
<span>g_img4</span> <span><img alt="g_img4" src="galleryupload/${galleryDto.g_img4}"></span> 
</div>


<div>
<span>g_state 히등으로 처리 합시다</span> <input type="text" name="g_state" value="${galleryDto.g_state}" readonly="readonly">
</div>

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