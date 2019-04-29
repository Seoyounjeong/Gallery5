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


<%int year = (Integer)request.getAttribute("year"); %>
<%int month = (Integer)request.getAttribute("month"); %>
<%int date = (Integer)request.getAttribute("date"); %>

<body>

갤러리일정등록


<form action="" method="post">

<div>
<span>일정명</span> <input type="text" name="c_title" required="required">
</div>

<div>
<span>시작일</span> 
<select name="c_start_y">
<%for (int i = 2019; i <= 2025; i++) {
	 %> <option<%if(year==i){
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
	 %> <option<%if(month==i){
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
	 %> <option<%if(date==i){
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
	 %> <option<%if(year==i){
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
	 %> <option<%if(month==i){
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
	 %> <option <%if(date==i){
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
<span>일정소개</span> <textarea rows="40" cols="60"></textarea>
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