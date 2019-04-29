<%@page import="com.hk1.gallery.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<%
MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); 
int m_grade = loginMember.getM_grade();
%>

<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>
<div id="privateGnb">

<h1>privateGnb</h1>
	<!-- 공통사항  -->
	<form action="myprivate.do" method="post">
		<input type="submit" value="회원정보">
	</form>
	<form action="myItemList.do">
		<input type="submit" value="구매목록">
	</form>
	<!-- 작가사용자 -->
	<%if(m_grade==2){%>
	
		<input type="button" value="전시관리" id="prvateGnb_exhibitionMange_button">
			<div id="privateGnb_exhibitionManage_div" style="display:none;">
				<form action="insertItemForm.do" method="post">
					<input type="submit" value="작품올리기">
				</form>
				<form action="insertExhibitionForm.do" action="post">
					<input type="submit" value="전시올리기">
				</form>
				<form action="artistsItemList.do" method="post">
					<input type="submit" value="작품수정">
				</form>
				<form action="myExhibitionList.do" method="post">
					<input type="hidden" name="a_no" value="<%=loginMember.getM_no()%>">
					<input type="submit" value="전시수정">
				</form>
			</div>
		
			<input type="button" value="메세지" id="privateGnb_Request_button">
				<div id="privateGnb_Request_div" style="display:none;">
					<form action="selectRequestListReceive.do">
						<input type="hidden" name="r_receive" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="받은메세지함">
					</form>
					<form  action="selectRequestListSend.do">
						<input type="hidden" name="r_send" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="보낸메세지함">
					</form>
				</div>
		
		
		
<!-- 갤러리주인사용자 -->	
	<%}else if(m_grade==3){%>
	<input type="button" value="갤러리" id="prvateGnb_exhibitionMange_button">
			<div id="privateGnb_exhibitionManage_div" style="display:none;">
				<form action="selectM_noGalleryList.do" method="post">
					<input type="submit" value="마이 갤러리">
				</form>


			</div>
		
	<input type="button" value="메세지" id="privateGnb_Request_button">
				<div id="privateGnb_Request_div" style="display:none;">
					<form action="selectRequestListReceive.do">
						<input type="hidden" name="r_receive" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="받은메세지함">
					</form>
					<form  action="selectRequestListSend.do">
						<input type="hidden" name="r_send" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="보낸메세지함">
					</form>
				</div>
<!-- 작가·갤러리주인 사용자 -->
	<%}else if(m_grade==6){%>
	<form>
		<input type="submit" value="전시관리">
	</form>
	<form>
		<input type="submit" value="갤러리관리">
	</form>
	
	<input type="button" value="메세지" id="privateGnb_Request_button">
				<div id="privateGnb_Request_div" style="display:none;">
					<form action="selectRequestListReceive.do">
						<input type="hidden" name="r_receive" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="받은메세지함">
					</form>
					<form  action="selectRequestListSend.do">
						<input type="hidden" name="r_send" value="<%=loginMember.getM_no()%>">
						<input type="submit" value="보낸메세지함">
					</form>
				</div>
<!-- 일반사용자 신청대기중 사용자 -->
	<%}else {%>
	<form action="upgradeMember.do">
		<input type="submit" value="작가·갤러리신청">
	</form>
	<%} %>
</div>
<script>
$(function(){
    $("#prvateGnb_exhibitionMange_button").click(function(){
        $("#privateGnb_exhibitionManage_div").slideToggle();
    });
    $("#privateGnb_Request_button").click(function(){
        $("#privateGnb_Request_div").slideToggle();
    });

    
});
</script>
<hr>
