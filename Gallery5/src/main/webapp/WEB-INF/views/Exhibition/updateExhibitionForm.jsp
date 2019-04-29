<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%ExhibitionDto exhibition =(ExhibitionDto) request.getAttribute("exhibitionDto"); %>
<%List<ItemDto> itemList =(List<ItemDto>) request.getAttribute("itemList"); %>
<%List<ItemDto> myitemList =(List<ItemDto>) request.getAttribute("myitemList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시수정</title>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<div id="updateExhibitionForm">
	<h3>전시수정</h3>
	
	<h3>전시 대표이미지 수정</h3>
		<h5>현재설정된 대표이미지</h5>
		<img alt="" src="exhibitionupload/<%=exhibition.getE_img()%>" width="30%">
		<form action="updateExhibition.do" method="post" enctype="multipart/form-data">
		<h5>대표이미지 변경이미지 업로드</h5>
			<input type="file" name="filename" id="updateExhibitionForm_fileupload">
			<input type="hidden" name="e_img" value="<%=exhibition.getE_img()%>">
			<div id="updateExhibitionForm_fileupload_showbox" style="display:none;">
				<img id="updateExhibitionForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="30%">
			</div>
		<script type="text/javascript">
			$(function(){
				$("#updateExhibitionForm_fileupload").on('change',function(){
					readURL(this);
				});
			});
			
			function readURL(input){
				if(input.files&& input.files[0]){
					var reader = new FileReader();
					
					reader.onload = function(e){
						$("#updateExhibitionForm_fileupload_showbox").slideDown("slow");
						$("#updateExhibitionForm_fileupload_showbox_img").attr("src",e.target.result);
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
		</script>
	<h3>제거할 작품 선택</h3>
				<c:choose>
			<c:when test="${empty itemList}">
				<h4>※등록하신 작품이 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<div>
					<c:forEach var="item" items="${itemList}">
					<div style="float:left; width:10%;">
					<label>
					<input type="checkbox" name="Deletei_no" value="${item.i_no}" >
					<img alt="작품이미지" src="itemupload/${item.i_img}" width="100%">
					</label>
					</div>
					</c:forEach>
				</div>
					
				</c:otherwise>
				
		</c:choose>
	<h3 style="clear:both;">추가할 작품 선택</h3>
				<c:choose>
			<c:when test="${empty myitemList}">
				<h4>※등록하신 작품이 없습니다.</h4>
			</c:when>
			<c:otherwise>
				<div>
					<c:forEach var="item" items="${myitemList}">
					<div style="float:left; width:10%;">
					<label>
					<input type="checkbox" name="Updatei_no" value="${item.i_no}" >
					<img alt="작품이미지" src="itemupload/${item.i_img}" width="100%">
					</label>
					</div>
					</c:forEach>
				</div>
					
				</c:otherwise>
				
		</c:choose>
	
	<h3 style="clear:both;">전시설명</h3>
		<span>전시명 : </span>
			<input type="text" name="e_title" value="<%=exhibition.getE_title()%>">
		<p>전시설명 : </p>
			<textarea rows="20" cols="100" name="e_explain"><%=exhibition.getE_explain()%></textarea>
		<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
		<input type="hidden" name="a_name" value="<%=loginMember.getM_name()%>">
		<input type="hidden" name="e_no" value="<%=exhibition.getE_no()%>">
	<input type="submit" value="수정완료">
	</form>
</div><!--updateExhibitionForm END  -->
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>