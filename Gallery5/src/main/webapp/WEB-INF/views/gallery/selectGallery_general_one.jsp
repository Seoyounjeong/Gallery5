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
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,900"
	rel="stylesheet">
<link rel="stylesheet" href="gallery/css/bootstrap.min.css">
<link rel="stylesheet" href="gallery/css/owl.carousel.min.css">
<link rel="stylesheet" href="gallery/css/style.css">

<!-- 부트스트랩 끝 -->

<title>인덱스</title>

<style type="text/css">
img {
	width: 100px;
	height: 100px;
}

button {
	width: 99px;
	background-color: #e81050;
	border-radius: 10px;
	border: none;
	color: white;
}


.ud_img {
	display: inline-block;
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


<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />


	<div style="text-align: center; margin: 20px;">

		<div
			style="display: inline-block; border: 1px solid black; margin: 5px"
			onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=one'">안내</div>

		<div style="display: inline-block; border: 1px solid black;"
			onclick="location.href='selectGallery.do?year=<%=year%>&month=<%=month%>&g_no=${galleryDto.g_no}&g_return=two'">전시일정</div>
	</div>






	<section class="site-section">

		<div class="container">
		<div class="row">
			<form action="updateGallery.do" method="post"
				enctype="multipart/form-data">
				<div>
					<input type="hidden" name="g_no" value="${galleryDto.g_no}"
						readonly="readonly">
				</div>
				<div>
					<input type="hidden" name="m_no" value="${galleryDto.m_no}"
						readonly="readonly">
				</div>

				<div class="row">
					<div class="col-lg-6">

					<div class="owl-carousel slide-one-item-alt">
						<img src="galleryupload/${galleryDto.g_img1}" alt="Image" class="img-fluid">
						<img src="galleryupload/${galleryDto.g_img2}" alt="Image" class="img-fluid">
						<img src="galleryupload/${galleryDto.g_img3}" alt="Image" class="img-fluid">
						<img src="galleryupload/${galleryDto.g_img4}" alt="Image" class="img-fluid">
					</div>
					<div class="custom-direction">
						<a href="#" class="custom-prev">Prev</a><a href="#"
							class="custom-next">Next</a>
					</div>

					</div>


					</div>



					<div class="col-lg-5 ml-auto">

					 	<h2 class="section-title mb-3">We Are The Best Consulting
							Agency</h2>
					<!--	<p class="lead">Lorem ipsum dolor sit amet consectetur
							adipisicing elit.</p> -->

						<div>
							<span style="margin-right: 36px;">이름</span> 
							<input style="border: none;" size="30" type="text" name="g_name"
								value="${galleryDto.g_name}" readonly="readonly">
						</div>

						<div>
							<span style="margin-right: 10px;">전화번호</span><input style="border: none;" size="30" type="text" name="g_tel"
								value="${galleryDto.g_tel}">
						</div>
						
						<div>
							<span style="margin-right: 36px;">주소</span> 
							 <textarea style="border: none; resize: none;" name="g_adress" rows="2" cols="40">${galleryDto.g_adress}</textarea> 
							
							<%-- <input style="height: 100px;" type="text" name="g_adress" value="${galleryDto.g_adress}"> --%>
						</div>
						

						<div>
							<span>소개</span> <br />
							<textarea  style="border: none; resize: none;" rows="6" cols="40">${galleryDto.g_intro}</textarea>
						
						
							<%-- <span>g_intro</span> <input type="text" name="g_intro"
								value="${galleryDto.g_intro}"> --%>
						</div>

						<p>
							<input class="btn btn-primary mr-2 mb-2" type="submit"
								value="수정을 해볼가">
						</p>

						<div>
							<input type="hidden" name="g_state" value="${galleryDto.g_state}"
								readonly="readonly">
						</div>

					</div>
					</form>
				</div>
		</div>
	</section>










	<!-- 지도 관련 블락 처리 풀기 -->
	<div id="map" style="width: 500px; height: 400px;">
		<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d61a4dc1efe55edbdfac5ab744921183"></script> -->
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
	<script src="gallery/js/jquery-3.3.1.min.js"></script>
	<script src="gallery/js/owl.carousel.min.js"></script>
	<script src="gallery/js/aos.js"></script>
	<script src="gallery/js/main.js"></script>

	<!-- 부트슻트랩 끝 -->



	<jsp:include page="/WEB-INF/views/tail.jsp" />

</body>



</html>