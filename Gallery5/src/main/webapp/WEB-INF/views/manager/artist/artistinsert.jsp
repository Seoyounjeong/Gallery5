<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html;charset=utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작가 추가</title>
</head>
<body>
<h1>작가 추가</h1>

<form action="managerinsertArtist.do" method="post" autocomplete="off">

번호:<input type="text" placeholder="회원번호를 입력하세요" name="a_no" required="required" autocomplete="off"/><br>
이름:<input type="text" placeholder="이름을 입력하세요" name="a_name" required="required" autocomplete="off"/><br>
개인전:
<input type="text" placeholder="개인전 경력을 입력하세요" name="a_solo" required="required" autocomplete="off"/>
<input type="hidden" value="\n"/>
<input type="button" value="추가 " onclick="add_item()"><br>


<!-- <div id="add" style="display:none"> -->
<!-- <input type="text" name="a_solo" value="" style="width:200px"><br> <input type="button" value="삭제" onclick="remove_item(this)"> -->
<!-- </div> -->
<div id="field"></div>


<!-- detail볼때 오류남 -->
단체전:<input type="text" placeholder="단체전 경력을 입력하세요" name="a_Squard" required="required" autocomplete="off"/>
<input type="button" value=" 추가 " onclick="add_item2()"><br>
<!-- <div id="add2" style="display:none"> -->
<!-- <input type="text" name="a_squard" value="" style="width:200px"> <input type="button" value="삭제" onclick="remove_item2(this)"> -->
<!-- </div> -->
<div id="field2"></div>

경력:<input type="text" placeholder="경력란입니다" name="a_career" required="required" autocomplete="off"/>
<input type="button" value=" 추가 " onclick="add_item3()"><br>
<!-- <div id="add3" style="display:none"> -->
<!-- <input type="text" name="a_career" value="" style="width:200px"> <input type="button" value="삭제" onclick="remove_item3(this)"> -->
<!-- </div> -->
<div id="field3"></div>

등급:<input type="text" name="a_state" value="1"/><br>

<input type="submit" value="추가완료"/>

</form>
<script type="text/javascript">
function add_item(){
    // pre_set 에 있는 내용을 읽어와서 처리..
    var div = document.createElement('div');
    var addFiletag=
    	
    	
    	'<input type="text" name="a_solo" value="" autocomplete="off" style="width:200px">'
    	+'<input type="button" value="추가 " onclick="add_item()">'
	
		+'<input type="button" value="삭제" onclick="remove_item(this)">'
    
    div.innerHTML = addFiletag;
    document.getElementById('field').appendChild(div);
}

function remove_item(obj){
    // obj.parentNode 를 이용하여 삭제
    document.getElementById('field').removeChild(obj.parentNode);
}

function add_item2(){
    // pre_set 에 있는 내용을 읽어와서 처리..
    var div2 = document.createElement('div');
    var addFiletag=
    	'<input type="text" name="a_Squard" value="" autocomplete="off" style="width:200px">'
    	+'<input type="button" value=" 추가 " onclick="add_item2()">'
    	 +' <input type="button" value="삭제" onclick="remove_item2(this)">'
    div2.innerHTML = addFiletag;
    document.getElementById('field2').appendChild(div2);
}

function remove_item2(obj){
    // obj.parentNode 를 이용하여 삭제
    document.getElementById('field2').removeChild(obj.parentNode);
}

function add_item3(){
    // pre_set 에 있는 내용을 읽어와서 처리..
    var div3 = document.createElement('div');
    var addFiletag=
    	'<input type="text" name="a_career" value="" autocomplete="off" style="width:200px">'
    	+'<input type="button" value=" 추가 " onclick="add_item3()">'
    	+'<input type="button" value="삭제" onclick="remove_item3(this)">'
    	
    div3.innerHTML = addFiletag;
    document.getElementById('field3').appendChild(div3);
}

function remove_item3(obj){
    // obj.parentNode 를 이용하여 삭제
    document.getElementById('field3').removeChild(obj.parentNode);
}

</script>

</body>
</html>