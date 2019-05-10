<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%List<ArtistDto> list = (List<ArtistDto>)request.getAttribute("list");  
System.out.println("이미지 디티오는?+"+list);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가 리스트</title>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cormorant+Garamond:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    
     <link rel="stylesheet" href="boot_g/list/css/magnific-popup.css">
    <link rel="stylesheet" href="boot_g/list/css/animate.css">
    <link rel="stylesheet" href="boot_g/list/css/style.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	function pop(r_send,a_no,r_name,a_name,m_id) {
		
		var a = a_name;
		var aa = window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+a_no+'&r_sendname='+r_name
		+'&r_receivename='+a_name,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
		
	
	}
	</script>

</head>

<jsp:include page="/WEB-INF/views/header.jsp" />
<body>

<hr>

    <div class="container">
    	<div class="row justify-content-center pb-5" >
          <div class="col heading-section text-center ftco-animate" style="z-index: -1;">
          	<span class="subheading">Best Artist</span>
            <h2 class="mb-4">방구석 갤러리</h2>
            <p>A place to introduce new and creative artists</p>
          </div>
        </div>
  
    		<div class="row">
    			
    		<% 
		if(list.size()==0){
			%>
			<!-- <tr> -->
			<h5>---등록된 갤러리가 없습니다.---</h5>
			<!-- </tr> -->
			<% 

}else{
	for(ArtistDto dto:list){ %>
	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>	
    			

    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    				
    				
    				<!-- 이미지 부분  a 태그 안에는 디테일 페이지로 -->
    					<div class="img">
    				<!-- 		<div class="vr"><span>뭐넣을지</span></div> -->
		    				<a href="getartist.do?a_no=<%=dto.getA_no()%>">
		    				<img class="img-fluid" alt="작가대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" style="min-height: 280px; height: 336px; width: 400px;">
		    				</a>
	    				</div>
	    				
	    				
	    				
	    				
	    				<div class="text" style="text-align: center;">
	    					<span><a style="text-decoration: none; font-weight: bold; font-size: 15px; color: black;" href="getartist.do?a_no=<%=dto.getA_no()%>"><%=dto.getA_name() %></a></span>
	    					<!-- 갤러리 이름부분 -->
	    					<h3><a href="getartist.do?a_name=<%=dto.getA_name()%>"></a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<!-- <span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span> -->
		    						
		    						<%-- <span><a href="getartist.do?a_no=<%=dto.getA_no()%>"><%=dto.getA_name() %></a></span> --%>
	    						</div>
	    						<!-- <div class="float-right">
	    							<span class="rate"><a href="#">뭐넣을지 알아서3</a></span>
	    						</div> -->
	    					</div>
	    				</div>
	    				<a href="exhibitionupload/<%=dto.getE_img()%>" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    			</div>
    		
    	
    	<%}else if(loginMember.getM_grade()==3){ %>
    		
    	
    			<div class="col-md-6 col-lg-4 ftco-animate">
    				<div class="project">
    				
    				
   				<!-- 이미지 부분  a 태그 안에는 디테일 페이지로 -->
    					<div class="img">
    				<!-- 		<div class="vr"><span>뭐넣을지</span></div> -->
		    				<a href="getartist.do?a_no=<%=dto.getA_no()%>">
		    				<img class="img-fluid" alt="대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" style="min-height: 280px; height: 336px;min-width: 400px; ">
		    				</a>
	    				</div>
	    				
	    				
	    				
	    				
	    				<div class="text" style="text-align: center;">
	    					<h4 class="price" onclick="pop('<%=loginMember.getM_no()%>','<%=dto.getA_no() %>','<%=loginMember.getM_name() %>','<%=dto.getA_name() %>','<%=loginMember.getM_id() %>')" > 전시요청
	    					
		 
		
							</h4>
	    			
	    					<span ><a style="text-decoration: none; font-weight: bold; font-size: 15px; color: black;" href="getartist.do?a_no=<%=dto.getA_no()%>"><%=dto.getA_name() %></a></span>
	    					<!-- 갤러리 이름부분 -->
	    					<h3><a href="getartist.do?a_name=<%=dto.getA_name()%>"></a></h3>
	    					<div class="star d-flex clearfix">
	    						<div class="mr-auto float-left">
		    						<!-- <span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span>
		    						<span class="ion-ios-star"></span> -->
		    						
		    						
	    						</div>
	    						<!-- <div class="float-right">
	    							<span class="rate"><a href="#">뭐넣을지 알아서</a></span>
	    						</div> -->
	    					</div>
	    				</div>
	    				<a href="exhibitionupload/<%=dto.getE_img()%>" class="icon image-popup d-flex justify-content-center align-items-center">
	    					<span class="icon-expand"></span>
	    				</a>
    				</div>
    	</div>
    	
    <%} %>
		<%}}%>
	
    		

    
    		
    			</div>
    	</div>




<%-- <div>
<h1>작가목록</h1>

	<% 
		if(list.size()==0){
			%>
			<!-- <tr> -->
			<h5>---등록된 작가가 없습니다---</h5>
			<!-- </tr> -->
			<% 
		}else{
	for(ArtistDto dto:list){ %>
	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>
	<div style="width: 30%; padding: 0;text-align: center; float: left;">
		<img alt="작가대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" width="33%"><br/>
		<span>작가번호:<a href="getartist.do?a_no=<%=dto.getA_no()%>"> <%=dto.getA_no() %></a></span><br/>
		<span>작가이름:<%=dto.getA_name() %></span><br/>
		<span>작가개인수상경력:<%=dto.getA_solo() %></span><br/>
		<span>작가단체경력<%=dto.getA_Squard() %></span><br/>
		<span>작가커리어<%=dto.getA_career() %></span><br/>
		<span>작가상태<%=dto.getA_state() %></span><br/>
		</div>
	<%}else if(loginMember.getM_grade()==3){ %>
		<div style="width: 30%; padding: 0;text-align: center; float: left;">
		<img alt="작가대표이미지" src="exhibitionupload/<%=dto.getE_img()%>" width="33%"><br/>
		<span>작가번호:<a href="getartist.do?a_no=<%=dto.getA_no()%>"> <%=dto.getA_no() %></a></span><br/>
		<span>작가이름:<%=dto.getA_name() %></span><br/>
		<span>작가개인수상경력:<%=dto.getA_solo() %></span><br/>
		<span>작가단체경력<%=dto.getA_Squard() %></span><br/>
		<span>작가커리어<%=dto.getA_career() %></span><br/>
		<span>작가상태<%=dto.getA_state() %></span><br/>
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=dto.getA_no() %>','<%=loginMember.getM_name() %>','<%=dto.getA_name() %>','<%=loginMember.getM_id() %>')" >
		<%} %>
		 <%if(loginMember.getM_grade()==3){  %> 
		
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=dto.getA_no() %>','<%=loginMember.getM_name() %>','<%=dto.getA_name() %>')" >
		
		
	</div>
	<%}} %>
	






</div> --%>


 <!-- loader -->
  

  <script src="boot_g/list/js/jquery.min.js"></script>
  <script src="boot_g/list/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="boot_g/list/js/jquery.waypoints.min.js"></script>
	<script src="boot_g/list/js/jquery.stellar.min.js"></script>
	<script src="boot_g/list/js/owl.carousel.min.js"></script>
	<script src="boot_g/list/js/jquery.magnific-popup.min.js"></script>
	<script src="boot_g/list/js/aos.js"></script>
	<script src="boot_g/list/js/scrollax.min.js"></script>
  <script src="boot_g/list/js/main.js"></script>


<jsp:include page="/WEB-INF/views/tail.jsp" />	
</body>
</html>