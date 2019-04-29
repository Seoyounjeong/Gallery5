<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>callback</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("hLTvPHLd1LLQ8ya4xFEp", "http://localhost:8888/gallery/callback.do");
  // 접근 토큰 값 출력
  /* alert(naver_id_login.oauthParams.access_token); */
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	  //들어온값 확인
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname')); */
  document.getElementById("email").value =naver_id_login.getProfileData('email');
  document.getElementById("nickname").value =naver_id_login.getProfileData('nickname');
   
   
    
  }
</script>
</head>
<body>
<form name=sendForm action="checkMember.do" method="post">
	
		<input type="hidden" name="email" id="email" />
		<input type="hidden" name="nickname" id="nickname"/>
		
	
	</form>
<script  type="text/javascript">
	window.onload = function(){
		

		 document.sendForm.submit();  
	}

</script>
</body>
</html>