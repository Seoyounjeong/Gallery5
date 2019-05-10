<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%ArtistDto artistDto = (ArtistDto)request.getAttribute("artistDto"); %>
	<%List<ItemDto> ilist =(List<ItemDto>)request.getAttribute("itemDto"); %>
	<%List<ExhibitionDto> elist =(List<ExhibitionDto>)request.getAttribute("exhibitionDto"); %>
	<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<link rel="stylesheet" href="A_detail/css/bootstrap.css">
        <link rel="stylesheet" href="A_detail/css/magnific-popup.css">
        <link rel="stylesheet" href="A_detail/css/style.css">
        <link rel="stylesheet" href="A_detail/css/responsive.css" />
   		<script src="A_detail/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
   		
   
		
<title>상세보기</title>


<style type="text/css">
	body{
		
	}
	
	.exhibition_container{
		display: none;
	}
	.artist_container{
		display: none;	
	}
	div.alldetail_container{
		   width:100%;
    margin: 0 auto;
    
		
	} 
	
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function detail_itme() {
	var item = document.getElementById("item_container").style.display="block";
	var exhibition = document.getElementById("exhibition_container").style.display="none";
	var artist = document.getElementById("artist_container").style.display="none";
}

function detail_exhibition(){
	
	var item = document.getElementById("item_container").style.display="none";
	var exhibition = document.getElementById("exhibition_container").style.display="block";
	var artist = document.getElementById("artist_container").style.display="none";
}

function detail_artist(){
	var item = document.getElementById("item_container").style.display="none";
	var exhibition = document.getElementById("exhibition_container").style.display="none";
	var artist = document.getElementById("artist_container").style.display="block";
}

/* function pop(r_send,a_no,r_name,a_name) {
	var a = a_name;
	var aa = window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+a_no+'&r_sendname='+r_name
	+'&r_receivename='+a_name,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
	

} */


</script>



</head>
<jsp:include page="/WEB-INF/views/header.jsp" />
<body>


<hr>

<div class="alldetail_container"  style="width: 1200px; text-align: center;">

<span style="font-weight: bolder; fone"><%=artistDto.getA_name() %>作家</span>
<%-- <span>	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>
	<span></span>
	<%}else if(loginMember.getM_grade()==3){ %>
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=artistDto.getA_no() %>','<%=loginMember.getM_name() %>','<%=artistDto.getA_name() %>')" >
		<%} %></span> --%>

<div class="detail_container">
	<div class="artist_nav">
		<span onclick="detail_itme()">작품</span>
		<span onclick="detail_exhibition()">전시</span>
		<span onclick="detail_artist()">이력</span>
	</div>
	<div class="item_container" id="item_container">
		
                <!-- Gallery container-->
              
		
		<div class="main-gallery roomy-80" style="overflow:hidden;">
		<div class="grid text-center">
		<%for(ItemDto itemDto: ilist){ %>
			  
                                <div class="grid-item transition metal ium">
                                  	 <img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" >
                                    <div class="grid_hover_area text-center">
                                        <div class="grid_hover_text m-top-110">
                                            <h6 class="text-white">작품명</h6>
                                            <h4 class="text-white"><em><%=itemDto.getI_name() %></em></h4>
                                            <a href="itemupload/<%=itemDto.getI_img()%>" class="popup-img text-white m-top-40">View<i class="fa fa-long-arrow-right"></i></a>
                                        </div>
                                    </div><!-- End off grid Hover area -->
                                </div><!-- End off grid item -->
		
			<%-- <div style="float: left: ;">
			<img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" width="30%" ><br/>
			<span>작품명: <%=itemDto.getI_name()%></span>
			</div> --%>
		
		<%} %>
	</div>
	</div>
	</div>
	
	
	<div class="exhibition_container" id="exhibition_container"">
		<h5>전시</h5>
		<%for(ExhibitionDto exhibitionDto : elist){ %>
		<div style="float: left: ">
		<span><img alt="작가대표이미지" src="exhibitionupload/<%=exhibitionDto.getE_img()%>" width="13%"></span>
		<span>전시 제목:<%=exhibitionDto.getE_title() %></span>
		<span>전시중</span>
		</div>
	<%} %>
	</div>
	
	<div class="artist_container" id="artist_container" >
		<h5>이력</h5>
		<p>번호:<%=artistDto.getA_no() %></p>
		<p>이름:<%=artistDto.getA_name() %></p>
		<p>개인:<%=artistDto.getA_solo() %></p>
		<p>단체:<%=artistDto.getA_Squard() %></p>
		<p>경력:<%=artistDto.getA_career() %></p>
		<p>상태:<%=artistDto.getA_state() %></p>  
	
	</div>
	</div>
	</div>

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