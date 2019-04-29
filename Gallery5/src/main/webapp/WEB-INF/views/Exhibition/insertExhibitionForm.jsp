<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시등록</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/login/privateGnb.jsp" />	
<div id="insertExhibitionForm">
	
		<h3>전시등록</h3>
		<p>내가 올린 작품들을 엮어서 하나의 스토리가 <br>
			담긴 전시로 엮어보세요</p>
		
	<h3>전시 대표이미지 등록</h3>
		<form action="insertExhibition.do" method="post" enctype="multipart/form-data">
			<input type="file" name="filename" required="required" id="insertExhibitonForm_fileupload">
			
			<div id="insertExhibitonForm_fileupload_showbox" style="display:none;">
				<img id="insertExhibitonForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="30%">
			</div>
		<script type="text/javascript">
			$(function(){
				$("#insertExhibitonForm_fileupload").on('change',function(){
					readURL(this);
				});
			});
			
			function readURL(input){
				if(input.files&& input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$("#insertExhibitonForm_fileupload_showbox").slideDown("slow");
						$("#insertExhibitonForm_fileupload_showbox_img").attr("src",e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		</script>
		<h3>작품선택</h3>
		<c:choose>
			<c:when test="${empty myItemList}">
				<h4>※등록하신 작품이 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<div>
					<c:forEach var="item" items="${myItemList}">
					<div style="float:left; width:25%;" >
					<label>
					<input type="checkbox" name="i_no" value="${item.i_no}" >
					<img alt="작품이미지" src="itemupload/${item.i_img}" width="100%" onclick="insertExhibitionForm_img_checked()">
					</label>
					</div>
					</c:forEach>
				</div>
					
				</c:otherwise>
				
		</c:choose>
		
	
		
		<h3 style="clear:both;">전시설명</h3>
		<span>전시명 : </span>
			<input type="text" name="e_title">
		<p>전시설명 : </p>
			<textarea rows="20" cols="100" name="e_explain"></textarea>
		<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
		<input type="hidden" name="a_name" value="<%=loginMember.getM_name()%>">
		<p id="insertExhibitionForm_hidden_p"></p>
		
		
		<input type="submit" value="전시등록">
	</form>
</div><!-- insertExhibitionForm End -->
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>