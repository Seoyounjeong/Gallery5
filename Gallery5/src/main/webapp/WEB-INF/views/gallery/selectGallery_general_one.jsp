<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html;charset=utf-8");
%>
<%@page import="java.util.Calendar"%>
<%@page import="com.hk1.utils.Util"%>
<%@page import="com.hk1.gallery.dto.CallendarDto"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet"> 

<link rel="stylesheet" href="boot_g/css/bootstrap.min.css">
<link rel="stylesheet" href="boot_g/css/owl.carousel.min.css">
<link rel="stylesheet" href="boot_g/css/style.css">
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower" rel="stylesheet">


<!-- 부트스트랩 끝 -->

<title>인덱스</title>

<style type="text/css">


.ud_img button{
background-color: white;
border-radius: 10px;
width: 49px;
	border: none;
color: #e2c0bb; font-family: 'Cute Font', cursive;"


}


.ud_img {
	display: inline-block;
}


.ud_img img{
	width: 100px;
	height: 100px;}
	
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

<script type="text/javascript">
$(document).ready(function(){
	

	var scroll = $("#s_l").offset().top;
	

		$(document).scrollTop(scroll-40);
		


});

	function imgup(a) {

		if (a == 1) {
			document.getElementById("gallery_img1").click();
		}
		if (a == 2) {
			document.getElementById("gallery_img2").click();
		}
		if (a == 3) {
			document.getElementById("gallery_img3").click();
		}
		if (a == 4) {
			document.getElementById("gallery_img4").click();
		}

	}

	function imageURL(input) {
		
		var pimg = $(input).prev().prev().find("img");
		
		//alert(pimg.prop("tagName"));
		
		if (input.files && input.files[0]) {

			var reader = new FileReader();

			reader.onload = function(e) {
				
				pimg.attr("src", e.target.result);

			}
			reader.readAsDataURL(input.files[0]);
		}

	}
</script>

<!-- 달력관련 -->
<%
	Calendar cal = Calendar.getInstance(); //calender 객체는 new를 사용하지 않는다
	int year = cal.get(Calendar.YEAR); // 현재 년도를 구함
	int month = cal.get(Calendar.MONTH) + 1; //현재 월을 구함 (0~11월)
%>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body style="min-width: 1200px;">

	
	
	<div id="s_l"></div>
	
	
	   <div class="justify-content-center pb-5" style="margin-top:10px; ">
          <div class="heading-section text-center ftco-animate" style="z-index: -1;">
          	<span class="subheading">Best Gallery</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>All the galleries you want</p>
          </div>
        </div>
	


	<div style="text-align: center; margin: 20px; font-weight: bold; font-size: large;">

		<div
			style="display: inline-block; margin: 5px; font-family: 'Gamja Flower', cursive; font-weight: 100; font-size:30px; color:#e2c0bb;"
			onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_one'">안내</div>

		<div style="display: inline-block; font-family: 'Gamja Flower', cursive; font-weight: 100; font-size:30px; color:#e2c0bb;"
			onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=general_two'">전시일정</div>
	</div>






	<section class="site-section">
	

		<div class="container">
		<div class="row">
			
					<div class="col-lg-6">

					<div class="owl-carousel slide-one-item-alt">
						<img style="height: 400px; width: 540px" src="galleryupload/${galleryDto.g_img1}" alt="Image" class="img-fluid">
						<img style="height: 400px; width: 540px" src="galleryupload/${galleryDto.g_img2}" alt="Image" class="img-fluid">
						<img style="height: 400px; width: 540px" src="galleryupload/${galleryDto.g_img3}" alt="Image" class="img-fluid">
						<img style="height: 400px; width: 540px" src="galleryupload/${galleryDto.g_img4}" alt="Image" class="img-fluid">
					</div>
					<div class="custom-direction" style="background-color: white; opacity: 0.9; ">
						<a href="#" class="custom-prev" style="color: #e2c0bb;">Prev</a><a href="#"
							style="color: #e2c0bb;" class="custom-next">Next</a>
					</div>

					</div>
					


					



					<div class="col-lg-5 ml-auto" style="font-family: 'Cute Font', cursive; font-size: 25px;  color: black; ">

						<div class="section-title" style="margin-bottom: 20px; font-weight:100; color:black; 
						
						font-family: 'East Sea Dokdo', cursive; font-size: 60px;">
							<div>${galleryDto.g_name}</div>
						</div>

						<div>
							<div style="border: none;"><span style="margin-right: 10px; color: #e2c0bb;">전화번호</span>${galleryDto.g_tel}</div>
						</div>
						
						<div>
							
							 <div style="border: none;"><span style="margin-right: 36px; color: #e2c0bb;">주소</span> ${galleryDto.g_adress}</div> 
							
							<%-- <input style="height: 100px;" type="text" name="g_adress" value="${galleryDto.g_adress}"> --%>
						</div>
						

						<div>
							<span style="margin-right: 36px; color: #e2c0bb;">소개</span> 
							<div  style="border: none;">${galleryDto.g_intro}</div>
						
						
							<%-- <span>g_intro</span> <input type="text" name="g_intro"
								value="${galleryDto.g_intro}"> --%>
						</div>


					<div style="text-align: center; margin-top: 100px;">
						<div class="ud_img">
							<div><img alt="g_img1" src="galleryupload/${galleryDto.g_img1}"></div>
					
						</div>

						<div class="ud_img">
							<div><img alt="g_img2"src="galleryupload/${galleryDto.g_img2}"></div> 
						

						</div>

						<div class="ud_img">
							<div><img alt="g_img3"src="galleryupload/${galleryDto.g_img3}"></div> 
							

						</div>


						<div class="ud_img">
							 <div><img alt="g_img4"src="galleryupload/${galleryDto.g_img4}"></div> 
							
						</div>
						
								
				
					</div>	

					</div>
	
			</div>
		</div>
					
	</section>










	<!-- 지도 관련 블락 처리 풀기 -->
	<div id="map" style="min-width: 100px; min-height: 250px; margin: 0 20%;">
		 <!--  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d61a4dc1efe55edbdfac5ab744921183"></script>  --> 
		<script>
			var container = document.getElementById('map');
			var options = {
				center : new daum.maps.LatLng(37.5256170, 126.888900),
				level : 3

			};

			var map = new daum.maps.Map(container, options);

			// 마커가 표시될 위치입니다 
			var markerPosition = new daum.maps.LatLng(37.5256170, 126.888900);

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
		</script>



	</div>

	<!-- 부트슻트랩 시작 -->
	<script src="boot_g/js/jquery-3.3.1.min.js"></script>
	<script src="boot_g/js/owl.carousel.min.js"></script>
	<script src="boot_g/js/aos.js"></script>
	<script src="boot_g/js/main.js"></script>
	
	<!-- 부트슻트랩 끝 -->



	<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>



</html>