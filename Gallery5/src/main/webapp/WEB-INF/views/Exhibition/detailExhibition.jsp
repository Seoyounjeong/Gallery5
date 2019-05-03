<%@page import="java.util.List"%>
<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@page import="com.hk1.gallery.dto.ExhibitionDto"%>
<%@page import="com.hk1.gallery.dto.ItemDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>

<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<%ExhibitionDto exhibition =(ExhibitionDto) request.getAttribute("exhibitionDto"); %>
<%List<ItemDto> itemList =(List<ItemDto>) request.getAttribute("itemList"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전시상세보기</title>
<link rel="stylesheet" href="exhibition/css/detailExhibition.css">
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />
	<div id="detailExhibition">
	<div id="detailExhibition_pageNavi">
		<div class="detailExhibition_pageNavi_div">
		<a href="#detailExhibition_title">전시감상</a><br>
		</div>
		<div  class="detailExhibition_pageNavi_div">
		<a href="#detailExhibition_explain">전시설명</a><br>
		</div>
		<div  class="detailExhibition_pageNavi_div">
		<a href="#detailExhibition_itemDetailBox">작품상세</a><br>
		</div>
		<div  class="detailExhibition_pageNavi_div">
		<a href="#detailExhibition_DabgeulList">감상평</a>
		</div>
	</div>
<!-- 전시 대표이미지 -->
		<div id="detailExhibition_title">
			<div id="detailExhibition_title_img">
			<img alt="전시대표이미지" src="exhibitionupload/<%=exhibition.getE_img()%>" width="80%">
			</div>
			<div id="detailExhibition_title_text">
				<h2><%=exhibition.getE_title()%>展</h2>
                <p><%=exhibition.getA_name()%>作</p>
				<input type="button" value="감상하기" onclick="fullscreenExhibition()">
			</div>
		</div>
		<!-- 해당전시의 작가라면 (전시수정)버튼-->
		<%
		if(loginMember==null){
			
		}else{
		%>
		<%if(exhibition.getA_no()==loginMember.getM_no()){ %>
		<div>
			<form action="updateExhibitionForm.do" method="post"> 
				
				<input type="hidden" name="e_no" value="<%=exhibition.getE_no()%>">
				<input type="hidden" name="a_no" value="<%=exhibition.getA_no()%>">
				<input type="submit" value="전시수정">
			</form>
		</div>
		<%}
		
			if(loginMember.getM_grade()==3||loginMember.getM_grade()==7){
				%>
				<div>
					 
						<input type="button" value="전시요청" onclick="pop('<%=loginMember.getM_no()%>','<%=exhibition.getA_no()%>','<%=exhibition.getA_name()%>','<%=loginMember.getM_name()%>')">
			
				</div>
				<% 
			}
		}
		%>
<script type="text/javascript">

 	function pop(r_send,r_receive,r_receivename,r_sendname) {
	
			
		
			var aa= window.open('insertrequestform.do?r_send='+r_send+'&r_receive='+r_receive+
					'&r_receivename='+r_receivename+'&r_sendname='+r_sendname
					,'window팝업','width=500, height=600,menubar=no,status=no,toolbar=no');
				
		
		
 	}
	

</script>
		<div id="detailExhibition_explain">
<!-- 전시 설명 -->
		<h3>전시 설명</h3>
<!-- 전시명 -->
		<h2><%=exhibition.getE_title()%>展</h2>
<!-- 작가명 -->
		<h4><%=exhibition.getA_name()%>作</h4>
<!-- 전시설명 -->
		<p>"<%=exhibition.getE_explain() %>"</p>
		</div>
<!-- 작품상세보기 (구매)-->
	<div id="detailExhibition_itemDetailBox">
		<h3>작품상세</h3>
		
			<input type="hidden" id="detailExhibition_itemDetailBox_itemListSize" value="<%=itemList.size()%>">
			<% 
			
			for(int i = 0 ; i < itemList.size() ; i++){ 
					if(i==0){
					%>
				
				<div id="detailExhibition_itemDetailBox_content_<%=i%>" class="detailExhibition_itemDetailBox_content">
				<%}else{ %>
				<div  id="detailExhibition_itemDetailBox_content_<%=i%>" class="detailExhibition_itemDetailBox_content" style="display:none;"><%} %>
				
					<div class="detailExhibition_itemDetailBox_content_before_button">
							
							<img src="exhibition/images/detailexhibition_before_button.png" width="50%" onclick="before(<%=i%>)">
					</div>
				
					<div class="detailExhibition_itemDetailBox_content_img_box">
						<img alt="작품이미지" src="itemupload/<%=(itemList.get(i)).getI_img()%>" width="100%" id="detailExhibition_itemDetailBox_content_img_<%=i%>">
					</div>
					<div class="detailExhibition_itemDetailBox_content_text_box">
						
						<span>작품명 : </span><span><%=(itemList.get(i)).getI_name() %></span><br>
						<span>-작품설명-</span><br>
						<p><%=(itemList.get(i)).getI_explain() %></p>
						<span>작품가격 : </span><span><%=(itemList.get(i)).getI_price() %>원</span>
						
						<%if(itemList.get(i).getM_no()==0){ 
						
							if(loginMember!=null){%>
							<input type="button" value="구매하기" onclick="insertKyungmaeButton(<%=itemList.get(i).getI_no()%>)">
							<%}else{ %>
								<form action="loginform.do" method="post">
									<p>(필수)로그인 후 경매 및 구매 서비스를 이용가능합니다</p>
									<input type="submit" value="로그인">
								</form>
								<%}
						}else{ %>
						<h5>낙찰된 작품입니다</h5>
						<%} %>
					</div>
						
						<div class="detailExhibition_itemDetailBox_content_next_button">
							<img src="exhibition/images/detailexhibition_next_button.png" width="50%" onclick="next(<%=i%>)">
							
						</div>
				</div>
				</div>
				
		<%} %>
	</div><!--detailExhibition_itemDetailBox End  -->
	
	
	<script type="text/javascript">
	
	
	
	//전시감상 관련 스크립트
	function fullscreenExhibition(){
		var nowIndex=0;
		//작품배열의 길이
		var size = (document.getElementById("detailExhibition_itemDetailBox_itemListSize").value)-1 ;
		var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+0);
		nowBox.style.display="block"; 
		for(var i = 1; i<=size ; i++){
			var otherBox =document.getElementById("detailExhibition_itemDetailBox_content_"+i);
			otherBox.style.display="none"; 
		}
		var nowImg = document.getElementById("detailExhibition_itemDetailBox_content_img_"+nowIndex);
		nowImg.requestFullscreen();
	
		window.onkeydown = function(e){

			
			
			
			//"←"
			if(e.keyCode==37){
				if(nowIndex<=0){
					nowIndex=size;
					nowImg = document.getElementById("detailExhibition_itemDetailBox_content_img_"+nowIndex);
					var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+0);
					nowBox.style.display="none"; 
					var beforeBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
					beforeBox.style.display="block";
					nowImg.requestFullscreen();
				}else{
					nowIndex=nowIndex-1;
					nowImg = document.getElementById("detailExhibition_itemDetailBox_content_img_"+nowIndex);
					var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+(nowIndex+1));
					nowBox.style.display="none";
					var beforeBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
				    beforeBox.style.display="block";
					nowImg.requestFullscreen();
				}
			}
			//"→"
			
			else if(e.keyCode==39){
				if(nowIndex>=size){
					nowIndex=0;
					nowImg = document.getElementById("detailExhibition_itemDetailBox_content_img_"+nowIndex);
					var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+size);
					nowBox.style.display="none";
					var nextBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
					nextBox.style.display="block";
					nowImg.requestFullscreen();
				}else{
					nowIndex=nowIndex+1;
					nowImg = document.getElementById("detailExhibition_itemDetailBox_content_img_"+nowIndex);
					var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+(nowIndex-1));
					nowBox.style.display="none";
					var nextBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
					nextBox.style.display="block";
					nowImg.requestFullscreen();
					
				}
				
			}
		}
		
	}
	
	
	// 작품 상세보기(구매관련) 스크립트↓ 
	
	function before(nowIndex){
		//작품배열의 길이
		var size = (document.getElementById("detailExhibition_itemDetailBox_itemListSize").value)-1 ;
			
		
			var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
			nowBox.style.display="none";
		
		if(nowIndex-1<0){
			nowIndex=size;
			var beforeBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
			beforeBox.style.display="block";
		
		}else{
			nowIndex=nowIndex-1;
			var beforeBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
			beforeBox.style.display="block";
		}
		
	}
	function next(nowIndex){
		//작품배열의 길이
		var size = (document.getElementById("detailExhibition_itemDetailBox_itemListSize").value)-1 ;
		
		var nowBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
		nowBox.style.display="none";
		
		if(nowIndex+1>size){
			nowIndex=0;
			var nextBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
			nextBox.style.display="block";
		
		}else{
			nowIndex=nowIndex+1;
			var nextBox =document.getElementById("detailExhibition_itemDetailBox_content_"+nowIndex);
			nextBox.style.display="block";
		}
		
	}
	
	//경매 관련 스크립트
	function insertKyungmaeButton(i_no){
		
		var aa= window.open('insertKyungmaeform.do?i_no='+i_no,'window팝업','width=500, height=600,menubar=no,status=no,toolbar=no');
	}
	
	
	//답글 스크립트 ↓  작품 상세보기(구매관련) 스크립트 ↑
	function insertDabgeule() {
   

   var e_no = document.getElementsByName("e_no")[0].value;
   var d_content = document.getElementsByName("d_content")[0].value;
   var m_no = document.getElementsByName("m_no")[0].value;
   var m_name = document.getElementsByName("m_name")[0].value;

   
	if(d_content==""){
		alert("감상평 내용을 입력해주세요!");
	}else{
   $.ajax({
      url: "DabgeulInsertAjax.do",  
      
      data:
         {"e_no":e_no,
         "d_content":d_content,
         "m_no":m_no,
         "m_name":m_name},

      method:"post",       
      success:function(obj){ 
/*          alert(obj.dlist[0].m_name);
         alert(obj.dlist[0].m_regdate()); */

           if(obj=="y"){            
         
          
          location.reload();
           }
          
      },
      
      error:function(){
         alert("서버통신 실패")
      }
      
   });
	}
   
};
	
	
	
	</script>


<!-- 답글 쓰기 / 답글리스트 추가예정 -->
<div id="detailExhibition_DabgeulList">
			<h3>감상평</h3>
			<%if(loginMember!=null){ %>
			<div id="detailExhibition_DabgeulList_insertForm">
				<h4>-감상평 등록</h4>
				<h5>-감상하신 작품에 대한 회원님의 소중한 의견을 부탁드립니다.</h5>
				<input type="hidden" name="e_no" value="<%=exhibition.getE_no()%>">
				<input type="hidden" name="m_no" value="<%=loginMember.getM_no()%>">
				<input type="hidden" name="m_name" value="<%=loginMember.getM_name()%>">
				
				<textarea id="a" name="d_content" rows="1" cols="80"></textarea>
				
				<input type="button" value="평등록" onclick="insertDabgeule()">
			</div>
			<%}else{ %>
			<p>로그인 후 감상평 등록이 가능합니다</p>
			<%} %>
			<!-- 답글리스트 불러오기 가져오기 -->
			
			<% List<DabgeulDto> Dlist =(List<DabgeulDto>)request.getAttribute("Dlist"); %>
			
			<div id="detailExhibition_DabgeulList_List" >
				<h4>-감상평</h4>
				<h5>-회원님들께서 남겨주신 감상평들입니다. 감사합니다</h5>
			   
			   <% if(Dlist!=null){
			      for(DabgeulDto Dadto:Dlist){
			         %>
			         
			         <div  class="detailExhibition_DabgeulList_List_tr">
			         <div class="detailExhibition_DabgeulList_List_name"><%=Dadto.getM_name()%></div>
			         <div class="detailExhibition_DabgeulList_List_content"><%=Dadto.getD_content()%></div>
			         <div class="detailExhibition_DabgeulList_List_regdate"><%=Dadto.getM_regdate()%></div>
			         </div>
			         <%-- <td style="display: none;"><%=Dadto.getD_no()%></td>
			         <td style="display: none;"><%=Dadto.getE_no()%></td>
			         <td style="display: none;"><%=Dadto.getM_no()%></td> --%>
			
			       
			         <% 
			      }}else{
			    	  %>
			    	  <p>작성된 감상평이 없습니다 </p>
			    	  <% 
			      }
			   %>
			</div>
	</div>


	</div><!-- detailExhibition End -->
<jsp:include page="/WEB-INF/views/tail.jsp" />
</body>
</html>