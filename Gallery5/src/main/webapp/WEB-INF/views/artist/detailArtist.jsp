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

function pop(r_send,a_no,r_name,a_name) {
	var a = a_name;
	var aa = window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+a_no+'&r_sendname='+r_name
	+'&r_receivename='+a_name,'window팝업','width=500, height=600, menubar=no, status=no, toolbar=no');
	

}


</script>



</head>
	
<body>

<jsp:include page="/WEB-INF/views/header.jsp" />
<div class="alldetail_container">
<span><%=artistDto.getA_name() %>作家</span>
<span>	<%if(loginMember==null||loginMember.getM_grade()!=3){ %>
	<span></span>
	<%}else if(loginMember.getM_grade()==3){ %>
		<input type="button" value="전시 요청" 
		onclick="pop('<%=loginMember.getM_no()%>','<%=artistDto.getA_no() %>','<%=loginMember.getM_name() %>','<%=artistDto.getA_name() %>')" >
		<%} %></span>
<hr>
<div class="detail_container">
	<div class="artist_nav">
		<span onclick="detail_itme()">작품</span>
		<span onclick="detail_exhibition()">전시</span>
		<span onclick="detail_artist()">이력</span>
	</div>
	<div class="item_container" id="item_container">
		<h5>작품</h5>
		<%for(ItemDto itemDto: ilist){ %>
			<div style="float: left: ;">
			<img alt="작품사진" src="itemupload/<%=itemDto.getI_img()%>" width="10%" ><br/>
			<span>작품명: <%=itemDto.getI_name()%></span>
			</div>
		<%} %>
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
</body>

</html>