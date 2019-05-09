<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 


<title>인덱스</title>
</head>
<% MemberDto Ddto = (MemberDto) session.getAttribute("loginMember"); %>
<%-- <%int m_grade=%><%=Ddto.getM_grade() %><%; %> --%>

<script type="text/javascript">
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

	
	//alert(pimg.prop("tagName"));
	
	if (input.files && input.files[0]) {

		var reader = new FileReader();

		reader.onload = function(e) {
			$("#img_u").attr("src", e.target.result);

		}
		reader.readAsDataURL(input.files[0]);
	}

}
</script>



<body>
<jsp:include page="/WEB-INF/views/header.jsp" />


<% if(Ddto==null){%>
		<script type="text/javascript">alert("로그인하자 친구야") 
		window.location.href="loginform.do";
		
	</script>
	
	
	<%-- <%}else{%>sss

	<%if(m_grade==2||m_grade==5||m_grade==8||m_grade==9){%>
	<script type="text/javascript">alert("작가만 하자 친구야") 
		window.location.href="gallerylist.do";
		
	</script> --%>
 	<%}else{%>


	<div style="display: inline-block;"></div>
	
	
<form class="form-horizontal" action="insertGallery.do" method="post" enctype="multipart/form-data">

<div class="container" sty>

<div class="row">
<div class="col">


	


	<%
	int m_grade = Ddto.getM_grade();

	if(m_grade==1){%>

	<input type="hidden" name="m_grade" value="5">
	<%}else{%>
	<input type="hidden" name="m_grade" value="<%=Ddto.getM_grade()%>">		
	<%}%>
	<input type="hidden" name="m_id" value="<%=Ddto.getM_id()%>">
	<input type="hidden" name="m_name" value="<%=Ddto.getM_name()%>">
	<input type="hidden" name="m_address" value="<%=Ddto.getM_address()%>">
	<input type="hidden" name="m_tel" value="<%=Ddto.getM_tel()%>">

	<%}%>

<!-- 	<div class="form-group">
		<label class="col-sm-2 control-label">m_no</label> 
		<div class="col-sm-2"> -->
		<input class="form-control" type="hidden" name="m_no" value="<%= Ddto.getM_no() %>">
<!-- 		</div>
	</div> -->
	

	
	<div class="form-group">
		<label style="max-width: 100px;" class="col-9 control-label">상호명</label> 
		
		<div class="col-8">
		<input class="form-control" type="text" id="id_g_name" name="g_name" required="required">
		</div>
	</div>
	
	

	<div class="form-group">
		<label style="max-width: 100px;" class="col-9 control-label">전화번호</label> 
		<div class="col-8">
		<input class="form-control" type="tel" name="g_tel" required="required">
		</div>
	</div>

	
	<div class="form-group">
		<label  style="max-width: 100px;" class="col-6 control-label">주소</label> 
		<div class="col">
		<textarea class="form-control" style="resize: none;  width: 330px;" rows="2" cols="20" name="g_adress" required="required"></textarea>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col control-label">소갯말</label> 
		<div class="col">
		
		<textarea  class="form-control" style="resize: none; width: 330px; " rows="4"  name="g_intro" required="required"></textarea>
		
		</div>
	</div>
	
	
	</div>
	
	
	
	
	<div class="col">
	

	<div class="form-group">
	
	<label class="col-sm-3 control-label">대표사진</label> 
	
	<div style="display: inline-block;" class="col-sm-3">
	  <button class="btn btn-primary" onclick="imgup(1)">파일등록</button>	
	 </div>
	
	 <div>
	  <input onchange="imageURL(this)" id="gallery_img1" style="display: none;" multiple="multiple" type="file" name="file" required="required">
	 </div>
	</div>
	
	<div class="form-group">
	<label class="col-sm-3 control-label">내부사진2</label> 
	
	<div style="display: inline-block;" class="col-sm-3">
	  <button class="btn btn-primary" onclick="imgup(2)">파일등록</button>	
	 </div>
	
	 <div class="form-group">
	  <input onchange="imageURL(this)" id="gallery_img2" style="display: none;" multiple="multiple" type="file" name="file" required="required">
	 </div>
	 </div>
	 
	 <div class="form-group">
	<label class="col-sm-3 control-label">내부사진3</label> 
	
	<div style="display: inline-block;" class="col-sm-3">
	  <button class="btn btn-primary" onclick="imgup(3)">파일등록</button>	
	 </div>
	
	 <div>
	  <input onchange="imageURL(this)" id="gallery_img3" style="display: none;" multiple="multiple" type="file" name="file" required="required">
	 </div>
	 </div>
	 
	 <div class="form-group">
	<label class="col-sm-3 control-label">내부사진4</label> 
	
	<div style="display: inline-block;" class="col-sm-3">
	  <button class="btn btn-primary" onclick="imgup(4)">파일등록</button>	
	 </div>
	
	 <div>
	  <input onchange="imageURL(this)" id="gallery_img4" style="display: none;" multiple="multiple" type="file" name="file" required="required">
	 </div>
	 </div>
	 
	 
	 <div style="margin: 10px 20px; width: 250px;">
		<input  class=" btn btn-primary" type="submit" value="등록">
	</div>
	 
	<div style="margin: 10px 30px; width: 200px; height: 200px;">
	
		<img style="width: 200px; height: 200px;" id="img_u" alt="" src="">
	
	</div>	
	



	
	
	

	
	
	</div>
	

	
	</div>
	
	
	
	
	</div>
		</form>	 



 	
 	
 	
 	

<%-- <%}%> --%>
 




<jsp:include page="/WEB-INF/views/tail.jsp" />





</body>
</html>