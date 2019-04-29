<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작품등록하기</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/login/privateGnb.jsp" />	
	<div id="insertItemForm">
		<h3>작품등록</h3>
		<p>1.각각의 작품들을 올려주세요</p>
		<p>2.공통된 스토리를 엮어서 하나의 스토리를 가진 전시회를 만들어 주세요 </p>
		<h5>등록된 작품들로전시를하고 싶다면?</h5>
		<form>
		<input type="submit" value="전시하기">
		</form>
		<div>
			<form action="insertItem.do" method="post" enctype="multipart/form-data">
			<input type="file" name="filename" required="required" id="insertItemForm_fileupload">
			<div id="insertItemForm_fileupload_showbox" style="display:none;">
				<img id="insertItemForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="30%">
			</div>
		<script type="text/javascript">
			$(function(){
				$("#insertItemForm_fileupload").on('change',function(){
					readURL(this);
				});
			});
			
			function readURL(input){
				if(input.files&& input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$("#insertItemForm_fileupload_showbox").slideDown("slow");
						$("#insertItemForm_fileupload_showbox_img").attr("src",e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		</script>
			<span>작품명 : </span>
			<input type="text" name="i_name">
			
			<span>작품가격 : </span>
			<input type="text" name="i_price">
			<p>작품설명 : </p>
			<textarea rows="20" cols="100" name="i_explain"></textarea>
			<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">

			
			<input type="submit" value="작품등록">
			</form>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>