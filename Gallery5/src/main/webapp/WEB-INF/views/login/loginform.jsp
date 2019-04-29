<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html;charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
 <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />


<h5 >고객님의 가입절차 간소화를 위해 기존 NAVER ID로 가입가능합니다</h5>
 	<br />
 	<br />
 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login" style="width:100%; text-align: center; "></div>
   <script type="text/javascript">
  	var naver_id_login = new naver_id_login("hLTvPHLd1LLQ8ya4xFEp", "http://localhost:8888/gallery/callback.do");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 10,60);
  	naver_id_login.setDomain("http://localhost:8888/gallery");
  	naver_id_login.setState(state);
	/* naver_id_login.setPopup();  */
  	naver_id_login.init_naver_id_login();
  </script>
  
  
<jsp:include page="/WEB-INF/views/tail.jsp" />  
</body>
</html>