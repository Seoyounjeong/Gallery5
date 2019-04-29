<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.hk1.gallery.dto.GalleryDto"%>
<%@page import="com.hk1.gallery.dto.DabgeulDto"%>
<%@page import="java.util.List"%> 
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


<!-- 답글 ajax처리 -->


<!-- 답글쓰기 -->
<script type="text/javascript">

function insertDabgeule() {
	

	var e_no = document.getElementsByName("e_no")[0].value;
	var d_content = document.getElementsByName("d_content")[0].value;
	var m_no = document.getElementsByName("m_no")[0].value;
	var m_name = document.getElementsByName("m_name")[0].value;

	

	$.ajax({
		url: "DabgeulInsertAjax.do",  
		
		data:
			{"e_no":e_no,
			"d_content":d_content,
			"m_no":m_no,
			"m_name":m_name},

		method:"post", 		
		success:function(obj){ 
/* 			alert(obj.dlist[0].m_name);
			alert(obj.dlist[0].m_regdate()); */

  			if(obj=="y"){				
			
 			
 			location.reload();
  			}
 			
		},
		
		error:function(){
			alert("서버통신 실패")
		}
		
	});
	
};

</script>

<% DabgeulDto Ddto =(DabgeulDto)session.getAttribute("Ddto"); %>


<div>

<div>감상평</div>
<input type="text" name="e_no" value="${Ddto.e_no }">
<input type="text" name="m_no" value="${Ddto.m_no }">
<input type="text" name="m_name" value="가가가">

<div><textarea id="a" name="d_content" rows="5" cols="40"></textarea> </div>

<input type="button" value="평등록" onclick="insertDabgeule()">

</div>




<div>

<!-- 답글리스트 불러오기 가져오기 -->
<% List<DabgeulDto> Dlist =(List<DabgeulDto>)request.getAttribute("Dlist"); %>

<table border="1">

	<%
		for(DabgeulDto Dadto:Dlist){
			%>
			
			<tr>
			<td><%=Dadto.getM_name()%></td>
			<td><%=Dadto.getD_content()%></td>
			<td><%=Dadto.getM_regdate()%></td>
			
			<%-- <td style="display: none;"><%=Dadto.getD_no()%></td>
			<td style="display: none;"><%=Dadto.getE_no()%></td>
			<td style="display: none;"><%=Dadto.getM_no()%></td> --%>

			</tr>
			<% 
		}
	%>
	


	
</table>


</div>


</body>
</html>