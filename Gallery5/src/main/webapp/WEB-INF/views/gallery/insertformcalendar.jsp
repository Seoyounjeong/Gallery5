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

<body>

야야야 캘린더 인설트할 준비 됫냐


<form action="insertcallendar.do" method="post">

<div>
<span>전시제목</span> <input type="text" name="c_title" required="required">
</div>

<div>

<%int c_start_y = (Integer)request.getAttribute("c_start_y"); %>
<%int c_start_m = (Integer)request.getAttribute("c_start_m"); %>
<%int c_start_d = (Integer)request.getAttribute("c_start_d"); %>
<span>시작일</span> 
<select name="c_start_y">
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

<select name="c_start_m">
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

<select name="c_start_d">
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

<div>
<span>종료일</span> 
<select name="c_end_y">
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

<select name="c_end_m" onchange="cdate_d(this);">
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


<select name="c_end_d" onchange="cdate_d(this);">
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

<div>
<span>전시소개</span> <textarea rows="4" cols="30" name="c_content" required="required"></textarea>
</div>
<%String g_no=(String)request.getAttribute("g_no"); %>
<div>
<span>G_NO</span> <input type="text" name="g_no" value="<%=g_no%>">
</div>


<input type="submit" value="일정등록"  >


</form>




</body>

<script type="text/javascript">

function cdate_d(aa) {

	
	
	 var opd =aa.options[aa.selectedIndex].value;
	
		//alert(opd);
	 var eleP=opener.document.getElementsByClassName("d"+opd)[0].nextElementSibling;
	 
	 var c_start_d_v =(document.getElementsByName("c_start_d")[0].selectedIndex)+1;
	// alert(c_start_d_v);
	//var c_start_m_v =(document.getElementsByName("c_start_m")[0].selectedIndex)+1;
	 

	 if(eleP==null){
		 
		  if(opd < c_start_d_v){
			  alert("시작일보다 작습니다");
				
				document.forms[0].reset();
		  }
			
	
	 }else{
		 
		
		 //alert((document.getElementsByName("c_start_d")[0].selectedIndex)+1);
		 alert("이미 일정이 존재합니다");
		// alert(document.getElementsByName("c_end_d"));
		//aa.options[aa.selectedIndex].setAttribute("disabled", true);
		//aa.options[aa.selectedIndex].setAttribute("selected", selected);
		//alert(document.getElementsByName("c_end_d")[0].reset());
		//alert(document.getElementsByName("c_end_d"));
	
		
		document.forms[0].reset();
		
		//alert(document.getElementsByName("c_end_d"))[2]
		
		
	 }
	 //.setAttribute("disabled", true)
	 
	 
	// alert(eleP);
	
	// alert(opener.document.getElementsByClassName("d"+asd)[0].textContent.trim());

	//opener.document.getElementsByClassName("d"+asd)[0].textContent.trim()

}

</script>


</html>