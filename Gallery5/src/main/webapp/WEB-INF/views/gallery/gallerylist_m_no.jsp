<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@page import="java.util.List"%>    
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>




<!DOCTYPE html>
<html>
<head>


<% List<GalleryDto>list =(List<GalleryDto>)request.getAttribute("list"); %>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style type="text/css">
#Galletylist_Setion{display: inline-block; border: 1px solid black; margin: 10px;}

#Galletylist_Setion div {border: 1px solid black; width: 200px; margin: 10px;}
#Galletylist_Setion span {border-right: 1px solid black; margin-right:5px; }

</style>

</head>


<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<!-- <h4 onclick="location.href='gallerylist.do'">갤러리목록</h4> -->
<h4 onclick="location.href='insertGalleryForm.do'">갤러리 추가로 가자 </h4>

<!-- <h4 onclick="location.href='selectG_stateGalleryList.do'"> 스테이트로 볼때 3인 갤러리만 불러오자 </h4> -->

<!-- <h4 onclick="location.href='selectM_noGalleryList.do'">mno로볼때 내갤러리를 볼때 페이지 2인 갤러리만 불러오자 돈많은놈 갤러리 2개 이상 </h4> -->

<!-- <h4 onclick="location.href='DabgeulList.do'">충돌이나니 답글을 분리해봅시다다ㄴ </h4> -->



<div>




	<%
	
		for(GalleryDto dto:list){
			%>

<div id="Galletylist_Setion">
<div><img style="width: 100px; height: 100px;" alt="대표이미지" src="galleryupload/<%=dto.getG_img1()%>"></div>
<div><span>G_NO</span><a href="selectGallery.do?g_no=<%=dto.getG_no()%>"><%=dto.getG_no()%></a></div>
<div><span>M_NO</span><%=dto.getM_no()%></div>
<div><span>G_NAME</span><%=dto.getG_name()%></div>
<div><span>G_ADRESS</span><%=dto.getG_adress()%></div>
<div><span>G_TEL</span><%=dto.getG_tel()%></div>
<div><span>G_INTRO</span><%=dto.getG_intro()%></div>
<div><span>G_STATE</span><%=dto.getG_state()%></div>
<div><a href="deleteGallery.do?g_no=<%=dto.getG_no()%>">삭제</a></div>
<div><a href="calendallist.do?g_no=<%=dto.getG_no()%>">일정관리</a></div>

</div>

			<% 
		}
	%>




</div>


<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>