<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html;charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인덱스</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>  

<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/minty/bootstrap.min.css" rel="stylesheet" integrity="sha384-9NlqO4dP5KfioUGS568UFwM3lbWf3Uj3Qb7FBHuIuhLoDp3ZgAqPE1/MYLEBPZYM" crossorigin="anonymous">

<body>



<%String c_return= (String)request.getAttribute("c_return");
int c_start_y = Integer.parseInt((String)request.getAttribute("c_start_y")); 
int c_start_m = Integer.parseInt((String)request.getAttribute("c_start_m"));
int c_start_d = Integer.parseInt((String)request.getAttribute("c_start_d")); 
int g_no=(Integer)request.getAttribute("g_no"); 
int c_no=Integer.parseInt((String)request.getAttribute("c_no")); %>


<div class="container" style="width: 350px; margin-top:30px;">


<form class="form-horizontal" action="updatecallendar.do" method="post">


<input name="c_return" type="hidden" value="<%=c_return%>">
<input name="c_no" type="hidden" value="<%=c_no%>">


<div class="form-group row">

	<div class="col-2.5">
 		<label class="control-label">전시제목</label>
	</div>
	<div class="w-100"></div>
 	<div class="col-2.5">
	<input style="width: 330px;" class="form-control" type="text" name="c_title" required="required">
	</div>

</div>

<div class="form-group row">
<div style="margin-right: 30px;" class="col-2.5">
<label>시작일</label> 
</div>

<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" data-style="btn-primary" name="c_start_y">
<%for (int i = 2019; i <= 2025; i++) {
	 %> <option<%if(c_start_m==i){
		 %> 
	 selected="selected"
	 <% }%> 
	 >
	 <%=i %>
<%

}  %>
</option>
</select>
</div>
<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" name="c_start_m">
<%for (int i = 1; i <= 12; i++) {
	 %> <option<%if(c_start_m==i){
		 %> 
	 selected="selected" 
	 <% }%> 
	 >
	 <%=i %>
<%

}  %>
</option>
</select>
</div>
<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" name="c_start_d">
<%for (int i = 1; i <= 31; i++) {
	 %> <option<%if(c_start_d==i){
		 %> 
	 selected="selected" 
	 <% }%> 
	 
	 >
	 <%=i %>
<%

}  %>
</select>
</div>
</div>

<div class="form-group row">
<div style="margin-right: 30px;" class="col-2.5">
<label>종료일</label> 
</div>
<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" name="c_end_y">
<%for (int i = 2019; i <= 2025; i++) {
	 %> <option<%if(c_start_m==i){
		 %> 
	 selected="selected"
	 <% }%> 
	 >
	 <%=i %>
<%

}  %>
</option>
</select>
</div>
<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" name="c_end_m" onchange="cdate_d(this);">
<%for (int i = 1; i <= 12; i++) {
	 %> <option<%if(c_start_m==i){
		 %> 
	 selected="selected"
	 <% }%> 
	 >
	 <%=i %>
<%

}  %>
</option>
</select>
</div>
<div class="col-2.5" style="margin-right: 15px;">
<select class="form-control" name="c_end_d" onchange="cdate_d(this);">
<%for (int i = 1; i <= 31; i++) {
	 %> <option <%if(c_start_d==i){
		 %> 
	 selected="selected" 
	 <% }%> 
	value="<%=i %>" >
	 <%=i %>
	 
	 
<%

}  %>
</select>
</div>

</div>

<div class="form-group row">
<div class="col-2.5">전시소개</div>
<div class="w-100"></div> 

<textarea class="form-control" style="resize: none; width: 330px;" rows="4" name="c_content" required="required"></textarea>
</div>


 <input type="hidden" name="g_no" value="<%=g_no%>">



<input style="width: 300px;" class="btn btn-success form-control" type="submit" value="일정등록"  >


</form>

</div>


</body>

<script type="text/javascript">

function cdate_d(aa) {

	 var opd =aa.options[aa.selectedIndex].value;
	
	 var eleP=opener.document.getElementsByClassName("d"+opd)[0].nextElementSibling;
	 
	 var c_start_d_v =(document.getElementsByName("c_start_d")[0].selectedIndex)+1;

	 

	 if(eleP==null){
		 
		  if(opd < c_start_d_v){
			  alert("시작일보다 작습니다");
				document.forms[0].reset();
		  }
			
	
	 }else{
		 alert("이미 일정이 존재합니다");
		document.forms[0].reset();

		
		
	 }


}

</script>


</html>