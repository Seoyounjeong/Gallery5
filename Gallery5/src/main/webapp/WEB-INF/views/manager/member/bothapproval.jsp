<%@page import="com.hk1.gallery.dto.ArtistDto"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>
<%ArtistDto artistDto=(ArtistDto)request.getAttribute("artistDto");%>
<%GalleryDto galleryDto=(GalleryDto)request.getAttribute("galleryDto");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>승인창</title>
<style>

.main{
position: absolute;
top:150px;
}

.tail{
position :absolute;
top: 1000px;

}

</style>

</head>
<body>
<div class="header">
<jsp:include page="/WEB-INF/views/manager/managerHeader.jsp" />
</div>

<div class="main">
	<h1>작가,갤러리 승인</h1>
<button onclick="updatestate1(${artistDto.a_no})">작가승인</button>
<button onclick="updatestate2(${galleryDto.m_no})">갤러리승인</button>
<button onclick="updatestate3(${memberDto.m_no})">모두승인</button>


<h2>작가신청정보</h2>
	<table border="1">
		<col width="150px;">
		<col width="400px;">
	<tr>
		<th>번호</th>
		<td>${artistDto.a_no}
		
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${artistDto.a_name}
		</td>
	</tr>
	<tr>
		<th>개인전</th>
		<td>${artistDto.a_solo}
		
		</td>
	</tr>
	<tr>
		<th>단체전</th>
		<td>${artistDto.a_Squard}
		
		</td>
	</tr>
	<tr>
		<th>수상경력</th>
		<td>${artistDto.a_career}
		
		</td>
	</tr>
	
</table>


<h2>갤러리 신청정보</h2>
	<table border="1">
	<tr>
		<th>갤러리 번호</th>
		<td>${galleryDto.g_no}</td>
	</tr>
	
	<tr>
		<th>소유주 번호</th>
		<td>${galleryDto.m_no}</td>
	</tr>
	
	<tr>
		<th>갤러리 이름</th>
		<td>${galleryDto.g_name}</td>
	</tr>
	
	<tr>
		<th>갤러리 주소</th>
		<td>${galleryDto.g_adress}</td>
	</tr>
	
	<tr>
		<th>전화번호</th>
		<td>${galleryDto.g_tel}</td>
	</tr>
	
	<tr>
		<th>내부이미지1</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img1()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/${galleryDto.g_img1}">자세히보기</a>
		</tr>
	
	<tr>
		<th>내부이미지2</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img2()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/${galleryDto.g_img2}">자세히보기</a>
		
	</td>
	</tr>
	
	<tr>
		<th>내부이미지3</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img3()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/${galleryDto.g_img3}">자세히보기</a>
		
	</tr>
	
	<tr>
		<th>내부이미지4</th>
		<td>
<%-- 		<img src="uploadFiles/<%=galleryDto.getG_img4()%>" width="300px;" height="300px;"/><br> --%>
		<a href="uploadFiles/${galleryDto.g_img4}">자세히보기</a>
	</tr>
	
	<tr>
		<th>갤러리 소개</th>
		<td>${galleryDto.g_intro}</td>
	</tr>
	</table>
</div>

<div class="tail">
<jsp:include page="/WEB-INF/views/tail.jsp" />
</div>

<script type="text/javascript">
function updatestate1(a_no){
	location.href="managerArtistStateUpdate.do?a_no="+a_no;
}

function updatestate2(m_no){
	location.href="managerGalleryStateUpdate.do?m_no="+m_no;
}

function updatestate3(m_no){
	location.href="managergradeupdate.do?m_no="+m_no;
}


</script>





</body>
</html>