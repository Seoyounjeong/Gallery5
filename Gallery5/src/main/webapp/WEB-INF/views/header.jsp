<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.hk1.gallery.dto.MemberDto"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%MemberDto loginMember = (MemberDto)session.getAttribute("loginMember"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="OverlayEffectMenu/css/style.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script src="OverlayEffectMenu/js/cufon-yui.js" type="text/javascript"></script>
<script src="OverlayEffectMenu/js/Aller.font.js" type="text/javascript"></script>
<script type="text/javascript">
			var lastScrollTop = 0,
				delta = 15;
				$(window).scroll(function (event) {
				var st = $(this).scrollTop();
					if (Math.abs(lastScrollTop - st) <= delta) return;
					if ((st > lastScrollTop) && (lastScrollTop > 0)) {
   					 $(".mainHeader").css("top", "-100px");
   					} else {
   					 $(".mainHeader").css("top", "0px");
					}
					lastScrollTop = st;
					});
					
		</script>

<div class="oe_wrapper" style="position: ;">
			<div class="mainHeader" style="position: fixed; background-color: white;">
			<div class="mainLogo" style="position: absolute; left: 50px; top: 10px; z-index: 99"><a href="index.jsp"><img alt="index.jsp" src="logo/logo1.png" width="150" height="auto" ></a> </div>
			<div class="login_wrapper" style="position: absolute; right: 50px; top: 10px; z-index: 99;">
			<%if(loginMember==null){ %>
			<button style=" width: 80px; height: 40px;" class="btn btn-outline-success" onclick="location.href='loginform.do'" >LOGIN</button>
			
			<%}else{ %>
			<button class="btn btn-outline-danger"  onclick="location.href='logout.do'" ><span><%=loginMember.getM_name()%>님 </span>
			<span >LOGOUT</span></button>
			<%} %>
			</div>
			<!-- <div id="oe_overlay" class="oe_overlay"></div> -->
			<ul id="oe_menu" class="oe_menu">
				<li><a href="exhibitionlist.do">전시</a></li>
				
				<li><a href="artistlist.do">작가</a></li>
				<li><a href="gallerylist.do">갤러리</a></li>
				<li><a href="kyungmaelist.do">경매</a></li>
				<%if(loginMember!=null&&loginMember.getM_grade()==0) {%>
				<li><a href="managermain.do">매니저메인</a></li>
				<%}else if(loginMember!=null){ %>
				
				<li><a href="">MY PAGE</a>
				
					<div style="left:-447px;">
						<ul>
						<li class="oe_heading"><a class="oe_body" href="myprivate.do"> 회원정보</a></li>
						</ul>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="myItemList.do"> 구매목록</a></li>
						</ul>
						
						<%if(loginMember!=null&&loginMember.getM_grade()==2){ %>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="#"> 전시관리</a></li>
							<li><a href="insertItemForm.do">작품올리기</a></li>
							<li><a href="insertExhibitionForm.do">전시올리기</a></li>
							<li><a href="artistsItemList.do">작품수정</a></li>
							<li><a href="myExhibitionList.do">전시수정</a></li>
						</ul>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="#">메세지</a></li>
							<li><a href="selectRequestListReceive.do?r_receive=<%=loginMember.getM_no()%>">받은메세지함</a></li>
							<li><a href="selectRequestListSend.do?r_send=<%=loginMember.getM_no()%>">보낸메세지함</a></li>
						</ul>
						
						
						<%}else if(loginMember!=null&&loginMember.getM_grade()==3){ %>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="#">갤러리 관리</a></li>
							<li><a href="selectM_noGalleryList.do">마이 갤러리</a></li>
							<li><a href="insertGalleryForm.do">갤러리 등록</a></li>
						</ul>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="#">메세지</a></li>
							<li><a href="selectRequestListReceive.do?r_receive=<%=loginMember.getM_no()%>">받은메세지함</a></li>
							<li><a href="selectRequestListSend.do?r_send=<%=loginMember.getM_no()%>">보낸메세지함</a></li>
						</ul>
						<%}else if(loginMember!=null&&loginMember.getM_grade()==6){ %>
						<ul>
						<li class="oe_heading"><a class="oe_body" href="#">전시 관리</a></li>
						<li class="oe_heading"><a class="oe_body" href="#">갤러리 관리</a></li>
						</ul>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="#">메세지</a></li>
							<li><a href="selectRequestListReceive.do?r_receive=<%=loginMember.getM_no()%>">받은메세지함</a></li>
							<li><a href="selectRequestListSend.do?r_send=<%=loginMember.getM_no()%>">보낸메세지함</a></li>
						</ul>
					</div>
					<%}else{ %>
						<ul>
							<li class="oe_heading"><a class="oe_body" href="upgradeMember.do">작가·갤러리신청</a></li>
						</ul>
					<%} %>
					<%}%>
				</li>
					
			
				
			</ul>	
			</div>
			
		</div>
		
		 <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
        <script type="text/javascript">
            $(function() {
				var $oe_menu		= $('#oe_menu');
				var $oe_menu_items	= $oe_menu.children('li');
				var $oe_overlay		= $('#oe_overlay');

                $oe_menu_items.bind('mouseenter',function(){
					var $this = $(this);
					$this.addClass('slided selected');
					$this.children('div').css('z-index','9999').stop(true,true).slideDown(200,function(){
						$oe_menu_items.not('.slided').children('div').hide();
						$this.removeClass('slided');
					});
				}).bind('mouseleave',function(){
					var $this = $(this);
					$this.removeClass('selected').children('div').css('z-index','1');
				});

				$oe_menu.bind('mouseenter',function(){
					var $this = $(this);
					$oe_overlay.stop(true,true).fadeTo(200, 0.6);
					$this.addClass('hovered');
				}).bind('mouseleave',function(){
					var $this = $(this);
					$this.removeClass('hovered');
					$oe_overlay.stop(true,true).fadeTo(200, 0);
					$oe_menu_items.children('div').hide();
				})
            });
        </script>
       <div>
       	<br/><br/><br/>
       </div>
	