<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<ItemDto> myItemList =(List<ItemDto>) request.getAttribute("myItemList"); %>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시등록</title>

<link rel="stylesheet" href="exhibition/css/insertExhibitionForm.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<%-- <jsp:include page="/WEB-INF/views/login/privateGnb.jsp" />	 --%>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
	<div id="insertExhibitionForm">
		
			<h3 style="color: rgb(50,50,50);
						width: 17%;
						border-bottom : 3px solid rgb(50,50,50);
						font-weight: bold;
						font-size: 160%;
						padding-bottom: 10px;
						margin-left: 0;">전시등록</h3>
				<p style="	margin-left: 10%;">1 . 전시 대표이미지 등록</p>
				<p style="	margin-left: 10%;">2 . 전시될 작품 선택(등록된 작품 중 전시중이지 않은 작품만 선택 가능합니다)</p>
				<p style="	margin-left: 10%;">3 . 전시 상세 설명 작성(전시명 , 전시 해석 작성)</p>
			
		
			<form action="insertExhibition.do" method="post" enctype="multipart/form-data">
			<h3>전시 대표이미지 등록</h3>
				<p>전시 목록에 표시될 전시 대표 이미지를 등록해 주세요</p>
				<div id="insertExhibitionForm_fileupload_box">
					<label for="insertExhibitionForm_fileupload">대표이미지 업로드
						<input type="file" name="filename" required="required" id="insertExhibitionForm_fileupload">
					</label>
						<div id="insertExhibitionForm_fileupload_showbox" style="display:none;">
							<img id="insertExhibitionForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="50%">
						</div>
				</div>
			<script type="text/javascript">
				$(function(){
					$("#insertExhibitionForm_fileupload").on('change',function(){
						readURL(this);
					});
				});
				
				function readURL(input){
					if(input.files&& input.files[0]){
						var reader = new FileReader();
						
						reader.onload = function(e){
							$("#insertExhibitionForm_fileupload_showbox").slideDown("slow");
							$("#insertExhibitionForm_fileupload_showbox_img").attr("src",e.target.result);
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
			</script>
			
			
			<h3>작품선택</h3>
			<p>전시될 작품을 선택해 주세요</p>
			<p>등록된 작품 중 전시중이지 않은 작품만 선택 가능합니다</p>
			
			
			<div id="insertExhibitionForm_itemlist_box">
				<%if(myItemList.size()==0){ %>
					<h4>※등록하신 작품이 없습니다.</h4>
				<%}else{ %>
					<div id="insertExhibitionForm_itemlist_box_table">
						<%for(int i=0 ; i < myItemList.size() ; i++) {%>
							<%if(i%4==0||i==0) {%>
								<div class="insertExhibitionForm_itemlist_box_tr">
								<%} %>
								<div id="insertExhibitionForm_itemlist_box_cell_<%=i%>"
									 class="insertExhibitionForm_itemlist_box_cell">
									<label for="insertExhibitionForm_itemlist_box_checkbox_<%=i%>">
										<input type="checkbox" name="i_no" value="<%=myItemList.get(i).getI_no()%>" 
																id="insertExhibitionForm_itemlist_box_checkbox_<%=i%>" 
																class="insertExhibitionForm_itemlist_box_checkbox"
																onclick="insertExhibitionForm_img_checked(<%=i%>);">
										<img alt="작품이미지" src="itemupload/<%=myItemList.get(i).getI_img()%>"
															width="100%;"
															
															id="insertExhibitionForm_itemlist_box_img_<%=i%>"
															class="insertExhibitionForm_itemlist_box_img">
									</label>
								</div>
							<%if(i%4==3&&i!=0) {%>
							</div>
							<%} %>
						<%} %>
					</div><!--insertExhibitionForm_itemlist_box_listtable END -->
				<%} %>
				
			<script type="text/javascript">
			
				function insertExhibitionForm_img_checked(i){
					var ss = "insertExhibitionForm_itemlist_box_checkbox_"+i;
					var s =document.getElementById(ss);
					
					
					
					
						if(s.checked){
							
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("opacity","0.3");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("border","10px solid rgb(0,146,69)");
						
						}else{
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("opacity","1");
							$("#insertExhibitionForm_itemlist_box_img_"+i).css("border","none");
						
							
						}
					
				}
			</script>
			
			</div><!-- insertExhibitionForm_itemlist_box END-->
		
			
			<h3>전시설명</h3>
			<p>전시에 대한 해설을 작성해주세요</p>
				<div id="insertExhibitionForm_explain_box">
					<span>전시명  </span>
						<input type="text" name="e_title" required="required"><br>
						<br>
					<span>전시설명</span><br>
					<br>
						<textarea rows="20" cols="130" name="e_explain" required="required"></textarea>
						<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
						<input type="hidden" name="a_name" value="<%=loginMember.getM_name()%>">
					
				</div>
			
			<input type="submit" value="전시등록" id="insertExhibitionForm_submitButton">
		</form>
	
				<script type="text/javascript">
			$("#insertExhibitionForm_submitButton").click(function(){
				var file = document.getElementById("insertExhibitionForm_fileupload_showbox_img");
				
				if($("input:checkbox[name=i_no]").is(":checked") == true) {
					if(file.naturalWidth==0){
						alert("(필수!)전시 대표이미지를 업로드 해주세요 !");
					}
				}else{
					alert("(필수!)작품은 한 개 이상 선택해 주셔야 합니다!")
				}
				
				
			});
			
			
			</script>	
				
	</div><!-- insertExhibitionForm End -->
	
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>