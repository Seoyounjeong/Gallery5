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
<link rel="stylesheet" href="item/css/insertItemForm.css">
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
<jsp:include page="/WEB-INF/views/login/privateGnb.jsp" />	
	<div id="insertItemForm_body">
	<div id="insertItemForm">
		
		<h2>작 품등 록</h2>
	
		<div id="insertItemForm_explain">
			<h3>안내</h3>
			<div>	
				<p>1. 작가님의 작품을 선정해주세요 </p>
				<p>2. (필수) 작품 이미지 업로드  </p>
				<p>3. (필수) 작품명  작성</p>
				<p>4. (필수) 작품 설명 작성 </p>
				<p>5. (필수) 작품가격 선정(최초 경매 시작가)  </p>
			</div>		
			</div>
			
		
			
			
			
		<div id="insertItemForm_main_content">
			<h3>작품등록</h3>
			
			<form action="insertItem.do" method="post" enctype="multipart/form-data">
				
				<div id="insertItemForm_main_content_filebox">
					<h5>작품 업로드</h5>
						<p>업로드하신 이미지가 표시됩니다</p>
						<div id="insertItemForm_fileupload_showbox" style="display:none;">
							<img id="insertItemForm_fileupload_showbox_img" src="#" alt="미리보기이미지" width="40%">
						</div>
						<label for="insertItemForm_fileupload">작품 업로드
					<input type="file" name="filename" required="required" id="insertItemForm_fileupload">
					</label>
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
			 <div id="insertItemForm_main_content_explain">
			 <h5>작품 상세 설명</h5>
			 		<div id="insertItemForm_main_content_explain_title_price">
					<span>작품 제목  </span>
					<input type="text" name="i_name" size="30%"
					 required="required"
					><br>
				
				
					<span>작품 가격  </span>
					<input type="text" name="i_price" size="30%"
					 required="required"
					 title="금액만 입력 가능합니다"
					 pattern="[0-9]{1,22}"><br>
					</div>
				<p>작품해석</p>
				 
				<div id="insertItemForm_main_content_explain_explain">
				<textarea rows="10" cols="100%" name="i_explain" required="required"></textarea>
				<br>
				<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
				
				<input type="submit" value="작품등록" id="insertItemForm_main_content_explain_explain_submit">
				</div>
			</div>
				</form>
			<script type="text/javascript">
			$("#insertItemForm_main_content_explain_explain_submit").click(function(){
				var file = document.getElementById("insertItemForm_fileupload_showbox_img");
				if(file.naturalWidth==0){
					alert("(필수!)작품을 업로드 해주세요 !");
				}
				
			});
			
			
			</script>	
				
		
		</div><!-- insertItemForm_main_content END -->
		<div  id="insertItemForm_moveExhibition">
				<h5>등록된 작품들로전시를 하고 싶다면?</h5>	
				<div>
					<p>이미 전시를 위해 작품을 등록해 놓으셨다면 작품등록이 아닌 전시등록을 해 주시면 됩니다</p>
					<form action="insertExhibitionForm.do" method="post">
					<input type="submit" value="전시등록하기">
					</form>
				</div>
		</div>
		
		
		
	</div><!-- insertItemForm END -->
	</div>
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>