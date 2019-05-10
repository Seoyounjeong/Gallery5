<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시리스트</title>


		<link rel="stylesheet" href="A_detail/css/bootstrap.css">
        <link rel="stylesheet" href="A_detail/css/magnific-popup.css">
        <link rel="stylesheet" href="A_detail/css/style.css">
        <link rel="stylesheet" href="A_detail/css/responsive.css" />
   		<script src="A_detail/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<style type="text/css">
div.exhibition_container {
	width: 100%;
	margin: 0 auto;
}

.main-gallery.grid-item img {
	width: 100%;
	height:;
	transition: all 0.6s;
}

.heading-section span {
	font-size: 16px;
	display: block;
	margin-bottom: 5px;
	text-transform: uppercase;
	color: #e2c0bb;
	letter-spacing: 2px;
	text-align: center !important;
	margin: 0;
	padding: 0;
}

.heading-section h2 {
	font-size: 40px;
	font-weight: 600;
	line-height: 1.2;
	color: inherit;
	margin-top: 8px;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	text-align: center !important;
}

.heading-section p {
	font-family: -apple-system, BlinkMacSystemFont;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
}

   
    div.exhibition_container h4{
    	    width: 25%;
    	font-weight: bold;
  	  padding-bottom: 10px;
    	border-bottom: 3px solid rgb(26,26,26);
    	color: rgb(50,50,50);
    }
</style>




<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script> 
    

    
</head>
<jsp:include page="/WEB-INF/views/header.jsp" />
<body>


	
<hr/>
<div class="exhibition_container container"  style="width: 1200px; text-align: center;">
		
	<div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index:;">
          	<span class="subheading">My Exhibition</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>Best exhibition in the room</p>
          </div>
        </div>
<h4>등록된 전시 수정</h4>
<div class="exhibition_detailcontainer">
	<div id="exhibitionList" style="width: 1200px; text-align: center;">
			<c:choose>

					<c:when test="${empty exhibitionList}">
						<h3>현재 전시중인 작품이 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<div class="main-gallery roomy-80" style="overflow: hidden; padding-top: 5px;">
							<div class="grid text-center">
								<c:forEach var="exhibition" items="${exhibitionList}">
									<div class="grid-item transition metal ium">
										<img alt="전시사진" src="exhibitionupload/${exhibition.e_img}">
										
											<h6 >&nbsp</h6>
												<h5 >
													<em>${exhibition.e_title}</em>
												</h5>
											
										
										<a href="updateExhibitionForm.do?e_no=${exhibition.e_no}&a_no=${exhibition.a_no}">전시수정</a><br>
						<a href="deleteExhibition.do?e_no=${exhibition.e_no}&a_no=${exhibition.a_no}">전시삭제</a>
										<!-- End off grid Hover area -->
									</div>
									<!-- End off grid item -->



									<%-- 	<div  style=" width:30%; padding:0; text-align:center; float: left;">
					
						<img src="exhibitionupload/${exhibition.e_img}" width="33%"><br>
						<span>번호 :</span><input type="text" name="e_no" value="${exhibition.e_no}"><br>
						<span>전시명 :</span><input type="text" name="e_title" value="${exhibition.e_title}"><br>
						<span>전시설명 :</span><input type="text" name="e_explain" value="${exhibition.e_explain}"><br>
						<span>작가명</span><input type="text" name="a_name" value="${exhibition.a_name}"><br>
						<span>작가번호 :</span><input type="text" name="a_no" value="${exhibition.a_no}"><br>
						<span>조회수 :</span><input type="text" name="e_click" value="${exhibition.e_click}">
						<a href="detailExhibition.do?e_no=${exhibition.e_no}">전시보기</a>
						<%if(loginMember.getM_grade()==3||loginMember.getM_grade()==6||loginMember.getM_grade()==7){
						%>
						<form action="민규형한테 받을 url" method="post" target="_blank">
							<input type="hidden" name="r_send" value="<%=loginMember.getM_no()%>">
							<input type="hidden" name="r_sendname" value="<%=loginMember.getM_name()%>">
							<input type="hidden" name="r_receive" value="${exhibition.a_no}">
							<input type="hidden" name="r_receivename" value="${exhibition.a_name}">
							<input type="button" value="전시요청" onclick="">
						</form>
						<%}%>
						
					</div>
				 --%>
								</c:forEach>
							</div>
						</div>

					</c:otherwise>
				</c:choose>
			</div><!-- exhibitionList END -->
	</div></div>
	<jsp:include page="/WEB-INF/views/tail.jsp" />
	<!-- JS includes -->

      
        <script src="A_detail/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="A_detail/js/isotope.min.js"></script>
        <script src="A_detail/js/jquery.magnific-popup.js"></script>
        <script src="A_detail/js/slick.min.js"></script>
        <script src="A_detail/js/jquery.collapse.js"></script>
        <script src="A_detail/js/plugins.js"></script>
        <script src="A_detail/js/main.js"></script>
        

	

</body>
</html>